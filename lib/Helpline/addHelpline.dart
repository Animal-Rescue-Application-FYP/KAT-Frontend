import 'package:flutter/material.dart';
import 'package:kat_centre/BottomNavigationBar/bottomNavigationBar.dart';
import 'package:kat_centre/controller/databaseHelper.dart';

class AddHelpline extends StatefulWidget {

  AddHelpline({Key key, this.title}) : super(key : key);
  final String title;

  @override
  _AddHelplineState createState() => _AddHelplineState();
}

class _AddHelplineState extends State<AddHelpline> {

  DatabaseHelper dataBaseHelper = new DatabaseHelper();

  final TextEditingController _nameController = new TextEditingController();
  final TextEditingController _addressController = new TextEditingController();
  final TextEditingController _phoneController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Add Helpline Number',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Add Helpline Number'),
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
                child: new TextField(
                  controller: _nameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Organization Name',
                    contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 3),
                    hintText: '@abc',
                    icon: new Icon(Icons.account_balance),
                  ),
                ),
              ),
              new Padding(padding: new EdgeInsets.only(top: 44.0),),
              Container(
                height: 50,
                child: new TextField(
                  controller: _addressController,
                  keyboardType: TextInputType.streetAddress,
                  decoration: InputDecoration(
                    labelText: 'Address',
                    contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 3),
                    hintText: '@New Road, Kathmandu',
                    icon: new Icon(Icons.location_on),
                  ),
                ),
              ),
              new Padding(padding: new EdgeInsets.only(top: 44.0),),
              Container(
                height: 50,
                child: new TextField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Contact Number',
                    contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 3),
                    hintText: '@98########',
                    icon: new Icon(Icons.call),
                  ),
                ),
              ),
              new Padding(padding: new EdgeInsets.only(top: 44.0),),
              Container(
                height: 50,
                child: new RaisedButton(
                  onPressed: (){
                    dataBaseHelper.addDataHelpline(
                        _nameController.text.trim(),
                        _addressController.text.trim(),
                        _phoneController.text.trim());
                          Navigator.of(context).push(
                            new MaterialPageRoute(
                              builder: (BuildContext context) => new BottomNavigationPage(),
                            ),
                          );
                  },
                  color: Colors.blue[900],
                  child: new Text(
                    'Add New Helpline Number',
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
