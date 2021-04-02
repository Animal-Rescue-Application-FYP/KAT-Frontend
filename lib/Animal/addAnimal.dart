import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kat_centre/BottomNavigationBar/bottomNavigationBar.dart';
import 'package:kat_centre/controller/databaseHelper.dart';

class AddAnimal extends StatefulWidget {

  AddAnimal({Key key, this.title, this.userId}) : super(key : key);
  final String title;
  final userId;

  @override
  _AddAnimalState createState() => _AddAnimalState();
}

class _AddAnimalState extends State<AddAnimal> {

  DatabaseHelper dataBaseHelper = new DatabaseHelper();

  final TextEditingController _animalNameController = new TextEditingController();
  final TextEditingController _categoryController = new TextEditingController();
  final TextEditingController _yearController = new TextEditingController();
  final TextEditingController _genderController = new TextEditingController();
  final TextEditingController _addressController = new TextEditingController();
  final TextEditingController _phoneController = new TextEditingController();
  final TextEditingController _postedByController = new TextEditingController();
  final TextEditingController _descriptionController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Add Rescue Animal',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Add Rescue Animal'),
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
                      controller: _animalNameController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: 'Animal Name',
                        contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 3),
                        hintText: 'eg: Rambo, Bruno (can give random suitable name)',
                        icon: new Icon(Icons.pets),
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
                      controller: _categoryController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: 'Category',
                        contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 3),
                        hintText: 'eg: Dog, Cat, Cow',
                        icon: new Icon(Icons.category),
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
                      controller: _yearController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Age',
                        contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 3),
                        hintText: 'eg: 1, 2, ...',
                        icon: new Icon(Icons.cake),
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
                      controller: _genderController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: 'Gender',
                        contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 3),
                        hintText: 'eg: Male, Female',
                        icon: new Icon(FontAwesomeIcons.transgender),
                      ),
                    ),
                  ],
                ),
              ),
              new Padding(padding: new EdgeInsets.only(top: 44.0),),
              Container(
                height: 50,
                child: new TextField(
                  controller: _addressController,
                  keyboardType: TextInputType.streetAddress,
                  decoration: InputDecoration(
                    labelText: 'Location',
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
                child: new TextField(
                  controller: _postedByController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Posted By',
                    contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 3),
                    hintText: 'eg. Rasana, Samyush, Urusha',
                    icon: new Icon(Icons.person),
                  ),
                ),
              ),
              new Padding(padding: new EdgeInsets.only(top: 44.0),),
              Container(
                height: 50,
                child: new TextField(
                  controller: _descriptionController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 3),
                    hintText: '@describe...',
                    icon: new Icon(Icons.message),
                  ),
                ),
              ),
              new Padding(padding: new EdgeInsets.only(top: 44.0),),
              Container(
                height: 50,
                child: new RaisedButton(
                  onPressed: (){
                    dataBaseHelper.addDataAnimal(
                        _animalNameController.text.trim(),
                        _categoryController.text.trim(),
                        _yearController.text.trim(),
                        _genderController.text.trim(),
                        _addressController.text.trim(),
                        _phoneController.text.trim(),
                        _postedByController.text.trim(),
                        _descriptionController.text.trim(),
                    widget.userId);

                    Navigator.of(context).push(
                      new MaterialPageRoute(
                        builder: (BuildContext context) => new BottomNavigationPage(),
                      ),
                    );
                  },
                  color: Colors.blue[900],
                  child: new Text(
                    'Post',
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
