import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KAT CENTRE'),
        backgroundColor: Colors.blue[900],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 50.0, 15.0, 0.0),
          child: Column(
            children: [
              Column(
                children: [
                  Text('Get a code to Reset your Password',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40.0,
                      // color: Colors.blue[900],
                    ),
                  ),
                  SizedBox(height: 40.0,),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Enter your Email Address',
                      labelStyle: TextStyle(
                        // fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey,
                        fontSize: 18.0,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue[900]),
                      ),
                    ),
                  ),
                ],
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
                          'Send Code via Email',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                        onPressed: (){

                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

      ),
    );
  }
}

