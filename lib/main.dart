import 'package:flutter/material.dart';
import 'package:flutter_sport_app/routes/MyApp.dart';
import 'package:flutter_sport_app/data/serie_parser.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
  loadSerie();
}



