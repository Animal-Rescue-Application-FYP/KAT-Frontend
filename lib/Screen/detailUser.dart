import 'package:flutter/material.dart';
import 'package:kat_centre/Screen/editUser.dart';
import 'package:kat_centre/controller/databaseHelper.dart';

class DetailUser extends StatefulWidget {

  final List list;
  final int index;
  DetailUser({this.index, this.list});

  @override
  _DetailUserState createState() => _DetailUserState();
}

class _DetailUserState extends State<DetailUser> {

  DatabaseHelper databaseHelper = new DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("${widget.list[widget.index]['name']}"),
      ),
      body: new Container(
        height: 270.0,
        padding: const EdgeInsets.all(20.0),
        child: new Card(
          child: new Column(
            children: <Widget>[
              new Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new RaisedButton(
                    child: new Text("Edit"),
                    color: Colors.blue[900],
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                    onPressed: () => {
                      Navigator.of(context).push(
                        new MaterialPageRoute(builder: (BuildContext context) =>
                        new EditUser(list: widget.list, index: widget.index),),)
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
