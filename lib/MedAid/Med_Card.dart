import 'dart:math';

import 'package:flutter/material.dart';
import 'Med_Configuration.dart';
import 'package:url_launcher/url_launcher.dart';

class MedCard extends StatelessWidget {
  String medId;
  String question = '';
  String search = '';
  //String imagePath = '';

  MedCard({
    this.medId,
    this.question,
    this.search,
    //this.imagePath,
  });

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
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        height: 240,
        child: Stack(
          children: [
            Container(
              // height: 200,
              margin: EdgeInsets.only(
                top: 45,
                bottom: 45,
              ),
              child: Row(
                children: [
                  Container(
                    width: size.width * 0.02,
                  ),
                  Expanded(
                    child: Container(
                      margin:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                question,
                                style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue[900],
                                ),
                              ),
                            ],
                          ),
                          FlatButton(
                              onPressed: (){
                                customLaunch('$search');
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.search,
                                    size:   18,
                                    color: Colors.blue[900],
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'View Suggestions Online',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline,
                                      color: Colors.blue[900],
                                    ),
                                  ),
                                ],
                              )
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.blueGrey[100],
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  topLeft:Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
