import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Color primaryGreen = Color(0xff416d6d);
Color secondaryGreen = Color(0xff16a085);
Color fadedBlack = Colors.black.withAlpha(150);
List<BoxShadow> customShadow = [
  BoxShadow(
    color: Colors.grey[300],
    blurRadius: 30,
    offset: Offset(0, 10),
  ),
];


List<Map> vets = [
  {
    "id": "1",
    "name": "Animal Nepal",
    "contact": "01-5538068",
    "distance": "Lalitpur",
    "imagePath": "images/animalnepal.jpg"
  },
  {
    "id": "2",
    "name": "KAT Centre",
    "contact": "9843810363",
    "distance": "Budhanilkantha",
    "imagePath": "images/katcentre_logo.jpg"
  },
  {
    "id": "3",
    "name": "SPCA Nepal",
    "contact": "01-4370456",
    "distance": "Banepa",
    "imagePath": "images/spca.jpg"
  },
  {
    "id": "4",
    "name": "4 Care",
    "contact": "9851016539",
    "distance": "Dhapakhel",
    "imagePath": "images/4care.jpg"
  },

];




