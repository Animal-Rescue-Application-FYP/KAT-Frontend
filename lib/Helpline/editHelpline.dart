import 'package:flutter/material.dart';
import 'package:kat_centre/Helpline/listHelpline.dart';
import 'package:kat_centre/controller/databaseHelper.dart';

class EditHelpline extends StatefulWidget {

  final List list;
  final int index;

  EditHelpline({this.list, this.index});
  @override
  _EditHelplineState createState() => _EditHelplineState();
}

class _EditHelplineState extends State<EditHelpline> {

  DatabaseHelper databaseHelper = new DatabaseHelper();

  TextEditingController controllerName;
  TextEditingController controllerAddress;
  TextEditingController controllerPhone;
  TextEditingController controllerId;

  @override
  void initState() {
    // TODO: implement initState
    controllerId = new TextEditingController(text: widget.list[widget.index]['id'].toString());
    controllerName = new TextEditingController(text: widget.list[widget.index]['name'].toString());
    controllerAddress = new TextEditingController(text: widget.list[widget.index]['address'].toString());
    controllerPhone = new TextEditingController(text: widget.list[widget.index]['phone'].toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text('Edit Helpline Numbers'),
      ),
      body: Form(
        child: ListView(
          padding: const EdgeInsets.all(10.0),
          children: <Widget>[
            new ListTile(
              leading: const Icon(Icons.account_balance, color: Colors.black),
              title: new TextFormField(
                controller: controllerName,
                // ignore: missing_return
                validator: (value) {
                  if (value.isEmpty)
                    return "Please enter a name";
                },
                decoration: new InputDecoration(
                  hintText: "@abc",
                  labelText: "Organization Name",
                )
              ),
            ),
            new ListTile(
              leading: const Icon(Icons.account_balance, color: Colors.black),
              title: new TextFormField(
                  controller: controllerAddress,
                  // ignore: missing_return
                  validator: (value) {
                    if (value.isEmpty)
                      return "Please enter address";
                  },
                  decoration: new InputDecoration(
                    hintText: "@New Road, Kathmandu",
                    labelText: "Address",
                  )
              ),
            ),
            new ListTile(
              leading: const Icon(Icons.account_balance, color: Colors.black),
              title: new TextFormField(
                  controller: controllerPhone,
                  // ignore: missing_return
                  validator: (value) {
                    if (value.isEmpty)
                      return "Please enter contact number";
                  },
                  decoration: new InputDecoration(
                    hintText: "@98########",
                    labelText: "Contact Number",
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
                  new MaterialPageRoute(builder: (BuildContext context) => new ListHelpline(),)
                );
                databaseHelper.editData(
                  controllerId.text.trim(), controllerName.text.trim(), controllerAddress.text.trim(), controllerPhone.text.trim()
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
