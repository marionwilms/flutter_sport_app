import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'TimerPainter.dart';

class TimerSetter extends StatefulWidget {

  final int timeLenght;
  AnimationController controller;
  TimerSetter({Key key, this.title, @required this.timeLenght}) : super(key:key);

  final String title;

  @override
  _TimerSetterState createState() => _TimerSetterState(timeLenght: timeLenght);
}
class _TimerSetterState extends State<TimerSetter> with TickerProviderStateMixin {
  int timeLenght;
  AnimationController controller;

  _TimerSetterState({Key key, @required this.timeLenght});

  String get timerString {
    Duration duration = controller.duration * controller.value;
    return '${duration.inMinutes}:${(duration.inSeconds %60).toString().padLeft(2,'0')}';
  }

  @override
  void initState(){
    super.initState();
    controller = AnimationController(
        vsync: this,
        duration: Duration(seconds: timeLenght)
    );
  }

  Widget build(BuildContext context){
    return Column(
        children: <Widget> [
          Expanded(
            child: Align(
              alignment: FractionalOffset.center,
              child: AspectRatio(
                aspectRatio: 1.0,
                child: Stack(
                  children: <Widget> [
                    Positioned.fill(
                        child: AnimatedBuilder(
                          animation: controller,
                          builder: (BuildContext context, Widget child){
                            return new CustomPaint(
                                painter: TimerPainter(
                                  animation: controller,
                                  backgroundColor: Colors.white,
                                  color: Color.fromRGBO(110,151,159,1),
                                )
                            );
                          },
                        )

                    ),
                    Align(
                      alignment: FractionalOffset.center,
                      child: Column(
                        children: <Widget>[
                          Text(
                              'Remaining Time'
                          ),
                          AnimatedBuilder(
                              animation: controller,
                              builder: (BuildContext context, Widget child) {
                                return new Text(
                                  timerString,
                                );
                              }
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

        ]
    );
  }
}



