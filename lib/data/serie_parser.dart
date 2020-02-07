import 'package:flutter_sport_app/data/Exercise.dart';
import 'dart:convert';
import 'Serie.dart';
import 'globals.dart' as global;


void loadSerie() {
  var serieList = jsonDecode(global.serieListJson);
  var serieI;
  var exoJ;
  Serie serieInt;
  Exercise exoInt;
  for (int i=0; i < serieList.length; i++)  {
    serieI = serieList[i];
    List<Exercise> exoL = new List();
    for (int j=0; j < serieI['exerciseList'].length; j++) {
      exoJ = serieI['exerciseList'][j];
      exoInt=Exercise(exoJ['title'], exoJ['lenght']);
      exoL.add(exoInt);
    }
    serieInt=Serie(serieList[i]['title'], serieList[i]['lenght'], exoL);
    global.serieL.add(serieInt);
  }
}
