import 'package:flutter/material.dart';

void createSnackBar(String message, Color snackBarColor, BuildContext context) {
  final snackbar = SnackBar(
    backgroundColor: snackBarColor,
    content: Text(message),
    duration: Duration(seconds: 2),
  );
  Scaffold.of(context).showSnackBar(snackbar);
}