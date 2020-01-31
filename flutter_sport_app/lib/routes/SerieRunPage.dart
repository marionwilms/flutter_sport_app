import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../data/Serie.dart';

class SerieRunPage extends StatelessWidget {

  final Serie currentSerie;

  SerieRunPage({Key key, @required this.currentSerie}) : super(key:key);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(currentSerie.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset('images/squat.jpg'),
            Text('Squat'),
            RaisedButton(
              onPressed: () {},
              textColor: Colors.white,
              color: Colors.black,
              child: Text(
                  'suivant',style: TextStyle(fontSize: 20)
              ),
            ),
          ],

        ),
      ),

    );
  }
}