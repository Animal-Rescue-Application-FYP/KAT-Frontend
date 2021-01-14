import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kat_centre/Screen/ForgotPassword.dart';
import 'package:kat_centre/Constant/Constants.dart';
import 'signup.dart';
import 'package:kat_centre/Screen/HomePage.dart';
import 'package:kat_centre/BottomNavigationBar/bottomnavbar.dart';
import 'package:kat_centre/Screen/NearbyHospitals.dart';


class login_page extends StatefulWidget {
  @override
  _login_pageState createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  bool _showPassword = false;

  @override


  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Login Page'), //for appbar title
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
      ),
      body: SingleChildScrollView( //avoids bottom overflow pixels
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 80.0, 15.0, 0.0),
                    child: Center(
                      child: Image(
                        image: AssetImage(
                            'images/katcentre_logo1.jpg'),
                        width: 150.0,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: 280.0, left: 20.0, right: 20.0),
                    child: Column(
                      children: <Widget>[
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Email Address',
                            labelStyle: TextStyle(
                              // fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey,
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue[900]),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0,),
                        //gives spacing between 2 text fields i.e. email and pw
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              // fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey,
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue[900]),
                            ),
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
                          obscureText: !_showPassword, //makes pw invisible while typing
                        ),
                        SizedBox(height: 5.0),
                        Container(
                          alignment: Alignment(1.0, 0.0),
                          //making an alignment in x and y axis to place text in right side
                          padding: EdgeInsets.only(top: 15.0, left: 20.0),
                          child: FlatButton( //gives tapping effect
                            child: Text('Forgot Password?',
                              style: TextStyle(
                                color: Colors.blue[900],
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => forgot_password()),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 40.0,),
                        Container(
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
                                    'LOGIN',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context) => BottomNavigationPage()),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15.0,),
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
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => sign_up()), //sign_up paila thyo
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
void choiceAction(String choice){
  print('WORKING');
}

