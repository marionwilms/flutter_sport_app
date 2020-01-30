import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sport_app/routes/SerieRunPage.dart';

import '../data/Serie.dart';

class ExerciseDetails extends StatelessWidget {
  final Serie currentSerie;

  ExerciseDetails({Key key, @required this.currentSerie}) : super(key:key);

  Widget _buildListView (BuildContext context){
    return ListView.builder(
      itemBuilder: (context, position) {
        return Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding:
                      const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 6.0),
                      child: Text(
                        currentSerie.exercises[position].title,
                        style: TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 12.0),
                      child: Text(
                        currentSerie.exercises[position].length,
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                            Icons.crop_original,
                            size: 35.0,
                            color: Colors.grey
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(
              height: 2.0,
              color: Colors.grey,
            )
          ],
        );
      },
      itemCount: currentSerie.exercises.length,
    );
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
            Expanded(
              child: _buildListView(context)
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SerieRunPage(currentSerie:currentSerie)),
                );
              },
              textColor: Colors.white,
              color: Colors.black,
              child: Text(
                  'Commencer',style: TextStyle(fontSize: 20)
              ),
            ),
          ],

        ),
      ),

    );
  }
}