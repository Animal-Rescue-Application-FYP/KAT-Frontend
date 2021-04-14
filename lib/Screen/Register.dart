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
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent));
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Page'),
        backgroundColor: Colors.blue[900],
      ),
      body: Container(
        child: _isLoading ? Center(child: CircularProgressIndicator()) : ListView(
          children: <Widget>[
            headerSection(),
            textSection(),
            buttonSection(),
          ],
        ),
      ),
    );
  }
  register(String name, email, phone, password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {
      'name': name,
      'email': email,
      'phone':phone,
      'password': password,
    };
    var jsonResponse;

    var response =
    await http.post("http://10.0.2.2:8000/api/register", body: data);

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
      Navigator.of(context).push(
        new MaterialPageRoute(builder: (BuildContext context) =>
        new LoginPage(),),);
    } else {
      setState(() {
        _isLoading = false;
      });
      print(response.body);
    }
  }
  Container buttonSection() {
    return Container(
      child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 40.0,
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              margin: EdgeInsets.only(top: 15.0),
              child: RaisedButton(
                onPressed: registerNameController.text == "" || registerEmailController.text == "" || registerPhoneController.text == "" || registerPasswordController.text == "" || confirmPasswordController.text == "" ? null : () {
                  setState(() {
                    _isLoading = true;
                    Text('Please wait');
                    //createSnackBar('New user is registered successfully', Colors.green, context);
                  });
                  register(registerNameController.text, registerEmailController.text, registerPhoneController.text, registerPasswordController.text);
                },
                elevation: 0.0,
                color: Colors.blue[900],
                child: Text("Register", style: TextStyle(color: Colors.white70)),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
            Container(
              //making an alignment in x and y axis to place text in right side
              padding: EdgeInsets.only(top: 15.0, left: 20.0),
              child: InkWell( //gives tapping effect
                child: FlatButton(
                  child: Text('Already have an account?',
                    style: TextStyle(
                      color: Colors.blue[900],
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => LoginPage()),
                    );
                  },
                ),
              ),
            ),
          ]
      ),
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

  Container textSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: registerNameController,
            cursorColor: Colors.black87,

            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
              icon: Icon(Icons.person, color: Colors.blue[900]),
              hintText: "Full Name",
              border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white70)),
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
              border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white70)),
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
              border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white70)),
              hintStyle: TextStyle(color: Colors.black87),
            ),
          ),
          SizedBox(height: 30.0),
          TextFormField(
            controller: registerPasswordController,
            cursorColor: Colors.black87,
            obscureText: true,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
              icon: Icon(Icons.lock, color: Colors.blue[900]),
              hintText: "Password",
              border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white70)),
              hintStyle: TextStyle(color: Colors.black87),
            ),
          ),
          TextFormField(
            controller: confirmPasswordController,
            cursorColor: Colors.black87,
            obscureText: true,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
              icon: Icon(Icons.lock_clock, color: Colors.blue[900]),
              hintText: "Confirm Password",
              border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white70)),
              hintStyle: TextStyle(color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }

  Container headerSection() {
    return Container(
      margin: EdgeInsets.only(top: 8.0),
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
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
