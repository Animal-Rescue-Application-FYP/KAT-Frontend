import 'package:flutter/material.dart';

class SignUpButton extends StatefulWidget {
  @override
  _SignUpButtonState createState() => _SignUpButtonState();
}

class _SignUpButtonState extends State<SignUpButton> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
        // onPressed: null,
        child: Text(
      'REGISTER',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),);
  }
}
