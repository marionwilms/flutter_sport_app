library my_prj.globals;

import 'Serie.dart';
import 'Exercise.dart';

var title;

//var exo1 = Exercise('etirement1', '30s');
//var exo2 = Exercise('etirement2', '35s');
//var exo3 = Exercise('squat', 'x30');
//var exo4 = Exercise('abdos', 'x40');
//var serie1=Serie('serie1', '20min', [exo1, exo2]);
//var serie2=Serie('serie2', '25min', [exo3, exo4]);
//var serie3=Serie('serie3', '23min', [exo1, exo4]);
//List<Serie> serieL = [serie1, serie2, serie3];
var serieListJson = '''
[
  { "title": "serie1",
  "lenght": "20min",
  "exerciseList": [
    {
    "title": "exercise1",
    "lenght": "30s"
    },
    {
    "title": "exercise2",
    "lenght": "35s"
    }
  ]
  
  },
  {
  "title": "serie2",
  "lenght": "25min",
  "exerciseList": [
    {
    "title": "ETIREMENT1",
    "lenght": "30s"
    },
    {
    "title": "ETIREMENT2",
    "lenght": "35s"
    }
  ]
  },
  {
  "title": "serie3",
  "lenght": "35min",
  "exerciseList": [
    {
    "title": "squat",
    "lenght": "x30"
    },
    {
    "title": "fentes",
    "lenght": "x20"
    }
  ]
  }
]''';




List<Serie> serieL = new List();