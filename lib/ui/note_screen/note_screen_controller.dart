import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoteScreenController extends GetxController {
  var selectedNote = ''.obs;
  var notes = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
  ];
  var percentage = 180.0.obs;
  var stackSizeHeight = 0.0.obs;
  var stackSizeWidth = 0.0.obs;
  var timer;
  GlobalKey stackSize = GlobalKey();

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

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) => getSizes());
    timer = Timer.periodic(Duration(milliseconds: 1000), (_) {
      // setState(() {
      //   viewModel.percentage. = next(220, 320).toDouble();
      // });
      changePercentage(next(220, 320).toDouble());
    });
  }

  @override
  void onClose() {
    timer.cancel();
    super.onClose();
  }
}
