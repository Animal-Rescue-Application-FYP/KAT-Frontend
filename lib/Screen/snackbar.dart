import 'package:flutter/material.dart';

void createSnackBar(String message, Color snackBarColor, BuildContext context) {
  final snackBar = SnackBar(
    backgroundColor: snackBarColor,
    content: Text(message),
    duration: Duration(seconds: 2),
  );
  Scaffold.of(context).showSnackBar(snackBar);
}