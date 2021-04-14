import 'package:flutter/material.dart';
import 'package:kat_centre/controller/databaseHelper.dart';

class DetailUser extends StatefulWidget {

  List list;
  int index;
  DetailUser({this.index, this.list});

  @override
  _DetailUserState createState() => _DetailUserState();
}

class _DetailUserState extends State<DetailUser> {
  DatabaseHelper databaseHelper = new DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("${widget.list[widget.index]['query']}"),
      ),
      body: new Container(
        height: 270.0,
        padding: const EdgeInsets.all(20.0),
        child: new Card(
          child: new Column(
            children: <Widget>[
              new Padding(padding: const EdgeInsets.only(top: 30.0),),
              new Text(widget.list[widget.index]['name'],
                style: new TextStyle(fontSize: 20.0),),
              Divider(),
              new Text("Email Address: ${widget.list[widget.index]['email']}",
                style: new TextStyle(
                    fontSize: 18.0
                ),),
              // Divider(),
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
                    },
                  ),
                  VerticalDivider(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
