import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_sport_app/routes/MyHomePage.dart';

import '../data/Serie.dart';

class SerieRunPage extends StatefulWidget {

  final Serie currentSerie;
  SerieRunPage({Key key, this.title, @required this.currentSerie}) : super(key:key);

  final String title;

  @override
  _SerieRunPageState createState() => _SerieRunPageState(currentSerie: currentSerie);
}
class _SerieRunPageState extends State<SerieRunPage> {

  final Serie currentSerie;
  Timer _timer;
  int _seconds;

  _SerieRunPageState({Key key, @required this.currentSerie});
  int _counter = 0;
  bool end = false;
  bool lastTimer = false;

  void _incrementCounter() {
    setState(() {
      if (_counter < currentSerie.exercises.length - 1) {
        _counter++;
        if (currentSerie.exercises[_counter].length[0] != 'x') {
          _seconds =
              int.parse(currentSerie.exercises[_counter].length.substring(0, 2));
        }
      }
      else {
        end = true;
      }
    });
  }

  // Time formatting, converted to the corresponding hh:mm:ss format according to the total number of seconds
  String constructTime(int seconds) {
    int minute = seconds % 3600 ~/ 60;
    int second = seconds % 60;
    return  formatTime(minute) + ":" + formatTime(second);
  }

  // Digital formatting, converting 0-9 time to 00-09
  String formatTime(int timeNum) {
    return timeNum < 10 ? "0" + timeNum.toString() : timeNum.toString();
  }

  void _setEnd() {
    setState(() {
      end = true;
    });
  }

  @override
  void initState() {
    super.initState();
    (currentSerie.exercises[_counter].length[0] == 'x')? _seconds= null : _seconds = int.parse(currentSerie.exercises[_counter].length.substring(0,2));
    _startTimer();
  }


  void _startTimer (){
    const period = const Duration(seconds: 1);
    _timer = Timer.periodic(period, (timer) {
      // Callback on time
      setState(() {
        _seconds --;
      });
      if (_seconds == 0) {
        _incrementCounter();
      }
    });
  }


  @override
  Widget _buildButtonSelection (BuildContext context){
    if (end) {
      return RaisedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyHomePage(title: 'Training')),
          );
        },
        textColor: Color.fromRGBO(252, 234, 220, 1),
        padding:EdgeInsets.all(15.0),
        color: Color.fromRGBO(110,151,159,1),
        child: Text(
            'Fin',style: TextStyle(fontSize: 20)
        ),
      );
    }
    else{
      if (currentSerie.exercises[_counter].length[0] == 'x'){
        return RaisedButton(
          onPressed: _incrementCounter,
          textColor: Color.fromRGBO(252, 234, 220, 1),
          padding:EdgeInsets.all(15.0),
          color: Color.fromRGBO(110,151,159,1),
          child: Text(
              'suivant',style: TextStyle(fontSize: 20)
          ),
        );
      }
      else {
        return Text(constructTime(_seconds));
        /*Timer(Duration(seconds: int.parse(currentSerie.exercises[_counter].length.substring(0,2))), () {
          _incrementCounter();
        });
        if (lastTimer) {
          Timer(Duration(seconds: int.parse(currentSerie.exercises[_counter].length.substring(0,2))), () {
            _setEnd();
          });
        }*/
        // return  TimerSetter(timeLenght: int.parse(currentSerie.exercises[_counter].length.substring(0,2)));
      }
    }
  }

  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        color: Color.fromRGBO(252, 234, 220, 1),
        child: Stack(
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.all(15.0),
                    child: Text(
                      currentSerie.title,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 45.0,
                        letterSpacing: 10.0,
                        color: Color.fromRGBO(110,151,159,1),
                      ),
                    ),
                  ),
                  Image.asset('images/' + currentSerie.exercises[_counter].title + '.jpg'),  //all images should be in jpg and added in pubspec.yaml
                  Text(
                    currentSerie.exercises[_counter].title,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18.0,
                      color: Color.fromRGBO(110,151,159,1),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      currentSerie.exercises[_counter].length,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18.0,
                        color: Color.fromRGBO(110,151,159,1),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child : _buildButtonSelection(context)
                  ),
                ],

              ),
            ),
          ]
        ),
      ),

    );
  }
}