// import 'package:flutter/material.dart';
// import 'package:kat_centre/controller/databaseHelper.dart';
//
// class RegisterUser extends StatefulWidget {
//
//   RegisterUser({Key key, this.title}) : super(key : key);
//   final String title;
//
//   @override
//   _RegisterUserState createState() => _RegisterUserState();
// }
//
// class _RegisterUserState extends State<RegisterUser> {
//   DatabaseHelper database DatabaseHelper();
//
//   String msgStatus = '',
//
//   final TextEditingController _nameController = new TextEditingController();
//   final TextEditingController _emailController = new TextEditingController();
//   final TextEditingController _passwordController = new TextEditingController();
//
//   _onPressed(){
//     setState(() {
//       if(_emailController.text.trim().toLowerCase().isNotEmpty &&
//       _passwordController.text.trim().isNotEmpty){
//         databaseHelper.registerUserData(_nameController.text.trim(), _emailController.text.trim().toLowerCase())
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
