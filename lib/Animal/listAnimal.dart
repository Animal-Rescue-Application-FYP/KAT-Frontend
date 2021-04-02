import 'package:kat_centre/Animal/addAnimal.dart';
import 'package:kat_centre/Helpline/addHelpline.dart';
import 'package:kat_centre/MedicalAssistance/addAssistance.dart';
import 'package:kat_centre/User/detailUser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kat_centre/Screen/User.dart';
import 'package:http/http.dart' as http;
import 'package:kat_centre/Screen/Login.dart';
import 'dart:async';
import 'dart:convert';
import 'animalList.dart';

class ListAnimal extends StatefulWidget {
  @override
  _ListAnimalState createState() => _ListAnimalState();
}

class _ListAnimalState extends State<ListAnimal> {
  List data;
  Future<List> getData()async {
    final response = await http.get("http://10.0.2.2:8000/api/rescue/");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("KAT Centre"),
        backgroundColor: Colors.blue[900],
      ),
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new AnimalList(
            list: snapshot.data,
          )
              : new Center(
              child: new CircularProgressIndicator()
          );
        },
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            SingleChildScrollView(
              child: DrawerHeader(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: <Color>[
                          Colors.blue[900],
                          Colors.blue[900]
                        ]
                    ),
                  ),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage('images/pp1.jpg'),
                          radius: 50,
                        ),
                        Padding(padding: EdgeInsets.all(7.0),
                          child:
                          Text('Rasana Tamrakar',
                            style: TextStyle(color: Colors.white, fontSize: 20.0),),
                        )
                      ],
                    ),
                  )),
            ),
            CustomListTile(Icons.person,'Profile',() =>
            {
              getUsers(context),
            },),
            // GestureDetector(
            //   // onTap: getUsers(context),
            // ),
            CustomListTile(
              Icons.pets,'Add Animals', () =>
            {
              getUserID(context),
            },),
            CustomListTile(Icons.account_balance,'Add Helpline Number',() =>
            {
              Navigator.of(context).pushReplacement(new MaterialPageRoute(
                  builder: (BuildContext context) => AddHelpline()))
            },),
            CustomListTile(Icons.help,'Add Medical Assistance',() =>
            {
              Navigator.of(context).pushReplacement(new MaterialPageRoute(
                  builder: (BuildContext context) => AddAssistance()))
            },),
            CustomListTile(Icons.logout,'Logout',() =>
            {
              // onPressed: () {
              //   sharedPreferences.clear();
              //   sharedPreferences.commit();
              //   Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginPage()), (Route<dynamic> route) => false);
              // },
              Navigator.of(context).pushReplacement(new MaterialPageRoute(
                  builder: (BuildContext context) => LoginPage()))
            },),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomListTile extends StatelessWidget {

  IconData icon;
  String text;
  Function onTap;

  CustomListTile(this.icon,this.text,this.onTap);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Container(
        decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Colors.grey.shade400))
        ),
        child: InkWell(
          splashColor: Colors.blueAccent,
          onTap: onTap,
          child: Container(
            height: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(icon),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(text,
                        style: TextStyle(
                          fontSize: 16.0,
                        ),),
                    )
                  ],
                ),
                Icon(Icons.arrow_right)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

