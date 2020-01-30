import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';


import '../data/Serie.dart';

class SerieRunPage extends StatefulWidget {

  final Serie currentSerie;
  SerieRunPage({Key key, this.title, @required this.currentSerie}) : super(key:key);


  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _SerieRunPageState createState() => _SerieRunPageState(currentSerie: currentSerie);
}
class _SerieRunPageState extends State<SerieRunPage>  {

  final Serie currentSerie;

  _SerieRunPageState({Key key, @required this.currentSerie});
  int _counter = 0;
  bool end = false;

  void _incrementCounter() {
    setState(() {
      if (_counter < currentSerie.exercises.length - 2) {
        _counter++;
      }
      else {
        _counter++;
        end = true;
      }
    });
  }

  @override

  Widget _buildButtonSelection (BuildContext context){
    if (end) {
      return RaisedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        textColor: Colors.white,
        color: Colors.black,
        child: Text(
            'Fin',style: TextStyle(fontSize: 20)
        ),
      );
    }
    else{
      if (currentSerie.exercises[_counter].title[0] == 'x'){
        return RaisedButton(
          onPressed: _incrementCounter,
          textColor: Colors.white,
          color: Colors.black,
          child: Text(
              'suivant',style: TextStyle(fontSize: 20)
          ),
        );
      }
      else {
        Timer(Duration(seconds: int.parse(currentSerie.exercises[_counter].length.substring(0,2))), () {
          _incrementCounter();
        });
        return Icon(Icons.access_time);
      }
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(currentSerie.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset('images/' + currentSerie.exercises[_counter].title + '.jpg'),  //all images should be in jpg and added in pubspec.yaml
            Text(currentSerie.exercises[_counter].title),
            Text(currentSerie.exercises[_counter].length),
            _buildButtonSelection(context),
//            !end ? RaisedButton(
//              onPressed: _incrementCounter,
//              textColor: Colors.white,
//              color: Colors.black,
//              child: Text(
//                  'suivant',style: TextStyle(fontSize: 20)
//              ),
//            ):
//            RaisedButton(
//              onPressed: () {
//                Navigator.pop(context);
//              },
//              textColor: Colors.white,
//              color: Colors.black,
//              child: Text(
//                  'Fin',style: TextStyle(fontSize: 20)
//              ),
//            )
          ],

        ),
      ),

    );
  }
}