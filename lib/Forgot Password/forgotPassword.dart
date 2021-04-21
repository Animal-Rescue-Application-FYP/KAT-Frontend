import 'package:flutter/material.dart';
import 'package:kat_centre/Forgot Password/forgotButton.dart';
import 'package:http/http.dart' as http;
import 'package:kat_centre/Controller/databaseHelper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ForgotPassword extends StatefulWidget {
  //const ForgotPassword({Key? key}) : super(key: key);
  // static const String id='screens.ForgotPassword';

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

/// This is the private State class that goes with ForgotPassword
class _ForgotPasswordState extends State<ForgotPassword> {
  //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KAT CENTRE'),
        backgroundColor: Colors.blue[900],
      ),
      body: Forgot(),
    );
  }
}

class Forgot extends StatefulWidget {
  @override
  _ForgotState createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Get a code to Reset your Password',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40.0,
                          // color: Colors.blue[900],
                        ),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          hintText: 'Enter your Email Address',
                          labelStyle: TextStyle(
                            // fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey,
                            fontSize: 18.0,
                          ),
                        ),
                        validator: (emailValue) {
                          if (emailValue == null || emailValue.isEmpty) {
                            return 'Please enter your mail';
                          } else if (!RegExp(
                                  "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                              .hasMatch(emailValue)) {
                            return "Please enter a valid email.";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      ForgotPasswordButton(
                        formKey: _formKey,
                        email: emailController,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
