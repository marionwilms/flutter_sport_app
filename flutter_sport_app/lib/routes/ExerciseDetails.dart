import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Serie.dart';

class ExerciseDetails extends StatelessWidget {
  final Serie serieTest;

  ExerciseDetails({Key key, @required this.serieTest}) : super(key:key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(serieTest.title),
      ),
      body: Center(
        child: ListView.builder(
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
                            serieTest.exercises[position].title,
                            style: TextStyle(
                                fontSize: 22.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 12.0),
                          child: Text(
                            serieTest.exercises[position].length,
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
          itemCount: serieTest.exercises.length,
        ),

      ),

    );
  }
}