// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:url_launcher/url_launcher.dart';
// import 'detailUser.dart';
//
// class UserList extends StatelessWidget {
//   final String url;
//
//   final List list;
//   UserList({this.list,this.url});
//   @override
//   Widget build(BuildContext context) {
//     return new ListView.builder(
//         itemCount: list == null ? 0 : list.length,
//         itemBuilder: (context, i) {
//           return new Container(
//             padding: const EdgeInsets.all(10.0),
//             child: GestureDetector(
//               onTap: () => Navigator.of(context).push(new MaterialPageRoute(
//                 builder: (BuildContext context) => new DetailUser(
//                   list: list,
//                   index: i,
//                 ),
//               ),),
//             ),
//             // Column(
//             //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //   children: [
//             // Text("Name: ${currentUser['user']['name']}",
//             //   style: TextStyle(
//             //     fontSize: 20,
//             //     color: Colors.white,
//             //     fontWeight: FontWeight.bold,
//             //   ),
//             // ),
//             // Text("Phone: ${currentUser['user']['phone']}",
//             //   style: TextStyle(
//             //     fontSize: 12,
//             //     color: Colors.white,
//             //     fontWeight: FontWeight.bold,
//             //   ),
//             // ),
//             // Text("Email Address: ${currentUser['user']['email']}",
//             //   style: TextStyle(
//             //     fontSize: 12,
//             //     color: Colors.white,
//             //     fontWeight: FontWeight.bold,
//             //   ),
//             // ),])
//             decoration: BoxDecoration(
//               color: Colors.blue[900],
//               borderRadius: BorderRadius.only(
//                 topRight: Radius.circular(20),
//                 bottomRight: Radius.circular(20),
//                 topLeft: Radius.circular(20),
//                 bottomLeft: Radius.circular(20),
//               ),
//             ),
//           );
//         }
//     );
//   }
// }
//
//
//
//
// // Container(
// // margin: EdgeInsets.only(
// // top: 35,
// // bottom: 35,
// // ),
// // height: 250.0,
// // child: Row(
// // children: [
// // Expanded(
// // child: GestureDetector(
// // onTap: () => Navigator.of(context).push(new MaterialPageRoute(
// // builder: (BuildContext context) => new DetailUser(
// // list: list,
// // index: i,
// // ),
// // ),),
// // child: Container(
// // margin:
// // EdgeInsets.symmetric(horizontal: 10, vertical: 20),
// // child: Column(
// // crossAxisAlignment: CrossAxisAlignment.start,
// // mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // children: [
// // Row(
// // children: [
// // Column(
// // children: <Widget>[
// // Image(
// // image: AssetImage(
// // 'images/KatCentre.jpg'),
// // width: 150.0,
// // ),
// // ],
// // ),
// // Column(
// // mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // children: [
// // Text("Name: ${currentUser['user']['name']}",
// // style: TextStyle(
// // fontSize: 20,
// // color: Colors.white,
// // fontWeight: FontWeight.bold,
// // ),
// // ),
// // Text("Phone: ${currentUser['user']['phone']}",
// // style: TextStyle(
// // fontSize: 12,
// // color: Colors.white,
// // fontWeight: FontWeight.bold,
// // ),
// // ),
// // Text("Email Address: ${currentUser['user']['email']}",
// // style: TextStyle(
// // fontSize: 12,
// // color: Colors.white,
// // fontWeight: FontWeight.bold,
// // ),
// // ),
// // // RaisedButton(
// // //   child: new Text("Edit"),
// // //   color: Colors.blue[800],
// // //   shape: new RoundedRectangleBorder(
// // //     borderRadius: new BorderRadius.circular(30.0),
// // //   ),
// // //   onPressed: () => {
// // //     Navigator.of(context).push(
// // //       new MaterialPageRoute(builder: (BuildContext context) =>
// // //       // new EditUser(list: widget.list, index: widget.index),),)
// // //       new EditUser(),),)
// // //   },
// // // ),
// // ],
// // ),
// // ],
// // ),
// // ],
// // ),
// // decoration: BoxDecoration(
// // color: Colors.blue[900],
// // borderRadius: BorderRadius.only(
// // topRight: Radius.circular(20),
// // bottomRight: Radius.circular(20),
// // topLeft: Radius.circular(20),
// // bottomLeft: Radius.circular(20),
// // ),
// // ),
// // ),
// // ),
// // ),
// // ],
// // ),
// // // child: Card(
// // //   child: Column(
// // //       children: [
// // //               Text("${currentUser['user']['name']}",
// // //               ),
// // //               Text("${currentUser['user']['phone']}"),
// // //               Text("${currentUser['user']['email']}"),
// // //               //Text("${rescueData[2]['animalName']}"),
// // //         //
// // //       ],
// // //   ),
// // // ),
// // ),