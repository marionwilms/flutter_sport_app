library my_prj.globals;

import 'Serie.dart';


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
    "title": "etirement1",
    "lenght": "30s"
    },
    {
    "title": "etirement2",
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