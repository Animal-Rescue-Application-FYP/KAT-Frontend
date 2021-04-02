import 'package:flutter/material.dart';
import 'package:kat_centre/MedicalAssistance/listAssistance.dart';
import 'package:kat_centre/Screen/UserProfile.dart';
import 'package:kat_centre/controller/databaseHelper.dart';

class EditUser extends StatefulWidget {

  final List list;
  final int index;

  EditUser({this.list, this.index});

  @override
  _EditUserState createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {

  DatabaseHelper databaseHelper = new DatabaseHelper();

  TextEditingController controllername;
  TextEditingController controlleremail;
  TextEditingController controllerphone;
  TextEditingController controllerpassword;
  TextEditingController controllerId;

  @override
  void initState() {
    // TODO: implement initState
    controllerId = new TextEditingController(text: widget.list[widget.index]['id'].toString());
    controllername = new TextEditingController(text: widget.list[widget.index]['name'].toString());
    controlleremail = new TextEditingController(text: widget.list[widget.index]['email'].toString());
    controllerphone = new TextEditingController(text: widget.list[widget.index]['phone'].toString());
    controllerpassword = new TextEditingController(text: widget.list[widget.index]['password'].toString());
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
              leading: const Icon(Icons.person, color: Colors.black),
              title: new TextFormField(
                  controller: controllername,
                  // ignore: missing_return
                  validator: (value) {
                    if (value.isEmpty)
                      return "Please enter name";
                  },
                  decoration: new InputDecoration(
                    hintText: "name",
                    labelText: "name",
                  )
              ),
            ),
            new ListTile(
              leading: const Icon(Icons.email, color: Colors.black),
              title: new TextFormField(
                  controller: controlleremail,
                  // ignore: missing_return
                  validator: (value) {
                    if (value.isEmpty)
                      return "Please enter email address";
                  },
                  decoration: new InputDecoration(
                    hintText: "email@email.com",
                    labelText: "email",
                  )
              ),
            ),
            new ListTile(
              leading: const Icon(Icons.call, color: Colors.black),
              title: new TextFormField(
                  controller: controllerphone,
                  // ignore: missing_return
                  validator: (value) {
                    if (value.isEmpty)
                      return "Please enter phone no";
                  },
                  decoration: new InputDecoration(
                    hintText: "98########",
                    labelText: "phone",
                  )
              ),
            ),
            new ListTile(
              leading: const Icon(Icons.lock_open, color: Colors.black),
              title: new TextFormField(
                  controller: controllerpassword,
                  // ignore: missing_return
                  validator: (value) {
                    if (value.isEmpty)
                      return "Please enter password";
                  },
                  decoration: new InputDecoration(
                    hintText: "*****",
                    labelText: "password",
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
                    new MaterialPageRoute(builder: (BuildContext context) => new UserProfile())
                );
                databaseHelper.editUser(
                    controllerId.text.trim(), controllername.text.trim(), controlleremail.text.trim(), controllerphone.text.trim(), controllerpassword.text.trim()
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
