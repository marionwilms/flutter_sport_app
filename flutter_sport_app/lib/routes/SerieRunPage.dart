import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:flutter_sport_app/routes/MyHomePage.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

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
  AudioCache player = AudioCache(prefix: 'sound/');

  _SerieRunPageState({Key key, @required this.currentSerie});
  int _counter = 0;
  bool end = false;
  bool lastTimer = false;

  void _incrementCounter() {
    setState(() {
      if (_counter < currentSerie.exercises.length - 1 && currentSerie.exercises[_counter+1].length[0] != 'x') {
        _counter++;
        _seconds =
            int.parse(currentSerie.exercises[_counter].length.substring(0, 2));
      }
      else if (_counter < currentSerie.exercises.length - 2 && currentSerie.exercises[_counter+1].length[0] == 'x'){
        _counter++;
      }
      else if (_counter == currentSerie.exercises.length - 2 && currentSerie.exercises[_counter+1].length[0] == 'x'){
        _counter++;
        end = true;
      }
      else{
        end = true;
      }
    });
  }

  // Digital formatting, converting 0-9 time to 00-09
  String formatTime(int timeNum) {
    return timeNum < 10 ? "0" + timeNum.toString() : timeNum.toString();
  }

  @override
  void initState() {
    super.initState();
    (currentSerie.exercises[_counter].length[0] == 'x')? _seconds= null : _seconds = int.parse(currentSerie.exercises[_counter].length.substring(0,2));
    _startTimer();
  }


  void _startTimer (){
    const period = const Duration(seconds: 1);
    player.load('countdown.mp3');
    _timer = Timer.periodic(period, (timer) {
      // Callback on time
      setState(() {
        _seconds --;
      });
      if (_seconds == 4){
        player.play('countdown.mp3');
      }
      if (_seconds == 0) {
        _incrementCounter();
      }
    });
  }

  @override
  Widget _buildButtonSelection (BuildContext context){
    if (end) {
      player.clear('countdown.mp3');
      _timer.cancel();
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
        return Container(
            width: 100.0,
            height: 100.0,
          decoration: BoxDecoration(
              border: Border.all(
                color: Color.fromRGBO(248, 199, 183, 1),
                width: 2.0,
              ),
              color:Colors.transparent,
              shape: BoxShape.circle
          ),
          child: Center(
            child: Text(
                formatTime(_seconds),
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 40.0,
                  color: Color.fromRGBO(110,151,159,1),
                ),
              ),
          )
          );
      }
    }
  }

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(backgroundColor: Color.fromRGBO(110, 151, 159, 0.8),
        iconTheme: IconThemeData(
            color: Color.fromRGBO(252, 234, 220, 1)
        ),
        title: Text(
          currentSerie.title,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 45.0,
            letterSpacing: 10.0,
            color: Color.fromRGBO(252, 234, 220, 1),
          ),
        ),
      ),
      body: Container(
        color: Color.fromRGBO(252, 234, 220, 1),
        child: Stack(
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  Image.asset('images/' + currentSerie.exercises[_counter].title + '.jpg'),  //all images should be in jpg and added in pubspec.yaml
                  Text(
                    currentSerie.exercises[_counter].title,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18.0,
                      color: Color.fromRGBO(110,151,159,1),
                    ),
                  ),
                  (currentSerie.exercises[_counter].length[0] == 'x')? Expanded(
                    child: Text(
                      currentSerie.exercises[_counter].length,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18.0,
                        color: Color.fromRGBO(110,151,159,1),
                      ),
                    ),
                  ):Expanded(
                    child: Container(),
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