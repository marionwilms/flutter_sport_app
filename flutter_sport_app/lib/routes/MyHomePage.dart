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
                color: Color.fromRGBO(10,10,10,0.8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
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
                              fontSize: 22.0, fontFamily: 'Poppins', fontWeight: FontWeight.bold, color:Colors.white),
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
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 2.0,
                                      ),
                                      color:Colors.transparent,
                                      shape: BoxShape.circle
                                  ),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    child: Text(global.serieL[position].length,
                                    style: TextStyle(fontSize: 18.0, fontFamily: 'Poppins', color:Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              )],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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
                  Container(
                    margin: const EdgeInsets.all(15.0),
                    child: Text(
                        title,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 45.0,
                          letterSpacing: 10.0,
                          color: Colors.white70,
                        ),
                    ),
                  ),
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