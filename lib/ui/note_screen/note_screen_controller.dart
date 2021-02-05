import 'dart:async';
import 'dart:collection';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_fft/flutter_fft.dart';
import 'package:get/get.dart';

class NoteScreenController extends GetxController {
  var selectedNote = ''.obs;
  var notes = ['A', 'B', 'C', 'D', 'E', 'F'];
  var percentage = 180.0.obs;
  var stackSizeHeight = 0.0.obs;
  var stackSizeWidth = 0.0.obs;
  var isRecording = false.obs;
  var timer;

  var frequency = 0.0.obs;
  var currentNote = ''.obs;

  GlobalKey stackSize = GlobalKey();
  FlutterFft flutterFft = FlutterFft();

  final _random = new Random();
  void changeSelectedNote() {
    selectedNote.value = notes[next(0, 5)];
  }

  void changePercentage(double per) {
    percentage.value = per;
  }

  int next(int min, int max) => min + _random.nextInt(max - min);
  getSizes() {
    final RenderBox renderBoxRed = stackSize.currentContext.findRenderObject();
    stackSizeHeight.value = renderBoxRed.size.height;
    stackSizeWidth.value = renderBoxRed.size.width;
  }

  listen() async {
    print("starting...");
    await flutterFft.startRecorder();

    isRecording.value = flutterFft.getIsRecording;

    flutterFft.onRecorderStateChanged
        // .transform(
        //   StreamTransformer.fromHandlers(handleData: (data, sink) {
        //     if (timer == null) {
        //       sink.add(data);
        //       timer = Timer(Duration(milliseconds: 100), () {
        //         timer = null;
        //       });
        //     }
        //   }),
        // )
        .listen(
      (data) {
        print(data[1]);
        frequency.value = data[1];
        currentNote.value = data[2];
        flutterFft.setNote = currentNote.value;
        flutterFft.setFrequency = frequency.value;
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) => getSizes());
    // timer = Timer.periodic(Duration(milliseconds: 1000), (_) {
    // setState(() {
    //   viewModel.percentage. = next(220, 320).toDouble();
    // });

    // listen();
    changePercentage(next(220, 320).toDouble());

    // });
  }

  @override
  void onClose() {
    timer.cancel();

    super.onClose();
  }
}
