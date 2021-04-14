import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kat_centre/Animal/listAnimal.dart';
import 'package:kat_centre/controller/databaseHelper.dart';

class EditAnimal extends StatefulWidget {

  final List list;
  final int index;

  EditAnimal({this.list, this.index});

  @override
  _EditAnimalState createState() => _EditAnimalState();
}

class _EditAnimalState extends State<EditAnimal> {
  DatabaseHelper databaseHelper = new DatabaseHelper();

  TextEditingController controllerAnimalName;
  TextEditingController controllerCategory;
  TextEditingController controllerYear;
  TextEditingController controllerGender;
  TextEditingController controllerAddress;
  TextEditingController controllerPhone;
  TextEditingController controllerPostedBy;
  TextEditingController controllerDescription;
  TextEditingController controllerId;

  void editAnimals (){
    AlertDialog alertDialog = new AlertDialog(
      content: new Text("Are you sure, You want to update the changes?"),
      actions: <Widget>[
        new RaisedButton(
          child: new Text("Yes",
            style: new TextStyle(color: Colors.white),),
          color: Colors.green[500],
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(50.0)
          ),
          onPressed: (){
            Navigator.of(context).push(
                new MaterialPageRoute(builder: (BuildContext context) => new ListAnimal(),)
            );
            databaseHelper.editDataAnimal(
                controllerId.text.trim(),
                controllerAnimalName.text.trim(),
                controllerCategory.text.trim(),
                controllerYear.text.trim(),
                controllerGender.text.trim(),
                controllerAddress.text.trim(),
                controllerPhone.text.trim(),
                controllerPostedBy.text.trim(),
                controllerDescription.text.trim()
            );
          },
        ),
        new RaisedButton(
          child: new Text('Cancel',
            style: TextStyle(color: Colors.white),),
          color: Colors.red[900],
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(50.0)
          ),
          onPressed: ()=> Navigator.pop(context),),
      ],
    );

    showDialog(context: context, child: alertDialog);
  }

  @override
  void initState() {
    // TODO: implement initState
    controllerId = new TextEditingController(text: widget.list[widget.index]['id'].toString());

    controllerAnimalName = new TextEditingController(text: widget.list[widget.index]['animalName'].toString());
    controllerCategory = new TextEditingController(text: widget.list[widget.index]['category'].toString());
    controllerYear = new TextEditingController(text: widget.list[widget.index]['year'].toString());
    controllerGender = new TextEditingController(text: widget.list[widget.index]['gender'].toString());
    controllerAddress = new TextEditingController(text: widget.list[widget.index]['address'].toString());
    controllerPhone = new TextEditingController(text: widget.list[widget.index]['phone'].toString());
    controllerPostedBy = new TextEditingController(text: widget.list[widget.index]['postedBy'].toString());
    controllerDescription = new TextEditingController(text: widget.list[widget.index]['description'].toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        backgroundColor: Colors.blue[900]
      ),
      child: new Scaffold(
        //backgroundColor: Colors.blueGrey,
        appBar: new AppBar(
          title: new Text("Edit Post", style: TextStyle(
              color: Colors.blue[900], fontWeight: FontWeight.bold
          ),),
          backgroundColor: Colors.white70,
          shadowColor: Colors.blue[900],
        ),
        body: Form(
          child: ListView(
            padding: const EdgeInsets.all(10.0),
            children: <Widget>[
              new ListTile(
                leading: const Icon(Icons.pets, color: Colors.black),
                title: new TextFormField(
                    controller: controllerAnimalName,
                    // ignore: missing_return
                    validator: (value) {
                      if (value.isEmpty)
                        return "Enter Animal Name";
                    },
                    decoration: new InputDecoration(
                      hintText: "eg. Bruno, Milo, Kitty",
                      labelText: "Animal Name",
                    )
                ),
              ),
              new ListTile(
                leading: const Icon(Icons.category, color: Colors.black),
                title: new TextFormField(
                    controller: controllerCategory,
                    // ignore: missing_return
                    validator: (value) {
                      if (value.isEmpty)
                        return "Enter Category";
                    },
                    decoration: new InputDecoration(
                      hintText: "eg. Dog, Cat, Cow",
                      labelText: "Category",
                    )
                ),
              ),
              new ListTile(
                leading: const Icon(Icons.cake, color: Colors.black),
                title: new TextFormField(
                    controller: controllerYear,
                    // ignore: missing_return
                    validator: (value) {
                      if (value.isEmpty)
                        return "Enter Age of animal";
                    },
                    decoration: new InputDecoration(
                      hintText: "eg. 1, 2, 3....",
                      labelText: "Age",
                    )
                ),
              ),
              new ListTile(
                leading: const Icon(FontAwesomeIcons.transgender, color: Colors.black),
                title: new TextFormField(
                    controller: controllerGender,
                    // ignore: missing_return
                    validator: (value) {
                      if (value.isEmpty)
                        return "Enter Animal gender";
                    },
                    decoration: new InputDecoration(
                      hintText: "eg. Male, Female",
                      labelText: "Gender",
                    )
                ),
              ),
              new ListTile(
                leading: const Icon(Icons.location_on, color: Colors.black),
                title: new TextFormField(
                    controller: controllerAddress,
                    // ignore: missing_return
                    validator: (value) {
                      if (value.isEmpty)
                        return "Please enter location";
                    },
                    decoration: new InputDecoration(
                      hintText: "eg. New Road, Kathmandu",
                      labelText: "Location",
                    )
                ),
              ),
              new ListTile(
                leading: const Icon(Icons.person, color: Colors.black),
                title: new TextFormField(
                    controller: controllerPostedBy,
                    // ignore: missing_return
                    validator: (value) {
                      if (value.isEmpty)
                        return "Please enter your name";
                    },
                    decoration: new InputDecoration(
                      hintText: "eg. Rasana, Urusha, Samyush",
                      labelText: "Posted By",
                    )
                ),
              ),
              new ListTile(
                leading: const Icon(Icons.message, color: Colors.black),
                title: new TextFormField(
                    controller: controllerDescription,
                    // ignore: missing_return
                    validator: (value) {
                      if (value.isEmpty)
                        return "@description....";
                    },
                    decoration: new InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: "@description...",
                      labelText: "Description",
                    ),
                  maxLines: 6,
                  textAlign: TextAlign.justify,
                ),
              ),
              const Divider(
                height: 1.0,
              ),
              new Padding(
                padding: const EdgeInsets.all(10.0),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(80,0,80,0),
                child: new RaisedButton(
                  child: new Text('Update', style: TextStyle(color: Colors.white),),
                  color: Colors.blue[900],
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(50.0)
                  ),
                  onPressed: (){
                    editAnimals();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
