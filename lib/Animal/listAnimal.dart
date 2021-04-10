import 'package:kat_centre/BottomNavigationBar/bottomNavigationBar.dart';
import 'package:kat_centre/Constant/Constants.dart';
import 'package:kat_centre/ExtraFeatures/Donation.dart';
import 'package:kat_centre/ExtraFeatures/ShopLocation.dart';
import 'package:kat_centre/Helpline/addHelpline.dart';
import 'package:kat_centre/MedicalAssistance/addAssistance.dart';
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
  Future<List> getData()async {
    final response = await http.get("http://10.0.2.2:8000/api/rescue/");
    return json.decode(response.body);
  }

  //
  void loggedOut (){
    AlertDialog alertDialog = new AlertDialog(
      content: new Text("Are you sure, You want to log out?"),
      actions: <Widget>[
        new RaisedButton(
          child: new Text("Yes",
            style: new TextStyle(color: Colors.white),),
          color: Colors.blue[500],
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(50.0)
          ),
          onPressed: (){
            Navigator.of(context).push(
                new MaterialPageRoute(builder: (BuildContext context) => new LoginPage(),)
            );
          },
        ),
        new RaisedButton(
          child: new Text('Cancel',
            style: TextStyle(color: Colors.white),),
          color: Colors.green[900],
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(50.0)
          ),
          onPressed: ()=> Navigator.pop(context),),
      ],
    );

    showDialog(context: context, child: alertDialog);
  }
  //

  @override
  Widget build(BuildContext context) {
    void choiceAction(String choice){
      if(choice == Constants.Dev){
        Navigator.of(context).push(
          new MaterialPageRoute(builder: (BuildContext context) =>
          new Developer(),),);
        print('DEVELOPER');
      }else if(choice == Constants.Help){
        print('HELP');
      }

    }
    return Theme(
      data: ThemeData(
          primaryIconTheme: IconThemeData(color: Colors.blue[900])),
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text("Available Rescue Animals", style: TextStyle(
            color: Colors.blue[900], fontWeight: FontWeight.bold
          ),),
          backgroundColor: Colors.white70,
          shadowColor: Colors.blue[900],
          //leading: Icon(Icons.menu, color: Colors.blue[900]),
          actions: <Widget>[ //for toggle menu
            PopupMenuButton<String>(
              onSelected: choiceAction,
              icon: new Icon(Icons.arrow_forward_ios_outlined, color: Colors.blue[900]),
              itemBuilder: (BuildContext context){
                return Constants.choices.map((String choice){
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
                : new Center(
                child: new CircularProgressIndicator()
            );
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
                              padding: const EdgeInsets.fromLTRB(70,0,0,0),
                              child: Center(
                                child: Column(
                                  children: <Widget>[
                                    CircleAvatar(
                                      backgroundImage: AssetImage('images/user.png'),
                                      backgroundColor: Colors.black,
                                      radius: 50,
                                    ),
                                    Padding(padding: EdgeInsets.all(7.0),
                                      child:
                                      Text('KAT Centre',
                                        style: TextStyle(color: Colors.white, fontSize: 20.0),),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
                Divider(
                  color: Colors.blue[200],
                ),
                CustomListTile(Icons.house,'Home',() =>
                {
                  Navigator.of(context).pushReplacement(new MaterialPageRoute(
                      builder: (BuildContext context) => BottomNavigationPage()))
                },),
                CustomListTile(Icons.person,'My Account',() =>
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
                /*CustomListTile(Icons.account_balance,'Add Helpline Number',() =>
                {
                  Navigator.of(context).pushReplacement(new MaterialPageRoute(
                      builder: (BuildContext context) => AddHelpline()))
                },),
                CustomListTile(Icons.help_outline,'Add Medical Assistance',() =>
                {
                  Navigator.of(context).pushReplacement(new MaterialPageRoute(
                      builder: (BuildContext context) => AddAssistance()))
                },),*/
                CustomListTile(Icons.attach_money_sharp,'Donation',() =>
                {
                  Navigator.of(context).pushReplacement(new MaterialPageRoute(
                      builder: (BuildContext context) => Donation()))
                },),
                CustomListTile(Icons.shop,'Animal Essentials',() =>
                {
                  Navigator.of(context).pushReplacement(new MaterialPageRoute(
                      builder: (BuildContext context) => SnackBarDemo()))
                },),
                Divider(
                  color: Colors.blue[200]
                ),
                CustomListTile(Icons.logout,'Logout',() =>
                {
                  loggedOut(),
                },),
              ],
            ),
          ),
        ),
      ),
    );

  }

/*
  logout(BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");
    Map data = {'token': token};
    var url = "http://10.0.2.2:8000/api/logout";
    http.Response response = await http.post(url, body: data);
    var jsonResponse = json.decode(response.body);
    if (response.statusCode == 200) {
      print('jsonResponse:${jsonResponse["token"]}');
      *//*_save(jsonResponse["token"]);*//*
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
              (Route<dynamic> route) => false);
      //createSnackBar('Successfully logged out', Colors.green, context);
      print('$context');
    } else {
      print('jsonResponse: ${jsonResponse["error"]}');
      //createSnackBar('Could not logout', Colors.red, context);
    }
  }
*/
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
                    Icon(icon, color: Colors.blue,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(text,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w600
                        ),),
                    )
                  ],
                ),
                //Icon(Icons.arrow_right)
              ],
            ),
          ),
        ),
      ),
    );
  }
}


