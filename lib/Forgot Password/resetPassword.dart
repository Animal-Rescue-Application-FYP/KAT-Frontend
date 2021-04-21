import 'package:flutter/material.dart';
import 'package:kat_centre/Forgot Password/resetButton.dart';
import 'package:kat_centre/Screen/Login.dart';

class ResetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KAT CENTRE'),
        backgroundColor: Colors.blue[900],
      ),
      body: Reset(),
    );
  }
}

class Reset extends StatefulWidget {
  @override
  _ResetState createState() => _ResetState();
}

class _ResetState extends State<Reset> {
  bool _showPassword = false;
  //static const String id='screens.ForgotPassword';
  final _formKey = GlobalKey<FormState>();
  final TextEditingController tokenController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController confirmPasswordController =
      new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Reset Password',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40.0,
                      // color: Colors.blue[900],
                    ),
                  ),
                  SizedBox(height: 15),
                  Column(
                    children: [
                      TextFormField(
                        controller: tokenController,
                        decoration: const InputDecoration(
                          hintText: 'Enter your Token Number',
                          labelStyle: TextStyle(
                            // fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey,
                            fontSize: 18.0,
                          ),
                        ),
                        //controller:widget.tokenController,
                        //keyboardType: TextInputType.text.emailAddress,
                      ),
                      Padding(padding: EdgeInsets.all(10.0)),
                      TextFormField(
                        controller: passwordController,
                        cursorColor: Colors.black87,
                        obscureText: !_showPassword,
                        style: TextStyle(color: Colors.black87),
                        decoration: InputDecoration(
                          hintText: 'Enter your password',
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _showPassword = !_showPassword;
                              });
                            },
                            child: Icon(
                              _showPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                        ),
                        //controller:widget.tokenController,
                        //keyboardType: TextInputType.text.emailAddress,
                      ),
                      Padding(padding: EdgeInsets.all(10.0)),
                      TextFormField(
                        controller: confirmPasswordController,
                        cursorColor: Colors.black87,
                        obscureText: !_showPassword,
                        style: TextStyle(color: Colors.black87),
                        decoration: InputDecoration(
                          hintText: 'Confirm password',
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _showPassword = !_showPassword;
                              });
                            },
                            child: Icon(
                              _showPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                        ),
                        //controller:widget.tokenController,
                        //keyboardType: TextInputType.text.emailAddress,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.fromLTRB(20, 0, 0, 0)),
                      ResetPasswordButton(
                        formKey: _formKey,
                        token: tokenController,
                        password: passwordController,
                        confirmPassword: confirmPasswordController,
                      ),
                      Padding(padding: EdgeInsets.fromLTRB(50, 0, 50, 0)),
                      Container(
                        height: 40.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.red,
                          color: Colors.red[900],
                          elevation: 7.0,
                          child: GestureDetector(
                            onTap: () {},
                            child: Center(
                              child: FlatButton(
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              LoginPage()),
                                      (route) => false);
                                  print(tokenController.text);
                                  print(passwordController.text);
                                  print(confirmPasswordController.text);
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  //buttonText: 'Back'
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
