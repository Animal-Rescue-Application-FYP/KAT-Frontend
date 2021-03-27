import 'package:flutter/material.dart';
import 'package:kat_centre/MedicalAssistance/editAssistance.dart';
import 'package:kat_centre/MedicalAssistance/listAssistance.dart';
import 'package:kat_centre/controller/databasehelpers.dart';

class DetailAssistance extends StatefulWidget {

  List list;
  int index;
  DetailAssistance({this.index, this.list});

  @override
  _DetailAssistanceState createState() => _DetailAssistanceState();
}

class _DetailAssistanceState extends State<DetailAssistance> {

  DatabaseHelper databaseHelper = new DatabaseHelper();
  // create function delete
  void confirm (){
    AlertDialog alertDialog = new AlertDialog(
      content: new Text("Are you sure you want to delete?? '${widget.list[widget.index]['query']}'"),
      actions: <Widget>[
        new RaisedButton(
          child: new Text("Ok remove!!",
            style: new TextStyle(color: Colors.black87),),
          color: Colors.red,
          onPressed: (){
            databaseHelper.removeAssistance(widget.list[widget.index]['id'].toString());
            Navigator.of(context).push(
                new MaterialPageRoute(builder: (BuildContext context) => new ListAssistance(),)
            );
          },
        ),
        new RaisedButton(
          child: new Text('Cancel',
            style: new TextStyle(color: Colors.black87),),
          color: Colors.green,
          onPressed: ()=> Navigator.pop(context),),
      ],
    );

    showDialog(context: context, child: alertDialog);
  }

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
              new Text(widget.list[widget.index]['query'],
                style: new TextStyle(fontSize: 20.0),),
              Divider(),
              new Text("URL: ${widget.list[widget.index]['url']}",
                style: new TextStyle(
                    fontSize: 18.0
                ),),
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
                        new EditAssistance(list: widget.list, index: widget.index),),)
                    },
                  ),
                  VerticalDivider(),
                  new RaisedButton(
                    child: new Text("Remove"),
                    color: Colors.redAccent,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)
                    ),
                    onPressed: ()=>confirm(),
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
