import 'package:flutter/material.dart';
import 'package:kat_centre/MedicalAssistance/listAssistance.dart';
import 'package:kat_centre/controller/databaseHelper.dart';

class EditAssistance extends StatefulWidget {

  final List list;
  final int index;

  EditAssistance({this.list, this.index});
  @override
  _EditAssistanceState createState() => _EditAssistanceState();
}

class _EditAssistanceState extends State<EditAssistance> {
  DatabaseHelper databaseHelper = new DatabaseHelper();

  TextEditingController controllerQuery;
  TextEditingController controllerURL;
  TextEditingController controllerId;

  @override
  void initState() {
    // TODO: implement initState
    controllerId = new TextEditingController(text: widget.list[widget.index]['id'].toString());
    controllerQuery = new TextEditingController(text: widget.list[widget.index]['query'].toString());
    controllerURL = new TextEditingController(text: widget.list[widget.index]['url'].toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text('Edit Medical Assistance'),
      ),
      body: Form(
        child: ListView(
          padding: const EdgeInsets.all(10.0),
          children: <Widget>[
            new ListTile(
              leading: const Icon(Icons.help, color: Colors.black),
              title: new TextFormField(
                  controller: controllerQuery,
                  // ignore: missing_return
                  validator: (value) {
                    if (value.isEmpty)
                      return "Please enter query";
                  },
                  decoration: new InputDecoration(
                    hintText: "@problems..",
                    labelText: "Query",
                  )
              ),
            ),
            new ListTile(
              leading: const Icon(Icons.question_answer, color: Colors.black),
              title: new TextFormField(
                  controller: controllerURL,
                  // ignore: missing_return
                  validator: (value) {
                    if (value.isEmpty)
                      return "Please enter solution link";
                  },
                  decoration: new InputDecoration(
                    hintText: "@link",
                    labelText: "URL",
                  )
              ),
            ),
            const Divider(
              height: 1.0,
            ),
            new Padding(
              padding: const EdgeInsets.all(10.0),
            ),
            new RaisedButton(
              child: new Text('Edit'),
              color: Colors.blue[900],
              onPressed: (){
                Navigator.of(context).push(
                    new MaterialPageRoute(builder: (BuildContext context) => new ListAssistance())
                );
                databaseHelper.editDataAssistance(
                    controllerId.text.trim(), controllerQuery.text.trim(), controllerURL.text.trim()
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
