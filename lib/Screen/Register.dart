import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:kat_centre/Constant/Constants.dart';
import 'Login.dart';
// import 'Registration.dart';
// import 'Decoration.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final TextEditingController nameController = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController confirmPasswordController = new TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
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
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(15.0, 50.0, 15.0, 0.0),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Full Name',
                        labelStyle: TextStyle(
                          // fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue[900]),
                        ),
                      ),
                        validator: (String value){
                        if(value.isEmpty){
                          return "Please enter name";
                        }
                        return null;
                        },
                      onSaved: (String name){
                      },
                    ),
                    SizedBox(height: 20.0,),
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.text,
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
                      validator: (String value){
                        if(value.isEmpty){
                          return "Please enter email address";
                        }
                        if(!RegExp("^[a-zA-Z0-0+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value))
                          {
                            return "Please enter valid email address";
                          }
                        return null;
                      },
                      onSaved: (String email){
                      },
                    ),
                    SizedBox(height: 20.0,),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'New Password',
                        labelStyle: TextStyle(
                          // fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue[900]),
                        ),
                      ),
                      validator: (String value){
                        if (value.isEmpty){
                          return "Please enter password";
                        }
                        return null;
                      },//makes pw invisible while typing
                    ),
                    SizedBox(height: 20.0,),
                    //gives spacing between 2 textfields i.e. email and pw
                    TextFormField(
                      controller: confirmPasswordController,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        labelStyle: TextStyle(
                          // fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue[900]),
                        ),
                      ),
                      validator: (String value){
                        if(value.isEmpty){
                          return "Please re-enter password";
                        }
                        if(passwordController.text != confirmPasswordController.text){
                          return "Password is not matched";
                        }
                        return null;
                      },
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
                            // child: sign_up(),
                            child: FlatButton(
                              child: Text(
                                'REGISTER',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: (){
                                if(formKey.currentState.validate()){
                                  RegistrationUser();
                                  print("Successfully registered!!!");
                                }else{
                                  print("Registration unsuccessful");
                                }
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Future RegistrationUser() async{
    var APIURL = "http://10.0.2.2:8000/api/register";

    Map mappedData = {
      'name': nameController.text,
      'email': emailController.text,
      'password': passwordController.text
    };
    print("JSON DATA: $mappedData");

    http.Response response = await http.post("APIURL", body:mappedData);
    var data = jsonDecode(response.body);

    print("DATA: $data");
  }
}
void choiceAction(String choice){
  print('WORKING');
}
