import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'package:kat_centre/Forgot Password/resetPassword.dart';

class ForgotPasswordButton extends StatefulWidget {
  ForgotPasswordButton({this.email, this.formKey});

  final email;
  final formKey;

  @override
  _ForgotPasswordButtonState createState() => _ForgotPasswordButtonState();
}

class _ForgotPasswordButtonState extends State<ForgotPasswordButton> {
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
    /*Material(
      child: ElevatedButton(
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
        child: Text('Send link'),

        //buttonText: 'Send Reset Link');
      ),
    );*/
  }

  sendEmail(String email) async {
    Map data = {'email': email};

    var jsonResponse;
    var response = await http.post(
        Uri.parse("http://192.168.1.184:8000/api/password/forgot"),
        body: data);

    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (jsonResponse != null) {
        setState(() {
          bool isLoading = false;
          isLoading = false;
          print("check mail");
          //createSnackBar('Check your mail', Colors.green, context);
        });
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (BuildContext context) => ResetPassword()),
            (Route<dynamic> route) => false);
      }
    } else {
      setState(() {
        bool isLoading;
        isLoading = false;
        //createSnackBar('Could not send email', Colors.red, context);
      });
      print(email);
      print(response.body);
      print('Response status: ${response.statusCode}');
    }
  }
}
