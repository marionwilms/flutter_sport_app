import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_sport_app/data/Exercise.dart';
import 'dart:convert';
import 'Serie.dart';
import 'globals.dart' as global;


void loadSerie() {
  var serieList = jsonDecode(global.serieListJson);
  List<Exercise> exoL = new List();
  Serie serieInt;
  Exercise exoInt;
  global.title = serieList[0]['title'];
  for (int i=0; i < serieList.length; i++)  {
    for (int j=0; j < serieList[i]['exerciseList'].length; j++) {
      exoInt=Exercise(serieList[i]['exerciseList'][j]['title'], serieList[i]['exerciseList'][j]['lenght']);
      exoL.add(exoInt);
    }
    serieInt=Serie(serieList[i]['title'], serieList[i]['lenght'], exoL);
    global.serieL.add(serieInt);
  }
}
