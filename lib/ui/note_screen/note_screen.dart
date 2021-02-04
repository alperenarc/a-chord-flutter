import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sample/ui/note_screen/note_screen_controller.dart';
import 'package:neon/neon.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class NoteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2d2c34),
      body: SafeArea(
          child: GetX<NoteScreenController>(
        init: NoteScreenController(),
        builder: (viewModel) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                          child: Neon(
                            text: 'Akort',
                            color: Colors.purple,
                            fontSize: 35,
                            font: NeonFont.LasEnter,
                          ),
                        ),
                      ],
                    ),
                    FlatButton(
                      child: Text('Text'),
                      onPressed: () {
                        // setState(() {
                        //   selectedNote = notes[next(0, 5)];
                        // });
                        viewModel.changeSelectedNote();
                      },
                    ),
                    Text(
                      viewModel.selectedNote.value,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 75,
                        color: Colors.white,
                      ),
                    ),
                    Obx(() {
                      return Stack(
                        key: viewModel.stackSize,
                        children: [
                          SfRadialGauge(
                            axes: <RadialAxis>[
                              RadialAxis(
                                minimum: 220,
                                showTicks: false,
                                maximum: 321,
                                startAngle: 220,
                                endAngle: 321,
                                showLabels: false,
                                useRangeColorForAxis: true,
                                canScaleToFit: true, ///////////////////
                                axisLineStyle: AxisLineStyle(
                                  thickness: 8,
                                  color: Colors.red,
                                  gradient: SweepGradient(
                                    colors: const <Color>[
                                      Color(0xff2d2c34),
                                      Color(0xff5f2193),
                                      Color(0xff8a17e6),
                                      Color(0xff8a17e6),
                                      Color(0xff5f2193),
                                      Color(0xff2d2c34),
                                    ],
                                    stops: const <double>[
                                      0.0,
                                      0.2,
                                      0.4,
                                      0.6,
                                      0.8,
                                      1
                                    ],
                                  ),
                                ),
                                pointers: <GaugePointer>[
                                  NeedlePointer(
                                    value: viewModel.percentage.value,
                                    enableAnimation: true,
                                    needleColor: Color(0xfff8be24),
                                    needleEndWidth: 3,
                                    needleStartWidth: 3,
                                    needleLength: 0.8,
                                    knobStyle: KnobStyle(
                                      color: Color(0xff8a17e6),
                                      sizeUnit: GaugeSizeUnit.logicalPixel,
                                      knobRadius: 10,
                                    ),
                                  )
                                ],
                                // annotations: <GaugeAnnotation>[
                                //   GaugeAnnotation(
                                //       widget: Container(
                                //           child: const Text('ad',
                                //               style: TextStyle(
                                //                   fontSize: 25,
                                //                   fontWeight: FontWeight.bold))),
                                //       angle: viewModel.percentage.value,
                                //       positionFactor: 0.5)
                                // ],
                              )
                            ],
                          ),
                          AnimatedPositioned(
                            duration: Duration(milliseconds: 1000),
                            left: viewModel.stackSizeWidth / 3,
                            top: viewModel.stackSizeHeight / 3,
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFF3f3e46)),
                              height: 7,
                              width: 7,
                            ),
                          ),
                          AnimatedPositioned(
                            duration: Duration(milliseconds: 1000),
                            left: viewModel.stackSizeWidth / 2,
                            top: viewModel.stackSizeHeight / 3.4,
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white),
                              height: 7,
                              width: 7,
                            ),
                          ),
                          AnimatedPositioned(
                            duration: Duration(milliseconds: 1000),
                            right: viewModel.stackSizeWidth / 3,
                            top: viewModel.stackSizeHeight / 3,
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFF3f3e46)),
                              height: 7,
                              width: 7,
                            ),
                          ),
                        ],
                      );
                    }),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 50, top: 20),
                color: Color(0xff27262c),
                child: Row(
                  children: [
                    Spacer(),
                    ...viewModel.notes.map((note) {
                      return Expanded(
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease,
                          decoration: BoxDecoration(
                              color: viewModel.selectedNote.value == note
                                  ? Color(0xff8a17e6)
                                  : Colors.transparent,
                              shape: BoxShape.circle),
                          padding: EdgeInsets.all(10),
                          child: Text(
                            note,
                            style: TextStyle(
                              color: Colors.white,
                              // fontSize: selectedNote == note ? 20 : 14,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }).toList(),
                    Spacer(),
                  ],
                ),
              ),
            ],
          );
        },
      )),
    );
  }
}
