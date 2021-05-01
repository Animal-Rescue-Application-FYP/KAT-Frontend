import 'package:flutter/material.dart';
import 'package:kat_centre/controller/databaseHelper.dart';
import 'User.dart';

class EditUser extends StatefulWidget {
  final List list;
  final int index;

  EditUser({this.list, this.index});

  @override
  _EditUserState createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  DatabaseHelper databaseHelper = new DatabaseHelper();

  TextEditingController controllerName;
  TextEditingController controllerEmail;
  TextEditingController controllerPhone;
  TextEditingController controllerId;

  void editUser() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Text("Are you sure, You want to update the changes?"),
      actions: <Widget>[
        new RaisedButton(
          child: new Text(
            "Yes",
            style: new TextStyle(color: Colors.white),
          ),
          color: Colors.green[500],
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(50.0)),
          onPressed: () {
            databaseHelper.editUser(
                controllerId.text.trim(),
                controllerName.text.trim(),
                controllerEmail.text.trim(),
                controllerPhone.text.trim());
            getUsers(context);
          },
        ),
        new RaisedButton(
          child: new Text(
            'Cancel',
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.red[900],
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(50.0)),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );

    showDialog(context: context, child: alertDialog);
  }

  @override
  void initState() {
    // TODO: implement initState
    controllerId = new TextEditingController(text: widget.list[0].toString());
    controllerName = new TextEditingController(text: widget.list[1].toString());
    controllerEmail =
        new TextEditingController(text: widget.list[2].toString());
    controllerPhone =
        new TextEditingController(text: widget.list[3].toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Edit Profile",
          style:
              TextStyle(color: Colors.blue[900], fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white70,
        shadowColor: Colors.blue[900],
      ),
      body: Form(
        child: ListView(
          padding: const EdgeInsets.all(10.0),
          children: <Widget>[
            new ListTile(
              leading: const Icon(Icons.person, color: Colors.black),
              title: new TextFormField(
                  controller: controllerName,
                  // ignore: missing_return
                  validator: (value) {
                    if (value.isEmpty) return "Please enter name";
                  },
                  decoration: new InputDecoration(
                    hintText: "name",
                    labelText: "name",
                  )),
            ),
            new ListTile(
              leading: const Icon(Icons.email, color: Colors.black),
              title: new TextFormField(
                  controller: controllerEmail,
                  // ignore: missing_return
                  validator: (value) {
                    if (value.isEmpty) return "Please enter email address";
                  },
                  decoration: new InputDecoration(
                    hintText: "email@email.com",
                    labelText: "email",
                  )),
            ),
            new ListTile(
              leading: const Icon(Icons.call, color: Colors.black),
              title: new TextFormField(
                  controller: controllerPhone,
                  // ignore: missing_return
                  validator: (value) {
                    if (value.isEmpty) return "Please enter phone no";
                  },
                  decoration: new InputDecoration(
                    hintText: "98########",
                    labelText: "phone",
                  )),
            ),
            const Divider(
              height: 1.0,
            ),
            new Padding(
              padding: const EdgeInsets.all(10.0),
            ),
            new RaisedButton(
              child: new Text(
                'Edit',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue[900],
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(50.0)),
              onPressed: () {
                editUser();
              },
            ),
          ],
        ),
      ),
    );
  }
}
