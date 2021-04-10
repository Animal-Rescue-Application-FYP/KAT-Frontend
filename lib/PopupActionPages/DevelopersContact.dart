import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:kat_centre/BottomNavigationBar/bottomNavigationBar.dart';

class Developer extends StatelessWidget {
  void customLaunch(command) async{
    if(await canLaunch(command)){
      await launch(command);
    }else{
      print('could not launch $command');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: new AppBar(
        title: new Text("Developers Contact", style: TextStyle(
            color: Colors.blue[900], fontWeight: FontWeight.bold
        ),),
        backgroundColor: Colors.white70,
        shadowColor: Colors.blue[900],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.blue[900],
          onPressed: (){
            Navigator.of(context).pushReplacement(new MaterialPageRoute(
                builder: (BuildContext context) => BottomNavigationPage()));
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0,80.0,0,0),
        child: Container(
          height: 430,
          child: new Card(
            elevation: 1,
            margin: EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: new ListTile(
              title: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('images/pp1.jpg'),
                      backgroundColor: Colors.white70,
                      radius: 100,
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(7.0),
                    child:
                    Text('RASANA TAMRAKAR',
                      style: TextStyle(color: Colors.black87, fontSize: 20.0, fontWeight: FontWeight.bold),),
                  ),
                  FlatButton(
                    padding: const EdgeInsets.fromLTRB(1, 0, 0, 0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0,15,40,15),
                        ),
                        Icon(
                            Icons.email, color: Colors.blue[900]
                        ),
                        /*Padding(
                          padding: const EdgeInsets.all(25.0),
                        ),*/
                        new Text(
                          'rasana12945@gmail.com',
                          style: TextStyle(color: Colors.blue[900], fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    onPressed: (){
                      customLaunch('mailto: ${'rasana12945@gmail.com'}');
                    },
                  ),
                  SizedBox(
                    width: 200,
                    child: RaisedButton(
                      color: Colors.blue[900],
                      padding: const EdgeInsets.fromLTRB(1, 0, 0, 0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0,15,40,15),
                          ),
                          Icon(
                              Icons.call, color: Colors.white70
                          ),
                          new Text(
                            '9860756157',
                            style: TextStyle(fontSize: 15.0, color: Colors.white70),
                          ),
                        ],
                      ),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                      onPressed: (){
                        customLaunch('tel: ${['9860756157']}');
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
