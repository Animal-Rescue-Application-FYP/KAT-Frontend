import 'package:flutter/material.dart';

class SignUp_Button extends StatefulWidget {
  @override
  _SignUp_ButtonState createState() => _SignUp_ButtonState();
}

class _SignUp_ButtonState extends State<SignUp_Button> {
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
