import 'dart:math';

//import 'package:kat_centre/Screen/AnimalDetails.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:kat_centre/Screen/LoginPage.dart';
import 'Helpline_Configuration.dart';
import 'package:url_launcher/url_launcher.dart';

class VetCard extends StatelessWidget {
  String vetId;
  String vetName = '';
  String contact = '';
  String distance = '';
  String imagePath = '';

  VetCard({
    this.vetId,
    this.vetName,
    this.contact,
    this.distance,
    this.imagePath,
  });

  // final colors = [
  //   Colors.blue[900],
  //   // Colors.green[200],
  //   // Colors.pink[100],
  //   // Colors.brown[200],
  //   // Colors.lightBlue[200],
  // ];

  Random _random = new Random();

  void customLaunch(command) async{
    if(await canLaunch(command)){
      await launch(command);
    }else{
      print('could not launch $command');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //final randomColor = colors[_random.nextInt(colors.length)];
    return GestureDetector(
      // onTap: () {
      //   Navigator.of(context).push(
      //     MaterialPageRoute(
      //       builder: (context) {
      //         return DetailsScreen(
      //           id: vetId,
      //           //color: randomColor,
      //         );
      //       },
      //     ),
      //   );
      // },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        height: 240,
        child: Stack(
          children: [
            Container(
              // height: 200,
              margin: EdgeInsets.only(
                top: 35,
                bottom: 35,
              ),
              child: Row(
                children: [
                  Container(
                    width: size.width * 0.40,
                  ),
                  Expanded(
                    child: Container(
                      margin:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                vetName,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              // Icon(
                              //   gender == 'female'
                              //       ? FontAwesomeIcons.venus
                              //       : FontAwesomeIcons.mars,
                              //   size: 18,
                              //   color: Colors.black54,
                              // )
                            ],
                          ),


                          FlatButton(
                            onPressed: (){
                              // Navigator.push(context, MaterialPageRoute(
                              //     builder: (context) => login_page()),
                              // );
                              customLaunch('tel: $contact');
                            },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.call,
                                    size:   16,
                                    color: primaryGreen,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    contact,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: fadedBlack,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              )
                          ),
                          FlatButton(
                            onPressed: (){
                              // Navigator.push(context, MaterialPageRoute(
                              //     builder: (context) => login_page()),
                              // );
                              customLaunch('https://google.com/maps/place/$distance');
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_pin,
                                  size:   16,
                                  color: primaryGreen,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  // 'Distance: ' + distance + ' Km',
                                  distance,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: fadedBlack,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: customShadow,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  topLeft:Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
            ),
            Container(
              width: size.width * 0.48,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      //  color: randomColor,
                      //  boxShadow: customShadow,
                      borderRadius: BorderRadius.circular(22),
                    ),
                    margin: EdgeInsets.only(top: 50),
                  ),
                  Align(
                    child: Hero(
                      tag: vetId,
                      child: Image.asset(
                        imagePath, height: 120.0, width: 120.0,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
