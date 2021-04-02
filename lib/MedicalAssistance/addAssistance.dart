import 'package:flutter/material.dart';
import 'package:kat_centre/BottomNavigationBar/bottomNavigationBar.dart';
import 'package:kat_centre/controller/databaseHelper.dart';

class AddAssistance extends StatefulWidget {

  AddAssistance({Key key, this.title}) : super(key : key);
  final String title;

  @override
  _AddAssistanceState createState() => _AddAssistanceState();
}

class _AddAssistanceState extends State<AddAssistance> {

  DatabaseHelper dataBaseHelper = new DatabaseHelper();

  final TextEditingController _queryController = new TextEditingController();
  final TextEditingController _urlController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Add Medical Assistance',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Add Medical Assistance'),
          backgroundColor: Colors.blue[900],
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: (){
              Navigator.of(context).pushReplacement(new MaterialPageRoute(
                  builder: (BuildContext context) => BottomNavigationPage()));
            },
          ),
        ),
        body: Container(
          child: ListView(
            padding: const EdgeInsets.only(top: 30, left: 12.0, right: 12.0, bottom: 12.0),
            children: <Widget>[
              Container(
                height: 50,
                child: Column(
                  children: [
                    new TextField(
                      controller: _queryController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: 'Query',
                        contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 3),
                        hintText: 'Enter a problem here!',
                        icon: new Icon(Icons.help),
                      ),
                    ),
                  ],
                ),
              ),
              new Padding(padding: new EdgeInsets.only(top: 44.0),),
              Container(
                height: 50,
                child: Column(
                  children: [
                    new TextField(
                      controller: _urlController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: 'URL',
                        contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 3),
                        hintText: 'Enter solution link here!',
                        icon: new Icon(Icons.question_answer),
                      ),
                    ),
                  ],
                ),
              ),
              new Padding(padding: new EdgeInsets.only(top: 44.0),),
              Container(
                height: 50,
                child: new RaisedButton(
                  onPressed: (){
                    dataBaseHelper.addDataAssistance(
                        _queryController.text.trim(),
                        _urlController.text.trim());
                    Navigator.of(context).push(
                      new MaterialPageRoute(
                        builder: (BuildContext context) => new BottomNavigationPage(),
                      ),
                    );
                  },
                  color: Colors.blue[900],
                  child: new Text(
                    'Add',
                    style: new TextStyle(
                      color: Colors.white,
                      backgroundColor: Colors.blue[900],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
