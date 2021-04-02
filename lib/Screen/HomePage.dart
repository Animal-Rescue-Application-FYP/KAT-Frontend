// import 'package:kat_centre/Animal/addAnimal.dart';
// import 'package:kat_centre/Animal/listAnimal.dart';
// import 'package:kat_centre/Helpline/addHelpline.dart';
// import 'package:kat_centre/MedicalAssistance/addAssistance.dart';
// import 'package:kat_centre/MedicalAssistance/listAssistance.dart';
// import 'package:kat_centre/User/detailUser.dart';
//
// import 'configuration.dart';
// import 'petcategory_display.dart';
// import 'package:kat_centre/Screen/PetCategories.dart';
// import 'package:kat_centre/Widgets/SearchBar.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'User.dart';
// import 'LoginPage.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
// import 'Login.dart';
// import 'package:kat_centre/Helpline/listHelpline.dart';
//
// // import 'package:geolocator/geolocator.dart';
// import 'User.dart';
//
// class HomeScreen extends StatefulWidget {
//   HomeScreen({Key key}) : super(key: key);
//
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   double xOffset = 0;
//   double yOffset = 0;
//   double scaleFactor = 1;
//   bool showDrawer = false;
//
//   SharedPreferences sharedPreferences;
//
//   //
//   // void getLocation() async{
//   //   Position position = await Geolocator()
//   //       .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
//   //   print(position);
//   // }
//   //
//
//   @override
//   void initState() {
//     super.initState();
//     checkLoginStatus();
//   }
//
//   checkLoginStatus() async {
//     sharedPreferences = await SharedPreferences.getInstance();
//     if(sharedPreferences.getString("token") == null) {
//       Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginPage()), (Route<dynamic> route) => false);
//     }
//   }
//
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('KAT Centre'),
//         backgroundColor: Colors.blue[900],
//       ),
//       // onTap: () {
//       //   if (showDrawer) {
//       //     setState(() {
//       //       xOffset = 0;
//       //       yOffset = 0;
//       //       scaleFactor = 1;
//       //       showDrawer = false;
//       //     });
//       //   }
//       // },
//       // child: AnimatedContainer(
//       //
//       //   duration: Duration(
//       //     milliseconds: 250,
//       //   ),
//       //   transform: Matrix4.translationValues(xOffset, yOffset, 0)
//       //     ..scale(scaleFactor)
//       //     ..rotateY(showDrawer ? -0.2 : 0),
//       //   decoration: BoxDecoration(
//       //     color: Colors.white,
//       //     borderRadius:
//       //     showDrawer ? BorderRadius.circular(40) : BorderRadius.circular(0),
//       //   ),
//         body: SafeArea(
//           child: Column(
//             children: [
//               SizedBox(
//               //  height: 15,
//               ),
//               Container(
//                 margin: EdgeInsets.symmetric(horizontal: 20),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     // RichText(
//                     //   text: TextSpan(
//                     //     text: 'Home Page',
//                     //   ),
//                     // ),
//                     // IconButton(
//                     //     icon: showDrawer
//                     //         ? Icon(CupertinoIcons.chevron_left)
//                     //         : Icon(Icons.menu),
//                     //     onPressed: () {
//                     //       setState(() {
//                     //         if (!showDrawer) {
//                     //           xOffset = size.width * 0.6; //280;
//                     //           yOffset = size.height / 5;
//                     //           scaleFactor = 0.6;
//                     //           showDrawer = true;
//                     //         } else {
//                     //           xOffset = 0;
//                     //           yOffset = 0;
//                     //           scaleFactor = 1;
//                     //           showDrawer = false;
//                     //         }
//                     //       });
//                     //     }),
//                     // Column(
//                     //   crossAxisAlignment: CrossAxisAlignment.center,
//                     //   children: [
//                     //     // RaisedButton(
//                     //     //     onPressed: (){
//                     //      // getLocation();
//                     //     // }),
//                     //     Text(
//                     //       'Location',
//                     //       style: TextStyle(
//                     //         fontSize: 14,
//                     //         fontWeight: FontWeight.w300,
//                     //       ),
//                     //     ),
//                     //     Row(
//                     //       children: [
//                     //         Icon(
//                     //           Icons.location_pin,
//                     //           color: primaryGreen,
//                     //           size: 16,
//                     //         ),
//                     //         //Text('Hello'),
//                     //         RichText(
//                     //           text: TextSpan(
//                     //               text: 'Kathmandu, ',
//                     //               style: TextStyle(
//                     //                   fontSize: 16,
//                     //                   color: Colors.black,
//                     //                   fontWeight: FontWeight.bold),
//                     //               children: [
//                     //                 TextSpan(
//                     //                   text: 'Nepal',
//                     //                   style: TextStyle(
//                     //                     fontWeight: FontWeight.normal,
//                     //                     fontSize: 16,
//                     //                   ),
//                     //                 ),
//                     //               ]),
//                     //         ),
//                     //       ],
//                     //     ),
//                     //   ],
//                     // ),
//                     // CircleAvatar(
//                     //   backgroundImage: AssetImage('images/pp1.jpg'),
//                     // ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               SearchBar(),
//               SizedBox(
//                 height: 20,
//               ),
//               PetCategories(),
//               PetCategoryDisplay(),
//             ],
//           ),
//         ),
//     drawer: Drawer(
//       child: ListView(
//         children: <Widget>[
//           SingleChildScrollView(
//             child: DrawerHeader(
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                       colors: <Color>[
//                         Colors.blue[900],
//                         Colors.blue[900]
//                       ]
//                   ),
//                 ),
//                 child: Container(
//                   child: Column(
//                     children: <Widget>[
//                       CircleAvatar(
//                         backgroundImage: AssetImage('images/pp1.jpg'),
//                         radius: 50,
//                       ),
//                       Padding(padding: EdgeInsets.all(7.0),
//                       child: Text('Rasana Tamrakar',
//                         style: TextStyle(color: Colors.white, fontSize: 20.0),),)
//                       // Material(
//                       //   borderRadius: BorderRadius.all(Radius.circular(50.0)),
//                       //   elevation: 10,
//                       //   child: Padding(padding: EdgeInsets.all(10.0),
//                       //   child: Image.asset('images/pp1.jpg', width: 100, height: 100,),
//                       //   ),
//                       // )
//                     ],
//                   ),
//                 )),
//           ),
//           CustomListTile(Icons.person,'Profile',() =>
//             {
//             Navigator.of(context).pushReplacement(new MaterialPageRoute(
//             builder: (BuildContext context) => Users()))
//             },),
//           CustomListTile(Icons.logout,'Logout',() =>
//           {
//             // onPressed: () {
//             //   sharedPreferences.clear();
//             //   sharedPreferences.commit();
//             //   Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginPage()), (Route<dynamic> route) => false);
//             // },
//             Navigator.of(context).pushReplacement(new MaterialPageRoute(
//                 builder: (BuildContext context) => LoginPage()))
//           },),
//           new ListTile(
//             title: new Text("Helpline Numbers"),
//             trailing: new Icon(Icons.account_balance),
//             onTap: () => Navigator.of(context).push(
//               new MaterialPageRoute(
//                   builder: (BuildContext context) => ListHelpline()
//               ),
//             ),
//           ),
//           new ListTile(
//             title: new Text("Add Helpline Numbers"),
//             trailing: new Icon(Icons.add),
//             onTap: () => Navigator.of(context).push(
//               new MaterialPageRoute(
//                   builder: (BuildContext context) => AddHelpline()
//               ),
//             ),
//           ),
//           new ListTile(
//             title: new Text("Rescue Animals"),
//             trailing: new Icon(Icons.pets_rounded),
//             onTap: () => Navigator.of(context).push(
//               new MaterialPageRoute(
//                   builder: (BuildContext context) => ListAnimal()
//               ),
//             ),
//           ),
//           new ListTile(
//             title: new Text("Add Animal"),
//             trailing: new Icon(Icons.add_circle_outline),
//             onTap: () => Navigator.of(context).push(
//               new MaterialPageRoute(
//                   builder: (BuildContext context) => AddAnimal()
//               ),
//             ),
//           ),
//           new ListTile(
//             title: new Text("Medical Assistance"),
//             trailing: new Icon(Icons.help),
//             onTap: () => Navigator.of(context).push(
//               new MaterialPageRoute(
//                   builder: (BuildContext context) => ListAssistance()
//               ),
//             ),
//           ),
//           new ListTile(
//             title: new Text("Add Medical Assistance"),
//             trailing: new Icon(Icons.add_circle_outline),
//             onTap: () => Navigator.of(context).push(
//               new MaterialPageRoute(
//                   builder: (BuildContext context) => AddAssistance()
//               ),
//             ),
//           ),
//           new ListTile(
//             title: new Text("User Profile"),
//             trailing: new Icon(Icons.person),
//             onTap: () => Navigator.of(context).push(
//               new MaterialPageRoute(
//                   builder: (BuildContext context) => DetailUser()
//               ),
//             ),
//           ),
//         ],
//       ),
//       // child: new ListView(
//       //   children: <Widget>[
//       //   new UserAccountsDrawerHeader(
//       //     circleAvatar: CircleAvatar(),
//       //     accountName: new Text('Rasana Tamrakar'),
//       //     accountEmail: new Text('rasan12945@gmail.com'),
//       //   ),
//       //   ],
//       // ),
//     ),
//     //  ),
//     );
//
//   }
// }
//
// class CustomListTile extends StatelessWidget {
//
//   IconData icon;
//   String text;
//   Function onTap;
//
//   CustomListTile(this.icon,this.text,this.onTap);
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
//       child: Container(
//         decoration: BoxDecoration(
//           border: Border(top: BorderSide(color: Colors.grey.shade400))
//         ),
//         child: InkWell(
//           splashColor: Colors.blueAccent,
//           onTap: onTap,
//           child: Container(
//             height: 40.0,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Row(
//                   children: <Widget>[
//                     Icon(icon),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text(text,
//                       style: TextStyle(
//                         fontSize: 16.0,
//                       ),),
//                     )
//                   ],
//                 ),
//                 Icon(Icons.arrow_right)
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
