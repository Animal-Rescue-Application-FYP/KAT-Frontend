import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kat_centre/Animal/listAnimal.dart';
import 'package:kat_centre/BottomNavigationBar/bottomNavigationBar.dart';
import 'assistanceList.dart';

class ListAssistance extends StatefulWidget {
  @override
  _ListAssistanceState createState() => _ListAssistanceState();
}

class _ListAssistanceState extends State<ListAssistance> {

  Future<List> getData()async {
    final response = await http.get("http://10.0.2.2:8000/api/assistance/");
    return json.decode(response.body);
  }

  @override
  void  initState() {
    super.initState();
    this.getData();
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: new AppBar(
        title: new Text("Medical Assistance", style: TextStyle(
            color: Colors.blue[900], fontWeight: FontWeight.bold
        ),),
        backgroundColor: Colors.white70,
        shadowColor: Colors.blue[900],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.blue[900],
          onPressed: (){
            Navigator.of(context).pushReplacement(new MaterialPageRoute(
                builder: (BuildContext context) => BottomNavigationPage()));
          },
        ),
      ),
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new AssistanceList(
                list: snapshot.data,
          )
              : new Center(
              child: new CircularProgressIndicator()
          );
        },
      ),
    );
  }
}
