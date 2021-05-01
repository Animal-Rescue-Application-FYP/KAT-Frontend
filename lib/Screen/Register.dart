import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:kat_centre/Screen/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _isLoading = false;
  bool _showPassword = false;
  void registerPass() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Text("Account Registered Successfully!"),
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
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (BuildContext context) => LoginPage()),
                (Route<dynamic> route) => false);
          },
        ),
      ],
    );

    showDialog(context: context, child: alertDialog);
  }

  //
  void registerFail() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Text("Please enter the correct registration details"),
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
                    builder: (BuildContext context) => Register()),
                (Route<dynamic> route) => false);
          },
        ),
      ],
    );

    showDialog(context: context, child: alertDialog);
  }

//
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
        .copyWith(statusBarColor: Colors.transparent));
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Page'),
        backgroundColor: Colors.blue[900],
      ),
      body: TextSection(),
    );
  }

  register(String name, email, phone, password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
    };
    var jsonResponse;

    var response =
        await http.post("http://192.168.0.107:8000/api/register", body: data);

    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (jsonResponse != null) {
        setState(() {
          _isLoading = false;
        });
        print(response.body);
        sharedPreferences.setString("token", jsonResponse['token']);
      }
      registerPass();
    } else {
      registerFail();
    }
  }

  Container buttonSection() {
    return Container(
      child: Column(children: <Widget>[
        Container(
          //making an alignment in x and y axis to place text in right side
          padding: EdgeInsets.only(top: 15.0, left: 20.0),
          child: InkWell(
            //gives tapping effect
            child: FlatButton(
              child: Text(
                'Already have an account?',
                style: TextStyle(
                  color: Colors.blue[900],
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
          ),
        ),
      ]),
    );
  }

  final TextEditingController registerNameController =
      new TextEditingController();
  final TextEditingController registerEmailController =
      new TextEditingController();
  final TextEditingController registerPhoneController =
      new TextEditingController();
  final TextEditingController registerPasswordController =
      new TextEditingController();
  final TextEditingController confirmPasswordController =
      new TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Container headerSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 30.0),
      child: Center(
        child: Text("Welcome to KAT Registration",
            style: TextStyle(
                color: Colors.blue[900],
                fontSize: 30.0,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}

class TextSection extends StatefulWidget {
  @override
  _TextSectionState createState() => _TextSectionState();
}

class _TextSectionState extends State<TextSection> {
  bool _showPassword = false;
  bool _isLoading = false;

  void registerPass() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Text("Account Registered Successfully!"),
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
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (BuildContext context) => LoginPage()),
                (Route<dynamic> route) => false);
          },
        ),
      ],
    );

    showDialog(context: context, child: alertDialog);
  }

  //method to generate error message when wrong user registration details is entered
  void registerFail() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Text("The password does not match. Please try again"),
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
                    builder: (BuildContext context) => Register()),
                (Route<dynamic> route) => false);
          },
        ),
      ],
    );

    showDialog(context: context, child: alertDialog);
  }

  final TextEditingController registerNameController =
      new TextEditingController();
  final TextEditingController registerEmailController =
      new TextEditingController();
  final TextEditingController registerPhoneController =
      new TextEditingController();
  final TextEditingController registerPasswordController =
      new TextEditingController();
  final TextEditingController confirmPasswordController =
      new TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 30.0),
              child: Center(
                child: Text("Welcome to KAT Registration",
                    style: TextStyle(
                        color: Colors.blue[900],
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            TextFormField(
              controller: registerNameController,
              cursorColor: Colors.black87,
              style: TextStyle(color: Colors.black87),
              decoration: InputDecoration(
                icon: Icon(Icons.person, color: Colors.blue[900]),
                hintText: "Full Name",
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white70)),
                hintStyle: TextStyle(color: Colors.black87),
              ),
            ),
            SizedBox(height: 30.0),
            TextFormField(
              controller: registerEmailController,
              cursorColor: Colors.black87,
              style: TextStyle(color: Colors.black87),
              decoration: InputDecoration(
                icon: Icon(Icons.email, color: Colors.blue[900]),
                hintText: "Email Address",
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white70)),
                hintStyle: TextStyle(color: Colors.black87),
              ),
            ),
            SizedBox(height: 30.0),
            TextFormField(
              controller: registerPhoneController,
              cursorColor: Colors.black87,
              style: TextStyle(color: Colors.black87),
              decoration: InputDecoration(
                icon: Icon(Icons.call, color: Colors.blue[900]),
                hintText: "Phone Number",
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white70)),
                hintStyle: TextStyle(color: Colors.black87),
              ),
            ),
            SizedBox(height: 30.0),
            TextFormField(
              controller: registerPasswordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Required field empty';
                } else {
                  return null;
                }
              },
              cursorColor: Colors.black87,
              obscureText: !_showPassword,
              style: TextStyle(color: Colors.black87),
              decoration: InputDecoration(
                icon: Icon(Icons.lock, color: Colors.blue[900]),
                hintText: "Password",
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white70)),
                hintStyle: TextStyle(color: Colors.black87),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _showPassword = !_showPassword;
                    });
                  },
                  child: Icon(
                    _showPassword ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.0),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Required field empty';
                } else {
                  return null;
                }
              },
              controller: confirmPasswordController,
              cursorColor: Colors.black87,
              obscureText: !_showPassword,
              style: TextStyle(color: Colors.black87),
              decoration: InputDecoration(
                icon: Icon(Icons.lock_clock, color: Colors.blue[900]),
                hintText: "Confirm Password",
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white70)),
                hintStyle: TextStyle(color: Colors.black87),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _showPassword = !_showPassword;
                    });
                  },
                  child: Icon(
                    _showPassword ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
              ),
            ),
            RaisedButton(
              onPressed:
                  //validating registration text form fields
                  registerNameController.text == "" ||
                          registerEmailController.text == "" ||
                          registerPhoneController.text == "" ||
                          registerPasswordController.text == "" ||
                          confirmPasswordController.text == ""
                      ? null
                      : () {
                          setState(() {
                            _isLoading = true;
                            Text('Please wait');
                          });
                          register(
                              registerNameController.text,
                              registerEmailController.text,
                              registerPhoneController.text,
                              registerPasswordController.text);
                        },
              elevation: 0.0,
              color: Colors.blue[900],
              child: Text("Register", style: TextStyle(color: Colors.white70)),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
            FlatButton(
              child: Text(
                'Already have an account?',
                style: TextStyle(
                  color: Colors.blue[900],
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  //function to register user
  register(String name, email, phone, password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
    };
    var jsonResponse;

    var response =
        await http.post("http://192.168.0.107:8000/api/register", body: data);

    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (jsonResponse != null) {
        setState(() {
          _isLoading = false;
        });
        print(response.body);
        sharedPreferences.setString("token", jsonResponse['token']);
      }
      registerPass();
    } else if (confirmPasswordController.text !=
        registerPasswordController.text) {
      registerFail();
      setState(() {
        _isLoading = false;
      });
      print(response.body);
    }
  }
}
