import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ExerciseDetails.dart';
import 'package:flutter_sport_app/data/globals.dart' as global;


class MyHomePage extends StatelessWidget {

  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  Widget _buildListView(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, position) {
          return Column(
            children: <Widget>[
              Card(
                color: Color.fromRGBO(110,151,159,0.8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: new InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ExerciseDetails(currentSerie:global.serieL[position])),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding:
                          const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 6.0),
                          child: Text(
                            global.serieL[position].title,
                            style: TextStyle(
                            fontSize: 22.0, fontFamily: 'Poppins', fontWeight: FontWeight.bold, color:Color.fromRGBO(248, 199, 183, 1)),
                          ),
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 12.0),
                          child: Text(
                            global.serieL[position].length,
                            style: TextStyle(fontSize: 18.0, fontFamily: 'Poppins', color:Color.fromRGBO(248, 199, 183, 1),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
                        ),
              Divider(
                height: 10.0,
                color: Colors.transparent,
              )
            ],
          );
        },
        itemCount: global.serieL.length,
      );
  }
  
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: new Image.asset(
              'images/background.jpeg',
              width: size.width,
              height: size.height,
              fit: BoxFit.fill,
            ),
          ),
          Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                      title,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 45.0,
                        letterSpacing: 10.0,
                        color: Color.fromRGBO(110,151,159,1),
                      )),
                  Expanded(
                      child: _buildListView(context)
                  ),
                ]
            ),
          ),
        ]
      )
    );
  }
}