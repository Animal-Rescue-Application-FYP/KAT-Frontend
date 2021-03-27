import 'package:flutter/material.dart';
import 'package:kat_centre/Animal/editAnimal.dart';
import 'package:kat_centre/Animal/listAnimal.dart';
import 'package:kat_centre/controller/databasehelpers.dart';

class DetailAnimal extends StatefulWidget {

  List list;
  int index;
  DetailAnimal({this.index, this.list});

  @override
  _DetailAnimalState createState() => _DetailAnimalState();
}

class _DetailAnimalState extends State<DetailAnimal> {

  DatabaseHelper databaseHelper = new DatabaseHelper();
  // create function delete
  void confirm (){
    AlertDialog alertDialog = new AlertDialog(
      content: new Text("Are you sure you want to delete '${widget.list[widget.index]['animalName']}' from the list?"),
      actions: <Widget>[
        new RaisedButton(
          child: new Text("Ok remove!!",
            style: new TextStyle(color: Colors.black87),),
          color: Colors.red,
          onPressed: (){
            databaseHelper.removeAnimal(widget.list[widget.index]['id'].toString());
            Navigator.of(context).push(
                new MaterialPageRoute(builder: (BuildContext context) => new ListAnimal(),)
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
        title: new Text("${widget.list[widget.index]['animalName']}"),
        backgroundColor: Colors.blue[900],
      ),
      body: new Container(
        height: 570.0,
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: new Card(
            child: new Column(
              children: <Widget>[
                new Padding(padding: const EdgeInsets.only(top: 30.0),),
                new Text(widget.list[widget.index]['animalName'],
                  style: new TextStyle(fontSize: 20.0),),
                Divider(),
                new Text("Category: ${widget.list[widget.index]['category']}",
                  style: new TextStyle(
                      fontSize: 18.0
                  ),),
                Divider(),
                new Text("Gender: ${widget.list[widget.index]['gender']}",
                  style: new TextStyle(
                      fontSize: 18.0
                  ),),
                Divider(),
                new Text("Age: ${widget.list[widget.index]['year']}",
                  style: new TextStyle(
                      fontSize: 18.0
                  ),),
                Divider(),
                new Text("Posted By: ${widget.list[widget.index]['postedBy']}",
                  style: new TextStyle(
                      fontSize: 18.0
                  ),),
                Divider(),
                new Text("Contact No.: ${widget.list[widget.index]['phone']}",
                  style: new TextStyle(
                      fontSize: 18.0
                  ),),
                Divider(),
                  Padding(padding: const EdgeInsets.all(10.0)),
                  new Text("Description: ${widget.list[widget.index]['description']}",
                    style: new TextStyle(
                        fontSize: 15.0
                    ),),
                Padding(padding: const EdgeInsets.all(10.0)),
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
                          new EditAnimal(list: widget.list, index: widget.index),),)
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
      ),
    );
  }
}

