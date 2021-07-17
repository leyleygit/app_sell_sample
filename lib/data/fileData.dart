import 'package:app_sell/pages/addToCard.dart';
import 'package:app_sell/pages/favorite.dart';
import 'package:app_sell/pages/homeScreen.dart';

List<Map> catgory = [
  {
    '_catID': 'cat001',
    'name': 'Durain Khmer',
  },
  {
    '_id': 'cat002',
    'name': 'Durain Thai',
  },
];

List<Map> product = [
  {
    '_proID': 'pro001',
    '_catID': 'cat001',
    'proName': 'chhunly',
    'price': 20000,
    'cost': 18000,
    'img': ['assets/img/5.jpg', 'assets/img/6.jpg', 'assets/img/7.png']
  },
  {
    '_proID': 'pro002',
    '_catID': 'cat002',
    'proName': 'chhun ly',
    'price': 5000,
    'cost': 2000,
    'img':['assets/img/1.jpg','assets/img/2.jpg',],
  }
];
List<Map> order = [];

