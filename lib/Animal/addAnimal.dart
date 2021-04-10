import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kat_centre/BottomNavigationBar/bottomNavigationBar.dart';
import 'package:kat_centre/controller/databaseHelper.dart';
import 'package:kat_centre/Screen/snackbar.dart';
//
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

String dropDownValue;
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
  //final TextEditingController _imageController = new TextEditingController();
  final TextEditingController _categoryController = new TextEditingController();
  final TextEditingController _yearController = new TextEditingController();
  final TextEditingController _genderController = new TextEditingController();
  final TextEditingController _addressController = new TextEditingController();
  final TextEditingController _phoneController = new TextEditingController();
  final TextEditingController _postedByController = new TextEditingController();
  final TextEditingController _descriptionController = new TextEditingController();

/*  File _image;
  final picker = ImagePicker();

  Future choiceImage() async{
    var pickedImage = await picker.getImage(
        source: ImageSource.gallery);
    setState((){
      _image = File(pickedImage.path);
    });
  }

  Future uploadImage()async{
    final uri = Uri.parse("");
    var request = http.MultipartRequest('POST',uri);
    request.fields['name'] = _imageController.text;
    var pic = await http.MultipartFile.fromPath("image", _image.path);
    request.files.add(pic);
    var response = await request.send();

    if(response.statusCode == 200){
      print('Image Uploaded');
    }else{
      print('Image Not Uploaded');
    }
  }*/


  
  /*Future<File> file;
  String status = '';
  String base64Image;
  File tempFile;
  String error = 'Error';
  
  choseImage(){
    
    setState((){
      file = ImagePicker.pickImage(source: ImageSource.gallery);
    });
    setStatus('');
  }
  
  setStatus( String message){
    setState(() {
      status = message;
    });
  }
  
  uploadImg(){
    if(null==tempFile){
      setStatus(error);
      return;
    }
    String fileName = tempFile.path.split('/').last;
    upload(fileName);
  }
  
  upload(String fileName){
    http.post('http://10.0.2.2:8000/storage/',
        body: {
      "image":base64Image,
      "name":fileName
    }).then((result){
      setStatus(result.statusCode==200?result.body: error);
    }).catchError((error){
      setStatus(error);
    });
  }
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
              //image upload start
              /*Container(
                height: 400,
                child: Column(
                  children: [
                    FutureBuilder<File>(
                      future: file,
                      builder:
                          (BuildContext context, AsyncSnapshot<File> snapshot) {
                      if(snapshot.connectionState==ConnectionState.done &&
                          null != snapshot.data){
                        tempFile = snapshot.data;
                        base64Image = base64Encode(snapshot.data.readAsBytesSync());

                        return Container(
                            margin:EdgeInsets.all(15),
                            child: Material(
                            elevation: 3.0,
                            child: Image.file(snapshot.data),
                            ),
                            );
                      } else if (null != snapshot.error){
                        return Text('Error');
                      } else {
                        return Container(
                          margin:EdgeInsets.all(15),
                          child: Material(
                            elevation: 3.0,
                            child: Stack(
                              alignment: Alignment.topRight,
                              children: [
                                Container(
                                child: Image.asset('images/user.png'),
                                ),
                                InkWell(
                                  onTap: (){
                                    choseImage();
                                  },
                                  child: Icon(Icons.edit)),
                              ],
                            ),
                          ),
                        );
                      }
                    }),
                    RaisedButton(
                      child: Text('Upload Image'),
                        onPressed: (){
                        uploadImg();
                        }
                    )
                  ],
                ),
              ),*/
              //image upload end
/*              Container(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _imageController,
                        decoration: InputDecoration(
                          labelText: 'Name'
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.camera),
                      onPressed: (){
                        choiceImage();
                      },
                    ),
                    Container(
                      child: _image == null ? Text('No image selected') : Image.file(_image),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),*/
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
                child: DropdownButton(
                    isExpanded: true,
                    hint: Text('Select gender'),
                    value: dropDownValue,
                    items: gender.map((gender){
                      return DropdownMenuItem(child: new Text(gender),value: gender);
                    }).toList(),
                    onChanged: (String newValue){
                      setState(() {
                        dropDownValue = newValue;
                      });
                    }),
                /*Column(

                  children: [
                    *//*new TextField(
                      controller: _genderController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: 'Gender',
                        contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 3),
                        hintText: 'eg: Male, Female',
                        icon: new Icon(FontAwesomeIcons.transgender),
                      ),
                    ),*//*
                    Container(
                      child: DropdownButton(
                        isExpanded: true,
                          hint: Text('Select gender'),
                          value: dropDownValue,
                          items: gender.map((gender){
                            return DropdownMenuItem(child: new Text(gender),value: gender);
                          }).toList(),
                          onChanged: (String newValue){
                            setState(() {
                              dropDownValue = new value;
                              typeVisible = false;
                            });
                          }),
                    )
                  ],
                ),*/
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
                       // _imageController.text.trim(),
                        _categoryController.text.trim(),
                        _yearController.text.trim(),
                        dropDownValue,
                        /*_genderController.text.trim(),*/
                        _addressController.text.trim(),
                        _phoneController.text.trim(),
                        _postedByController.text.trim(),
                        _descriptionController.text.trim(),
                    widget.userId);
                    //uploadImg();
                    //uploadImage();

                    Navigator.of(context).push(
                      new MaterialPageRoute(
                        builder: (BuildContext context) => new BottomNavigationPage(),
                      ),

                    );
                    // SnackBar();
                    // SnackBar mysnackbar = SnackBar(content: Text("Hello Snackbar"))
                    // Scaffold.of(context).showSnackBar(mysnackbar);
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

List<String> gender = [
  'Male',
  'Female'
];
