import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'userList.dart';

class ListUser extends StatefulWidget {
  @override
  _ListUserState createState() => _ListUserState();
}

class _ListUserState extends State<ListUser> {
  List data;
  Future<List> getData()async {
    final response = await http.get("http://10.0.2.2:8000/api/currentUser/");
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
        title: new Text("User Profile"),
        backgroundColor: Colors.blue[900],
      ),
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new UserList(
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
