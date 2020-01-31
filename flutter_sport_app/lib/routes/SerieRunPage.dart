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
class _SerieRunPageState extends State<SerieRunPage>  {

  final Serie currentSerie;

  _SerieRunPageState({Key key, @required this.currentSerie});
  int _counter = 0;
  bool end = false;
  bool lastTimer = false;

  void _incrementCounter() {
    setState(() {
      if (_counter < currentSerie.exercises.length - 2) {
        _counter++;
      }
      else if (currentSerie.exercises[_counter+1].length[0] == 'x'){
          _counter++;
          end = true;
      }
      else {
        _counter++;
        lastTimer = true;
      }
    });
  }

  void _setEnd() {
    setState(() {
      end = true;
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
        Timer(Duration(seconds: int.parse(currentSerie.exercises[_counter].length.substring(0,2))), () {
          _incrementCounter();
        });
        if (lastTimer) {
          Timer(Duration(seconds: int.parse(currentSerie.exercises[_counter].length.substring(0,2))), () {
            _setEnd();
          });
        }
        return Icon(Icons.access_time, color:Color.fromRGBO(110,151,159,1),);
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
                    child : _buildButtonSelection(context),
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