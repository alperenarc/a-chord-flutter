import 'package:flutter_fft/flutter_fft.dart';

class TuneHelper {
  FlutterFft flutterFft = FlutterFft();

  listen() async {
    print("starting...");
    await flutterFft.startRecorder();
    //  context.read<AppProvider>().
    flutterFft.onRecorderStateChanged.listen(
      (data) => {
        // setState(
        //   () => {
        //     frequency = data[1],
        //     note = getNoteString(data[2]),
        //     octave = data[5],
        //   },
        // ),
        // flutterFft.setNote = note,
        // flutterFft.setFrequency = frequency,
      },
    );
  }

  String getNoteString(data) {
    switch (data) {
      case 'A':
        return 'A#';
      case 'B':
        return 'C';
      case 'C':
        return 'C#';
      case 'D':
        return 'D#';
      case 'E':
        return 'F';
      case 'F':
        return 'F#';
      case 'G':
        return 'G#';
      case 'A#':
        return 'B';
      case 'B#':
        return 'C';
      case 'C#':
        return 'D';
      case 'D#':
        return 'E';
      case 'E#':
        return 'F';
      case 'F#':
        return 'G';
      case 'G#':
        return 'A';
      default:
        return 'A';
    }
  }
}

// Tolerance (int) -> data[0]
// Frequency (double) -> data[1];
// Note (string) -> data[2];
// Target (double) -> data[3];
// Distance (double) -> data[4];
// Octave (int) -> data[5];

// NearestNote (string) -> data[6];
// NearestTarget (double) -> data[7];
// NearestDistance (double) -> data[8];
// NearestOctave (int) -> data[9];

// IsOnPitch (bool) -> data[10];
