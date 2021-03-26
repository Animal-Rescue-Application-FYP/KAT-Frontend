import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'detailHelpline.dart';

class ItemList extends StatelessWidget {
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
  ItemList({this.list,this.phone});
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child: new GestureDetector(
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
            builder: (BuildContext context) => new DetailHelpline(
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
                        Icon(
                          Icons.account_balance
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                        ),
                        new Text(
                          list[i]['name'].toString(),
                          style: TextStyle(fontSize: 25.0, color: Colors.black87),
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
