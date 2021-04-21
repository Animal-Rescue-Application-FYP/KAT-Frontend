import 'package:flutter/material.dart';
import 'package:kat_centre/BottomNavigationBar/bottomNavigationBar.dart';

class AnimalDescription extends StatefulWidget {
  final List list;
  final int index;
  AnimalDescription({this.index, this.list});

  @override
  _AnimalDescriptionState createState() => _AnimalDescriptionState();
}

class _AnimalDescriptionState extends State<AnimalDescription> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: new AppBar(
        title: new Text(
          "${widget.list[widget.index]['animalName']}",
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
      body: new Container(
        height: 700.0,
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
                new Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(60, 0, 0, 0),
                  child: Row(
                    children: [
                      new Icon(
                        Icons.pets_rounded,
                        color: Colors.brown,
                      ),
                      SizedBox(width: 10),
                      new Text(
                        widget.list[widget.index]['animalName'],
                        style: new TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.brown,
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(60, 0, 0, 0),
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
                        style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.green[900],
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(60, 0, 0, 0),
                  child: Row(
                    children: [
                      new Text(
                        "Gender: ${widget.list[widget.index]['gender']}",
                        style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(60, 0, 0, 0),
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
                        style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.pink,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(60, 0, 0, 0),
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
                        "Posted by ${widget.list[widget.index]['postedBy']}",
                        style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.amber[900],
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(60, 0, 0, 0),
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
                        style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.red[900],
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(60, 0, 0, 0),
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
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.indigo,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(),
                Container(
                  height: 250,
                  child: SingleChildScrollView(
                    child: Card(
                      elevation: 1,
                      margin: EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(22.0),
                        child: new Text(
                          "${widget.list[widget.index]['description']}",
                          style: new TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              color: Colors.blue[900]),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(padding: const EdgeInsets.all(10.0)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
