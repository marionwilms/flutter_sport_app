import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sport_app/routes/MyHomePage.dart';
import 'package:flutter_sport_app/routes/SerieRunPage.dart';

import '../data/Serie.dart';

class ExerciseDetails extends StatelessWidget {
  final Serie currentSerie;

  ExerciseDetails({Key key, @required this.currentSerie}) : super(key:key);

  Widget _buildListView(BuildContext context) {
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
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          color: Color.fromRGBO(110, 151, 159, 1),),
                      ),
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 12.0),
                      child: Text(
                        currentSerie.exercises[position].length,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'Poppins',
                          color: Color.fromRGBO(110, 151, 159, 1),
                        ),
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
                        child: Image.asset('images/' + currentSerie.exercises[position].title + '.jpg', height: 100,
                          width: 100,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(
              height: 2.0,
              color: Color.fromRGBO(110, 151, 159, 1),
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
        backgroundColor: Color.fromRGBO(110, 151, 159, 0.8),
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
                    /*Container(
                      margin: const EdgeInsets.all(15.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                IconButton(
                                    color: Colors.transparent,
                                    icon: Icon(
                                        Icons.arrow_back_ios,
                                        size: 35.0,
                                        color: Color.fromRGBO(110, 151, 159, 1)
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) =>
                                            MyHomePage(title: 'Training')),
                                      );
                                    }
                                ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                  Text(
                                    currentSerie.title,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 45.0,
                                      letterSpacing: 10.0,
                                      color: Color.fromRGBO(110, 151, 159, 1),
                                    ),
                                  ),

                              ],
                            ),
                          ]
                      ),
                    ),*/

                    Expanded(
                        child: _buildListView(context)
                    ),
                    Container(
                      margin: EdgeInsets.all(10.0),
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>
                                SerieRunPage(currentSerie: currentSerie)),
                          );
                        },
                        textColor: Color.fromRGBO(252, 234, 220, 1),
                        color: Color.fromRGBO(110, 151, 159, 1),
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                            'Commencer', style: TextStyle(fontSize: 20)
                        ),
                      ),
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





