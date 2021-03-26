import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'ItemList.dart';

class ListHelpline extends StatefulWidget {
  @override
  _ListHelplineState createState() => _ListHelplineState();
}

class _ListHelplineState extends State<ListHelpline> {

  List data;
  Future<List> getData()async {
    final response = await http.get("http://10.0.2.2:8000/api/helpline/");
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
      appBar: new AppBar(
        title: new Text("Helpline Numbers"),
        backgroundColor: Colors.blue[900],
      ),
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new ItemList(
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
