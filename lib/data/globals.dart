library my_prj.globals;

import 'Serie.dart';


var serieListJson = '''
[
  { "title": "serie1",
  "lenght": "20'",
  "exerciseList": [
    {
    "title": "exercise1",
    "lenght": "30''"
    },
    {
    "title": "exercise2",
    "lenght": "35''"
    }
  ]
  
  },
  {
  "title": "serie2",
  "lenght": "25'",
  "exerciseList": [
    {
    "title": "etirement1",
    "lenght": "30''"
    },
    {
    "title": "etirement2",
    "lenght": "35''"
    }
  ]
  },
  {
  "title": "serie3",
  "lenght": "35'",
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