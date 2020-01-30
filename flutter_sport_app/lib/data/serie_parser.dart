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
//  for (var serie in serieList) {
//    for (var exo in serieList['exerciseList']) {
//      exoInt=Exercise(exo.title, exo.lenght);
//      exoL.add(exoInt);
//    }
//    serieInt=Serie(serie.title, serie.lenght, exoL);
//    global.serieL.add(serieInt);
//  }
}
