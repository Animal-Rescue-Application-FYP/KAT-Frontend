import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'detailAnimal.dart';

class AnimalList extends StatelessWidget {
  String phone='';
  // ItemList({
  //   this.phone
  // });
  // Random _random = new Random();

  void customLaunch(command) async{
    if(await canLaunch(command)){
      await launch(command);
    }else{
      print('could not launch $command');
    }
  }

  final List list;
  AnimalList({this.list,this.phone});
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child: new GestureDetector(
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => new DetailAnimal(
                list: list,
                index: i,
              ),
            ),),
            child: new Card(
              child: new ListTile(
                title: Column(
                  children: [
                    Row(
                      children: [
                        new Text(
                          list[i]['animalName'].toString(),
                          style: TextStyle(fontSize: 25.0, color: Colors.black87),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        new Text(
                          list[i]['category'].toString(),
                          style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.black87),
                        ),
                      ],
                    ),
                    //
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Text(
                    //       petName,
                    //       style: TextStyle(
                    //         fontSize: 20,
                    //         fontWeight: FontWeight.bold,
                    //       ),
                    //     ),
                    //     Icon(
                    //       gender == 'female'
                    //           ? FontAwesomeIcons.venus
                    //           : FontAwesomeIcons.mars,
                    //       size: 18,
                    //       color: Colors.black54,
                    //     )
                    //   ],
                    // ),
                    //
                    Row(
                      children: [
                            new Text(
                              "Age: ${list[i]['year'].toString()} years old",
                              style: TextStyle(fontSize: 15.0, color: Colors.black87),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 30.0),
                            ),
                            new Text(
                              "Gender: ${list[i]['gender'].toString()}",
                              style: TextStyle(fontSize: 15.0, color: Colors.black87),
                            ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                            Icons.location_on_sharp
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                        ),
                        new Text(
                          list[i]['address'].toString(),
                          style: TextStyle(fontSize: 15.0, color: Colors.black87),
                        ),
                      ],
                    ),
                    RaisedButton(
                      padding: const EdgeInsets.fromLTRB(1, 0, 0, 0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.call,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                          ),
                          new Text(
                            list[i]['phone'].toString(),
                            style: TextStyle(fontSize: 15.0, color: Colors.black87),
                          ),
                        ],
                      ),
                      onPressed: (){
                        customLaunch('tel: $phone');
                      },
                    ),
                  ],
                ),

              ),
            ),
          ),
        );
      },
    );
  }
}
