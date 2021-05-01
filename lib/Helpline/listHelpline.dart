import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kat_centre/BottomNavigationBar/bottomNavigationBar.dart';
import 'ItemList.dart';

class ListHelpline extends StatefulWidget {
  @override
  _ListHelplineState createState() => _ListHelplineState();
}

class _ListHelplineState extends State<ListHelpline> {
  List data;

  Future<List> getData() async {
    final response = await http.get("http://192.168.0.107:8000/api/helpline/");
    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: new AppBar(
        title: new Text(
          "Helpline Numbers",
          style:
              TextStyle(color: Colors.blue[900], fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white70,
        shadowColor: Colors.blue[900],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.blue[900],
          onPressed: () {
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
              ? new ItemList(
                  list: snapshot.data,
                )
              : new Center(child: new CircularProgressIndicator());
        },
      ),
    );
  }
}
