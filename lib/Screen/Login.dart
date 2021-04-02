import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:kat_centre/Constant/Constants.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:kat_centre/Screen/Registration.dart';
import 'package:kat_centre/BottomNavigationBar/bottomNavigationBar.dart';
//import 'Register.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent));
    return Scaffold(
      /*appBar: AppBar(
        title: Text('Login Page'),
        backgroundColor: Colors.blue[900],
        actions: <Widget>[ //for toggle menu
          PopupMenuButton<String>(
            onSelected: choiceAction,
            itemBuilder: (BuildContext context){
              return Constants.choices.map((String choice){
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          )
        ],
      ),*/
      body: Container(
        child: _isLoading ? Center(child: CircularProgressIndicator()) : ListView(
          children: <Widget>[
            imageSection(),
            headerSection(),
            textSection(),
            buttonSection(),
            // registrationSection(),
          ],
        ),
      ),
    );
  }

  signIn(String email, pass) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {
      'email': email,
      'password': pass
    };
    var jsonResponse;

    var response = await http.post("http://10.0.2.2:8000/api/login", body: data);
    if(response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if(jsonResponse != null) {
        setState(() {
          _isLoading = false;
        });
        sharedPreferences.setString("token", jsonResponse['token']);
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => BottomNavigationPage()), (Route<dynamic> route) => false);
      }
    }
    else {
      setState(() {
        _isLoading = false;

      });
      print(response.body);
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginPage()), (Route<dynamic> route) => false);
    }
  }

  Container imageSection() {
    return Container(
      padding: EdgeInsets.fromLTRB(15.0, 30.0, 15.0, 0.0),
      child: Center(
        child: Image(
          image: AssetImage(
              'images/KatCentre.jpg'),
          width: 150.0,
        ),
      ),
    );
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
                onPressed: emailController.text == "" || passwordController.text == "" ? null : () {
                  setState(() {
                    _isLoading = true;
                    Text('Please wait');
                  });
                  signIn(emailController.text, passwordController.text);
                },
                elevation: 0.0,
                color: Colors.blue[900],
                child: Text("Sign In", style: TextStyle(color: Colors.white70)),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
            Container(
              //making an alignment in x and y axis to place text in right side
              padding: EdgeInsets.only(top: 15.0, left: 20.0),
              child: InkWell( //gives tapping effect
                child: FlatButton(
                  child: Text('Register a new account',
                    style: TextStyle(
                      color: Colors.blue[900],
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onPressed: (){
                    // Navigator.push(context, MaterialPageRoute(
                    //     builder: (context) => Register()), //sign_up paila thyo
                    // );
                  },
                ),
              ),
            ),
          ]
      ),
    );
  }

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  Container textSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: emailController,
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
            controller: passwordController,
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
        ],
      ),
    );
  }

  Container headerSection() {
    return Container(
      margin: EdgeInsets.only(top: 8.0),
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
      child: Center(
        child: Text("Welcome to KAT Centre",
            style: TextStyle(
                color: Colors.blue[900],
                fontSize: 30.0,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}
void choiceAction(String choice){
  print('WORKING');
}