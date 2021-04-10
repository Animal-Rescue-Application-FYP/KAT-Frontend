import 'package:flutter/material.dart';
import 'package:kat_centre/Animal/editAnimal.dart';
import 'package:kat_centre/Animal/listAnimal.dart';
import 'package:kat_centre/controller/databaseHelper.dart';

class AnimalDetails extends StatefulWidget {

  final List list;
  final int index;
  AnimalDetails({this.index, this.list});

  @override
  _AnimalDetailsState createState() => _AnimalDetailsState();
}

class _AnimalDetailsState extends State<AnimalDetails> {

  DatabaseHelper databaseHelper = new DatabaseHelper();
  // create function delete
  void confirm (){
    AlertDialog alertDialog = new AlertDialog(
      content: new Text("Are you sure you want to delete '${widget.list[widget.index]['animalName']}' from the list?"),
      actions: <Widget>[
        new RaisedButton(
          child: new Text("Ok remove!!",
            style: new TextStyle(color: Colors.white),),
          color: Colors.red[900],
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(50.0)
          ),
          onPressed: (){
            databaseHelper.removeAnimal(widget.list[widget.index]['id'].toString());
            Navigator.of(context).push(
                new MaterialPageRoute(builder: (BuildContext context) => new ListAnimal(),)
            );
          },
        ),
        new RaisedButton(
          child: new Text('Cancel',
              style: TextStyle(color: Colors.white),),
          color: Colors.green[900],
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(50.0)
          ),

          onPressed: ()=> Navigator.pop(context),),
      ],
    );

    showDialog(context: context, child: alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryIconTheme: IconThemeData(color: Colors.blue[900])),
      child: new Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: new AppBar(
          title: new Text("${widget.list[widget.index]['animalName']}", style: TextStyle(
              color: Colors.blue[900], fontWeight: FontWeight.bold
          ),),
          backgroundColor: Colors.white70,
          shadowColor: Colors.blue[900],
        ),
        body: new Container(
          height: 800.0,
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: new Card(
              elevation: 1,
              margin: EdgeInsets.all(5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: new Column(
                children: <Widget>[
                  new Padding(padding: const EdgeInsets.only(top: 30.0),),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(60,0,0,0),
                    child: Row(
                      children: [
                        new Icon(Icons.pets_rounded, color: Colors.brown,),
                        SizedBox(width: 10),
                        new Text(widget.list[widget.index]['animalName'],
                          style: new TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.brown, fontStyle: FontStyle.italic),),
                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(60,0,0,0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.category,
                          color: Colors.green[900],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                        ),
                        new Text(
                          "${widget.list[widget.index]['category']}",
                          style: TextStyle(fontSize: 15.0, color: Colors.green[900], fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(60,0,0,0),
                    child: Row(
                      children: [
                        new Text(
                          "Gender: ${widget.list[widget.index]['gender']}",
                          style: TextStyle(fontSize: 15.0, color: Colors.deepPurple, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(60,0,0,0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.cake,
                          color: Colors.pink,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                        ),
                        new Text(
                          "${widget.list[widget.index]['year']} years old",
                          style: TextStyle(fontSize: 15.0, color: Colors.pink, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(60,0,0,0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.person,
                          color: Colors.amber[900],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                        ),
                        new Text(
                          "${widget.list[widget.index]['postedBy']}",
                          style: TextStyle(fontSize: 15.0, color: Colors.amber[900], fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(60,0,0,0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on_sharp,
                          color: Colors.red[900],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                        ),
                        new Text(
                          "${widget.list[widget.index]['address']}",
                          style: TextStyle(fontSize: 15.0, color: Colors.red[900], fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(60,0,0,0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.call,
                          color: Colors.indigo,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                        ),
                        new Text(
                          "${widget.list[widget.index]['phone']}",
                          style: TextStyle(fontSize: 15.0, color: Colors.indigo, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic,),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Container(
                    height: 150,
                    child: SingleChildScrollView(
                      child: Card(
                        elevation: 1,
                        margin: EdgeInsets.all(5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: new Text("${widget.list[widget.index]['description']}",
                            style: new TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                color: Colors.blue[900]
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: new Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new RaisedButton(
                          child: new Text("Edit",style: TextStyle(color: Colors.white),),
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
                          child: new Text("Remove",style: TextStyle(color: Colors.white),),
                          color: Colors.red[900],
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)
                          ),
                          onPressed: ()=>confirm(),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

