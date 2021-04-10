import 'package:flutter/material.dart';
import 'package:kat_centre/MedicalAssistance/editAssistance.dart';
import 'package:kat_centre/MedicalAssistance/listAssistance.dart';
import 'package:kat_centre/controller/databaseHelper.dart';

class DetailAssistance extends StatefulWidget {

  final List list;
  final int index;
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
        title: new Text("Medical Assistance Details"),
        backgroundColor: Colors.blue[900],
      ),
      body: new Container(
        height:1000.0,
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: new Card(
            child: new Column(
              children: <Widget>[
                new Padding(padding: const EdgeInsets.fromLTRB(5.0, 30.0, 5.0, 0),),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text(widget.list[widget.index]['query'],
                    style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.justify,
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text("${widget.list[widget.index]['description']}",
                    style: new TextStyle(
                        fontSize: 18.0
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                Divider(),
                new Text("URL: ${widget.list[widget.index]['url']}",
                  style: new TextStyle(
                      fontSize: 18.0, fontStyle: FontStyle.italic
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
                      color: Colors.red[900],
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
      ),
    );
  }
}
