import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:kat_centre/Forgot Password/resetPassword.dart';
import 'package:kat_centre/Forgot%20Password/forgotPassword.dart';

class ForgotPasswordButton extends StatefulWidget {
  ForgotPasswordButton({this.email, this.formKey});

  final email;
  final formKey;

  @override
  _ForgotPasswordButtonState createState() => _ForgotPasswordButtonState();
}

class _ForgotPasswordButtonState extends State<ForgotPasswordButton> {
  bool _isLoading = false;
  void resetSuccess() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Text("Please check you email"),
      actions: <Widget>[
        new RaisedButton(
          child: new Text(
            "OK",
            style: new TextStyle(color: Colors.white),
          ),
          color: Colors.green[500],
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(50.0)),
          onPressed: () {
            setState(() {
              _isLoading = false;
            });
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (BuildContext context) => ResetPassword()),
                (Route<dynamic> route) => false);
          },
        ),
      ],
    );

    showDialog(context: context, child: alertDialog);
  }

  //method to display error message when unregistered email address is entered
  void resetFail() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Text("Please enter registered email address"),
      actions: <Widget>[
        new RaisedButton(
          child: new Text(
            "OK",
            style: new TextStyle(color: Colors.white),
          ),
          color: Colors.green[500],
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(50.0)),
          onPressed: () {
            setState(() {
              _isLoading = false;
            });
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (BuildContext context) => ForgotPassword()),
                (Route<dynamic> route) => false);
          },
        ),
      ],
    );

    showDialog(context: context, child: alertDialog);
  }

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
                'Send Code via Email',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              onPressed: () {
                if (widget.formKey.currentState.validate()) {
                  setState(() {
                    bool isLoading = false;
                    isLoading = !isLoading;
                  });
                  print(widget.email.text);
                  sendEmail(widget.email.text);
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  sendEmail(String email) async {
    Map data = {'email': email};

    var jsonResponse;
    var response = await http.post(
        Uri.parse("http://192.168.0.107:8000/api/password/forgot"),
        body: data);
    //if else loop to validate registered email address
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (jsonResponse != null) {
        setState(() {
          bool isLoading = false;
          isLoading = false;
          print("check mail");
        });
        resetSuccess();
      }
    } else {
      setState(() {
        bool isLoading;
        isLoading = false;
      });
      print(email);
      print(response.body);
      print('Response status: ${response.statusCode}');
      resetFail();
    }
  }
}
