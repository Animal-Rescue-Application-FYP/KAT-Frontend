import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'animalList.dart';

class ListAnimal extends StatefulWidget {
  @override
  _ListAnimalState createState() => _ListAnimalState();
}

class _ListAnimalState extends State<ListAnimal> {
  List data;
  Future<List> getData()async {
    final response = await http.get("http://10.0.2.2:8000/api/rescue/");
    return json.decode(response.body);
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Rescue Animals"),
        backgroundColor: Colors.blue[900],
      ),
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new AnimalList(
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
