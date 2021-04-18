import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kat_centre/BottomNavigationBar/bottomNavigationBar.dart';
import 'package:kat_centre/controller/databaseHelper.dart';

String dropDownValue;

class AddAnimal extends StatefulWidget {
  AddAnimal({Key key, this.title, this.userId}) : super(key: key);
  final String title;
  final userId;

  @override
  _AddAnimalState createState() => _AddAnimalState();
}

class _AddAnimalState extends State<AddAnimal> {
  void addAnimals() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Text("Are you sure, You want add animal?"),
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
            Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => new BottomNavigationPage(),
            ));
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

  File _image;
  Uint8List _newImage;
  final picker = ImagePicker();

  Future choiceImage() async {
    var pickedImage = await picker.getImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      _newImage = await pickedImage.readAsBytes();
    }

    setState(() {
      _image = File(pickedImage.path);
      print("picked path: $_image");
    });
  }

/*
  Future uploadImage() async {
    final uri = Uri.parse("http://10.0.2.2:8000/api/rescue");
    var request = http.MultipartRequest('POST', uri);
    var pic = await http.MultipartFile.fromPath("image", _image.path);
    request.files.add(pic);
    var response = await request.send();

    if (response.statusCode == 200) {
      print('Image Uploaded');
    } else {
      print('Image Not Uploaded');
    }
  }
*/

  DatabaseHelper dataBaseHelper = new DatabaseHelper();

  final TextEditingController _animalNameController =
      new TextEditingController();
  final TextEditingController _imageController = new TextEditingController();
  final TextEditingController _categoryController = new TextEditingController();
  final TextEditingController _yearController = new TextEditingController();
  //final TextEditingController _genderController = new TextEditingController();
  final TextEditingController _addressController = new TextEditingController();
  final TextEditingController _phoneController = new TextEditingController();
  final TextEditingController _postedByController = new TextEditingController();
  final TextEditingController _descriptionController =
      new TextEditingController();

/*
  final _formKey = GlobalKey<FormState>();
*/

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
            onPressed: () {
              Navigator.of(context).pushReplacement(new MaterialPageRoute(
                  builder: (BuildContext context) => BottomNavigationPage()));
            },
          ),
        ),
        body: Container(
          child: ListView(
            padding: const EdgeInsets.only(
                top: 30, left: 12.0, right: 12.0, bottom: 12.0),
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
                        hintText:
                            'eg: Rambo, Bruno (can give random suitable name)',
                        icon: new Icon(Icons.pets),
                      ),
                      /*validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },*/
                    ),
                  ],
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 44.0),
              ),
              Container(
                height: 350,
                child: Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.camera),
                      onPressed: () {
                        choiceImage();
                      },
                    ),
                    Container(
                      child: _image == null
                          ? Text('No Image Selected')
                          : Image.file(_image),
                    ),
                    /*new TextField(
                      controller: _imageController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: 'Image',
                        contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 3),
                        hintText: 'enter image url',
                        icon: new Icon(Icons.category),
                      ),
                    ),*/
                  ],
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 44.0),
              ),
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
              new Padding(
                padding: new EdgeInsets.only(top: 44.0),
              ),
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
              new Padding(
                padding: new EdgeInsets.only(top: 44.0),
              ),
              Container(
                height: 50,
                child: DropdownButton(
                    isExpanded: true,
                    hint: Text('Select gender'),
                    value: dropDownValue,
                    items: gender.map((gender) {
                      return DropdownMenuItem(
                          child: new Text(gender), value: gender);
                    }).toList(),
                    onChanged: (String newValue) {
                      setState(() {
                        dropDownValue = newValue;
                      });
                    }),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 44.0),
              ),
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
              new Padding(
                padding: new EdgeInsets.only(top: 44.0),
              ),
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
              new Padding(
                padding: new EdgeInsets.only(top: 44.0),
              ),
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
              new Padding(
                padding: new EdgeInsets.only(top: 44.0),
              ),
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
              new Padding(
                padding: new EdgeInsets.only(top: 44.0),
              ),
              Container(
                height: 50,
                child: new RaisedButton(
                  onPressed: () async {
                    dataBaseHelper.addDataAnimal(
                        _animalNameController.text.trim(),
                        _image,
                        _categoryController.text.trim(),
                        _yearController.text.trim(),
                        dropDownValue,
                        /*_genderController.text.trim(),*/
                        _addressController.text.trim(),
                        _phoneController.text.trim(),
                        _postedByController.text.trim(),
                        _descriptionController.text.trim(),
                        widget.userId);

                    //  uploadImage();
                    /*if (_formKey.currentState.validate()) {
                      Scaffold.of(context)
                          .showSnackBar(SnackBar(content: Text('Processing Data')));
                    }*/

                    Navigator.of(context).push(
                      new MaterialPageRoute(
                        builder: (BuildContext context) =>
                            new BottomNavigationPage(),
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

List<String> gender = ['Male', 'Female'];
