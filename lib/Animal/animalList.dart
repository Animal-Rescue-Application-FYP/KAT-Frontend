import 'package:flutter/material.dart';
import 'package:kat_centre/Animal/animalDescription.dart';
import 'package:url_launcher/url_launcher.dart';

class AnimalList extends StatelessWidget {
  final String phone;
  void customLaunch(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print('could not launch $command');
    }
  }

  final List list;
  AnimalList({this.list, @required this.phone});
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: () => Navigator.of(context).push(
              new MaterialPageRoute(
                builder: (BuildContext context) => new AnimalDescription(
                  list: list,
                  index: i,
                ),
              ),
            ),
            child: new Card(
              child: new ListTile(
                title: Column(
                  children: [
                    /*CachedNetworkImage(
                      imageUrl:
                          "http://10.0.2.2:8000/storage/${list[i]['image']}",
                      */ /*placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),*/ /*
                    ),*/
                    Container(
                      child: Image.network(
                          'http://192.168.0.107:8000/storage/${list[i]['image']}'),
                    ),
                    Row(
                      children: [
                        new Text(
                          list[i]['animalName'].toString(),
                          style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.category_sharp,
                          color: Colors.blue[900],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                        ),
                        new Text(
                          "${list[i]['category'].toString()}",
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),
                        ),
                        //Text("${currentUser['user']['name']}"),
                      ],
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.cake,
                              color: Colors.pink,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                            ),
                            new Text(
                              "${list[i]['year'].toString()} years old",
                              style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 30.0),
                        ),
                        new Text(
                          "Gender: ${list[i]['gender'].toString()}",
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_sharp,
                          color: Colors.red[900],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                        ),
                        new Text(
                          list[i]['address'].toString(),
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    RaisedButton(
                      color: Colors.blue[900],
                      padding: const EdgeInsets.fromLTRB(1, 0, 0, 0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                          ),
                          Icon(Icons.call, color: Colors.white70),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                          ),
                          new Text(
                            list[i]['phone'].toString(),
                            style: TextStyle(
                                fontSize: 15.0, color: Colors.white70),
                          ),
                        ],
                      ),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                      onPressed: () {
                        customLaunch('tel: ${list[i]['phone'].toString()}');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
