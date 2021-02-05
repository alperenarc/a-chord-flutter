import 'package:flutter/material.dart';
import 'package:flutter_fft/flutter_fft.dart';

class AppProvider extends ChangeNotifier {
  FlutterFft flutterFft = new FlutterFft();
  double frequency;
  String note;
  bool isRecording;
  int octave;

  AppProvider() {
    initAppProvider();
  }

  void initAppProvider() {
    isRecording = flutterFft.getIsRecording;
    note = flutterFft.getNote;
    frequency = flutterFft.getFrequency;
    octave = flutterFft.getOctave;

    notifyListeners();
  }

  Future<void> setNote() async {
    note = flutterFft.getNote;
    notifyListeners();
  }

  Future<void> setFrequency() async {
    frequency = flutterFft.getFrequency;
    notifyListeners();
  }

  Future<void> setoctave() async {
    octave = flutterFft.getOctave;
    notifyListeners();
  }

  Future<void> setIsRecording() async {
    isRecording = flutterFft.getIsRecording;
    notifyListeners();
  }
}
