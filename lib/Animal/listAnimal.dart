import 'package:kat_centre/BottomNavigationBar/bottomNavigationBar.dart';
import 'package:kat_centre/PopupActionPages/Constants.dart';
import 'package:kat_centre/PopupActionPages/DevelopersContact.dart';
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
  Future<List> getData() async {
    final response = await http.get("http://192.168.1.184:8000/api/rescue/");
    return json.decode(response.body);
  }

  void loggedOut() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Text("Are you sure, You want to log out?"),
      actions: <Widget>[
        new RaisedButton(
          child: new Text(
            "Yes",
            style: new TextStyle(color: Colors.white),
          ),
          color: Colors.blue[500],
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(50.0)),
          onPressed: () {
            Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => new LoginPage(),
            ));
          },
        ),
        new RaisedButton(
          child: new Text(
            'Cancel',
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.green[900],
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(50.0)),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );

    showDialog(context: context, child: alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    void choiceAction(String choice) {
      if (choice == Constants.Dev) {
        Navigator.of(context).push(
          new MaterialPageRoute(
            builder: (BuildContext context) => new Developer(),
          ),
        );
        print('DEVELOPER');
      } else if (choice == Constants.Ref) {
        Navigator.of(context).push(
          new MaterialPageRoute(
            builder: (BuildContext context) => new BottomNavigationPage(),
          ),
        );
        print('REFRESH');
      }
    }

    return Theme(
      data: ThemeData(primaryIconTheme: IconThemeData(color: Colors.blue[900])),
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text(
            "Rescue",
            style:
                TextStyle(color: Colors.blue[900], fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white70,
          shadowColor: Colors.blue[900],
          //leading: Icon(Icons.menu, color: Colors.blue[900]),
          actions: <Widget>[
            //for toggle menu
            PopupMenuButton<String>(
              onSelected: choiceAction,
              icon: new Icon(Icons.arrow_forward_ios_outlined,
                  color: Colors.blue[900]),
              itemBuilder: (BuildContext context) {
                return Constants.choices.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            )
          ],
        ),
        body: new FutureBuilder<List>(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? new AnimalList(
                    list: snapshot.data,
                  )
                : new Center(child: new CircularProgressIndicator());
          },
        ),
        drawer: Drawer(
          child: Container(
            color: Colors.blue[900],
            child: ListView(
              children: <Widget>[
                SingleChildScrollView(
                  child: DrawerHeader(
                    child: Container(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(7),
                            child: Center(
                              child: Column(
                                children: <Widget>[
                                  /*CircleAvatar(
                                    backgroundImage:
                                        AssetImage('images/user.png'),
                                    backgroundColor: Colors.black,
                                    radius: 50,
                                  ),*/
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.fromLTRB(
                                          45.0, 5.0, 35.0, 0.0),
                                      child: Center(
                                        child: Image(
                                          image: AssetImage(
                                              'images/KatCentreLogo.jpg'),
                                          width: 150.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                                    child: Text(
                                      'KAT Centre',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20.0),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Divider(
                  color: Colors.blue[200],
                ),
                CustomListTile(
                  Icons.house,
                  'Home',
                  () => {
                    Navigator.of(context).pushReplacement(new MaterialPageRoute(
                        builder: (BuildContext context) =>
                            BottomNavigationPage()))
                  },
                ),
                CustomListTile(
                  Icons.person,
                  'My Account',
                  () => {
                    getUsers(context),
                  },
                ),
                CustomListTile(
                  Icons.pets,
                  'Add Animals',
                  () => {
                    getUserID(context),
                  },
                ),
                /* CustomListTile(
                  Icons.pets,'Add hp', () =>
                {
                  Navigator.of(context).pushReplacement(new MaterialPageRoute(
                      builder: (BuildContext context) => AddHelpline()))

                },),*/
                /*CustomListTile(
                  Icons.attach_money_sharp,
                  'Donation',
                  () => {
                    Navigator.of(context).pushReplacement(new MaterialPageRoute(
                        builder: (BuildContext context) => Donation()))
                  },
                ),*/
                /*CustomListTile(Icons.shop,'Animal Essentials',() =>
                {
                  Navigator.of(context).pushReplacement(new MaterialPageRoute(
                      builder: (BuildContext context) => SnackBarDemo()))
                },),*/
                Divider(color: Colors.blue[200]),
                CustomListTile(
                  Icons.logout,
                  'Logout',
                  () => {
                    loggedOut(),
                  },
                ),
              ],
            ),
          ),
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

  CustomListTile(this.icon, this.text, this.onTap);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18.0, 0, 8.0, 0),
      child: Container(
        /*decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Colors.grey.shade400))
        ),*/
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
                    Icon(icon, color: Colors.blue),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        text,
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ), //Icon(Icons.arrow_right)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
