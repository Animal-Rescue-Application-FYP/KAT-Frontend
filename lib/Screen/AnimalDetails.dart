// import 'package:kat_centre/Screen/configuration.dart';
// import 'package:kat_centre/Widgets/IconButtons.dart';
// import 'package:kat_centre/Widgets/Buttons.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//
// import 'package:url_launcher/url_launcher.dart';
// import 'configuration.dart';
// import 'PetCard.dart';
//
// class DetailsScreen extends StatelessWidget {
//   String petId;
//   String petName = '';
//   String breed = '';
//   String age = '';
//   String distance = '';
//   String gender = '';
//   String imagePath = '';
//   String call='9860756157';
//
//   String id;
//   Color color;
//   DetailsScreen({this.id, this.color});
//
//
//
//   void customLaunch(command) async{
//     if(await canLaunch(command)){
//       await launch(command);
//     }else{
//       print('could not launch $command');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//
//     String petName = '';
//     String breed = '';
//     String age = '';
//     String gender = '';
//     String imagePath = '';
//     dogs.forEach((dog) {
//       if (dog['id'] == id) {
//         petName = dog['name'];
//         breed = dog['breed'];
//         age = dog['age'];
//         gender = dog['gender'];
//         imagePath = dog['imagePath'];
//       }
//     });
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Stack(
//         children: [
//           Positioned.fill(
//             child: Column(
//               children: [
//                 Expanded(
//                   child: Container(
//                     padding: EdgeInsets.symmetric(vertical: 60, horizontal: 30),
//                     color: color,
//                     child: Stack(
//                       children: [
//                         Align(
//                           alignment: Alignment.center,
//                           child: Hero(
//                             tag: id,
//                             child: Image.asset(
//                               imagePath,
//                               width: size.width * 0.7,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: Container(
//                     color: Colors.white,
//                     child: Column(
//                       children: [
//                         SizedBox(
//                           height: 100,
//                         ),
//                         Container(
//                           margin: EdgeInsets.symmetric(
//                             horizontal: 20,
//                           ),
//                           child: Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               CircleAvatar(
//                                 backgroundImage:
//                                 AssetImage('images/pp1.jpg'),
//                               ),
//                               SizedBox(
//                                 width: 10,
//                               ),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     'Rasana Tamrakar',
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 16),
//                                   ),
//                                   Text(
//                                     'Owner',
//                                     style: TextStyle(
//                                       color: fadedBlack,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Expanded(child: Container()),
//                               Text(
//                                 'Mar 07, 2021',
//                                 style: TextStyle(
//                                   color: fadedBlack,
//                                   fontSize: 12,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           height: 30,
//                         ),
//                         Container(
//                           margin: EdgeInsets.symmetric(
//                             horizontal: 20,
//                           ),
//                           child: Text(
//                             'I found this dog near new road. This dog seems to be abandoned. If anybody is up for adoption then please call me on the given number. Thank you!',
//                             style: TextStyle(
//                               color: fadedBlack,
//                               height: 1.7,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Align(
//             alignment: Alignment.topCenter,
//             child: Container(
//               margin: EdgeInsets.symmetric(
//                 vertical: 42,
//                 horizontal: 20,
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   IconButton(
//                     icon: Icon(CupertinoIcons.chevron_left),
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                   ),
//                   // IconButton(
//                   //   icon: Icon(
//                   //     CupertinoIcons.tray_arrow_down,
//                   //   ),
//                   //   onPressed: () {
//                   //     Navigator.of(context).pop();
//                   //   },
//                   // )
//                 ],
//               ),
//             ),
//           ),
//           Align(
//             alignment: Alignment.center,
//             child: Container(
//               height: 120,
//               padding: EdgeInsets.all(20),
//               margin: EdgeInsets.symmetric(
//                 horizontal: 20,
//               ),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(30),
//                 boxShadow: customShadow,
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         petName,
//                         style: TextStyle(
//                           color: fadedBlack,
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Icon(
//                         gender == 'female'
//                             ? FontAwesomeIcons.venus
//                             : FontAwesomeIcons.mars,
//                         size: 22,
//                         color: Colors.black54,
//                       )
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         breed,
//                         style: TextStyle(
//                           fontSize: 12,
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Text(
//                         age + ' years',
//                         style: TextStyle(
//                           fontSize: 12,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       Icon(
//                         Icons.location_pin,
//                         size: 18,
//                         color: primaryGreen,
//                       ),
//                       SizedBox(
//                         width: 5,
//                       ),
//                       Text(
//                         'Kathmandu, Nepal',
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: fadedBlack,
//                         ),
//                       )
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Container(
//               height: 100,
//               decoration: BoxDecoration(
//                 color: Colors.grey[100],
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(30),
//                   topRight: Radius.circular(30),
//                 ),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   // Container(
//                   //   margin: EdgeInsets.symmetric(horizontal: 20),
//                   //   child: CustomIconButton(
//                   //     iconData: CupertinoIcons.heart,
//                   //     onTap: () {},
//                   //   ),
//                   // ),
//                   Expanded(
//                     child: Container(
//                       margin: EdgeInsets.only(right: 20, left: 20),
//                       child: CustomButton(
//                         label: 'Call',
//                         onTap: (){
//                           // Navigator.push(context, MaterialPageRoute(
//                           //     builder: (context) => login_page()),
//                           // );
//                           customLaunch('tel: $call');
//                         },
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
