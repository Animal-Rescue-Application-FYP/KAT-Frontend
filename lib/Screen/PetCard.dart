// import 'dart:math';
//
// import 'package:kat_centre/Screen/AnimalDetails.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// import 'configuration.dart';
//
// class PetCard extends StatelessWidget {
//   String petId;
//   String petName = '';
//   String breed = '';
//   String age = '';
//   String distance = '';
//   String gender = '';
//   String imagePath = '';
//   String call='';
//
//   PetCard({
//     this.petId,
//     this.petName,
//     this.breed,
//     this.age,
//     this.distance,
//     this.gender,
//     this.imagePath,
//     this.call,
//   });
//
//   // final colors = [
//   //   Colors.blue[900],
//   //   // Colors.green[200],
//   //   // Colors.pink[100],
//   //   // Colors.brown[200],
//   //   // Colors.lightBlue[200],
//   // ];
//
//   Random _random = new Random();
//   void customLaunch(command) async{
//     if(await canLaunch(command)){
//       await launch(command);
//     }else{
//       print('could not launch $command');
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     //final randomColor = colors[_random.nextInt(colors.length)];
//     return GestureDetector(
//       onTap: () {
//         Navigator.of(context).push(
//           MaterialPageRoute(
//             builder: (context) {
//               return DetailsScreen(
//                 id: petId,
//                 //color: randomColor,
//               );
//             },
//           ),
//         );
//       },
//       child: Container(
//         margin: EdgeInsets.symmetric(horizontal: 20),
//         height: 240,
//         child: Stack(
//           children: [
//             Container(
//               // height: 200,
//               margin: EdgeInsets.only(
//                 top: 35,
//                 bottom: 35,
//               ),
//               child: Row(
//                 children: [
//                   Container(
//                     width: size.width * 0.48,
//                   ),
//                   Expanded(
//                     child: Container(
//                       margin:
//                       EdgeInsets.symmetric(horizontal: 10, vertical: 20),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 petName,
//                                 style: TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               Icon(
//                                 gender == 'female'
//                                     ? FontAwesomeIcons.venus
//                                     : FontAwesomeIcons.mars,
//                                 size: 18,
//                                 color: Colors.black54,
//                               )
//                             ],
//                           ),
//                           Text(
//                             breed,
//                             style: TextStyle(
//                               fontSize: 12,
//                               color: fadedBlack,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text(
//                             age + ' years',
//                             style: TextStyle(
//                               fontSize: 12,
//                               color: fadedBlack,
//                             ),
//                           ),
//                           Row(
//                             children: [
//                               Icon(
//                                 Icons.location_pin,
//                                 size: 16,
//                                 color: primaryGreen,
//                               ),
//                               SizedBox(
//                                 width: 5,
//                               ),
//                               Text(
//                                 // 'Distance: ' + distance + ' Km',
//                                 distance,
//                                 style: TextStyle(
//                                   fontSize: 12,
//                                   color: fadedBlack,
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: 5,
//                               ),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               RaisedButton(
//                                   onPressed: (){
//                                     // Navigator.push(context, MaterialPageRoute(
//                                     //     builder: (context) => login_page()),
//                                     // );
//                                     customLaunch('tel: $call');
//                                   },
//                                   child: Row(
//                                     children: [
//                                       Icon(
//                                         Icons.call,
//                                         size: 16,
//                                         color: primaryGreen,
//                                       ),
//                                       SizedBox(
//                                         width: 5,
//                                       ),
//                                       Text(
//                                         'Rescue',
//                                         style: TextStyle(
//                                           fontSize: 16,
//                                           color: fadedBlack,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                     ],
//                                   )
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 boxShadow: customShadow,
//                 borderRadius: BorderRadius.only(
//                   topRight: Radius.circular(20),
//                   bottomRight: Radius.circular(20),
//                   // topLeft: Radius.circular(20),
//                   // bottomLeft: Radius.circular(20),
//                 ),
//               ),
//             ),
//             Container(
//               width: size.width * 0.48,
//               child: Stack(
//                 children: [
//                   Container(
//                     decoration: BoxDecoration(
//                     //  color: randomColor,
//                     //  boxShadow: customShadow,
//                       borderRadius: BorderRadius.circular(22),
//                     ),
//                     margin: EdgeInsets.only(top: 50),
//                   ),
//                   Align(
//                     child: Hero(
//                       tag: petId,
//                       child: Image.asset(
//                         imagePath,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
