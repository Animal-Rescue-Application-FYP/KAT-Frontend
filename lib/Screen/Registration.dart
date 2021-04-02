// import 'dart:convert';
// import 'package:flutter/material.dart';
// // import 'snackbar.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
// // import 'signUpButton.dart';
// import 'package:kat_centre/Screen/Login.dart';
//
// class Registration extends StatefulWidget {
//   Registration(
//   {this.formKey, this.name, this.email, this.password, this.isLoading}
//       );
//   final formKey;
//   final String name;
//   final String email;
//   final String password;
//   bool isLoading;
//
//   @override
//   _RegistrationState createState() => _RegistrationState();
// }
//
// class _RegistrationState extends State<Registration> {
//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       left: MediaQuery
//           .of(context)
//           .size
//           .width * 0.31,
//       bottom: MediaQuery
//           .of(context)
//           .size
//           .height * 0.02,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           FlatButton(
//             onPressed: () {
//               if (widget.formKey.currentState.validate()) {
//                 registers(widget.name, widget.email, widget.password);
//               }
//             },
//           ),
//         ],
//       ),
//     );
//   }
//
//   registers(String name, email, password) async {
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     Map data = {
//       'name': name,
//       'email': email,
//       'password': password,
//     };
//     var jsonResponse;
//
//     var response =
//     await http.post("http://10.0.2.2:8000/api/register", body: data);
//
//     if (response.statusCode == 200) {
//       jsonResponse = json.decode(response.body);
//       print('Response status: ${response.statusCode}');
//       print('Response body: ${response.body}');
//       if (jsonResponse != null) {
//         setState(() {
//           widget.isLoading = false;
//         });
//         // createSnackBar('Successfully registered', Colors.green, context);
//         sharedPreferences.setString("token", jsonResponse['token']);
//         Navigator.of(context).pushAndRemoveUntil(
//             MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
//                 (Route<dynamic> route) => false);
//       }
//     } else {
//       setState(() {
//         widget.isLoading = false;
//         // createSnackBar('Could not register', Colors.red, context);
//       });
//       print(response.body);
//     }
//   }
// }