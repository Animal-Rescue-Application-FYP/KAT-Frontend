import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:kat_centre/Screen/Login.dart';

class ResetPasswordButton extends StatefulWidget {
  ResetPasswordButton(
      {this.formKey, this.token, this.password, this.confirmPassword});
  final formKey;
  final token;
  final password;
  final confirmPassword;
  @override
  _ResetPasswordButtonState createState() => _ResetPasswordButtonState();
}

class _ResetPasswordButtonState extends State<ResetPasswordButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      child: Material(
        borderRadius: BorderRadius.circular(20.0),
        shadowColor: Colors.indigo,
        color: Colors.blue[900],
        elevation: 7.0,
        child: GestureDetector(
          onTap: () {},
          child: Center(
            child: FlatButton(
              child: Text(
                'Reset',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              onPressed: () {
                if (widget.formKey.currentState.validate()) {
                  print('validated');
                  reset(widget.token.text, widget.password.text,
                      widget.confirmPassword.text);
                  print('end');
                }
              },
            ),
          ),
        ),
      ),
    );
    /* ElevatedButton(
      //buttonText: 'Reset',
      child: Text('Reset'),
      onPressed: () {
        if (widget.formKey.currentState.validate()) {
          print('validated');
          reset(widget.token.text, widget.password.text,
              widget.confirmPassword.text);
          print('end');
        }
      },
    );*/
  }

  reset(String token, password, confirmPassword) async {
    Map data = {
      'token': token,
      'password': password,
      'password_confirm': confirmPassword
    };

    var jsonResponse;
    var response = await http.post(
        Uri.parse("http://192.168.1.184:8000/api/password/reset"),
        body: data);
    print('reached here');
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      print('Response status: ${response.statusCode}');
      if (jsonResponse != null) {
        setState(() {
          print('successful');
          //createSnackBar('Password reset successful', Colors.green, context);
        });
      } else {
        setState(() {
          print("Error");
          // createSnackBar('Error', Colors.red, context);
        });
        print(response.body);
        print('Response status: ${response.statusCode}');
      }
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
          (route) => false);
    }
  }
}
