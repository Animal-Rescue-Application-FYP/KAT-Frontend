import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ItemList extends StatelessWidget {
  final String phone;

  void customLaunch(command) async{
    if(await canLaunch(command)){
      await launch(command);
    }else{
      print('could not launch $command');
    }
  }

  final List list;
  ItemList({this.list,this.phone});
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child: new Card(
            elevation: 1,
            margin: EdgeInsets.all(5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: new ListTile(
              title: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(40,0,0,0),
                        child: Icon(
                          Icons.house,
                          color: Colors.blue[900],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new Text(
                            list[i]['name'].toString(),
                            style: TextStyle(fontSize: 25.0, color: Colors.blue[900], fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(40,0,0,0),
                        child: Icon(
                          Icons.location_on_sharp,
                          color: Colors.red[900],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                      ),
                      new Text(
                        list[i]['address'].toString(),
                        style: TextStyle(fontSize: 15.0, color: Colors.red[900], fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,0,100,0),
                    child: SizedBox(
                      width: 170,
                      child: RaisedButton(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.call,
                              color: Colors.blue[900],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                            ),
                            new Text(
                              list[i]['phone'].toString(),
                              style: TextStyle(fontSize: 15.0, color: Colors.blue[900]),
                            ),
                          ],
                        ),
                        onPressed: (){
                          customLaunch('tel: ${list[i]['phone'].toString()}');
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
