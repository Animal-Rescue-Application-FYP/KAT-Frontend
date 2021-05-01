import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AssistanceList extends StatelessWidget {
  final String url;

  final List list;
  AssistanceList({this.list, this.url});

  void customLaunch(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print('could not launch $command');
    }
  }

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
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: new ListTile(
              title: Column(
                children: [
                  SingleChildScrollView(
                    child: Row(
                      children: [
                        Icon(Icons.help),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                        ),
                        Expanded(
                          child: new Text(
                            list[i]['query'].toString(),
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.blueGrey[900],
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                  ),
                  SingleChildScrollView(
                    child: Row(
                      children: [
                        // Icon(
                        //     Icons.message
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.all(20.0),
                        // ),
                        Expanded(
                          child: new Text(
                            list[i]['description'].toString(),
                            style: TextStyle(
                                fontSize: 18.0, color: Colors.black87),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ],
                    ),
                  ),
                  FlatButton(
                      onPressed: () {
                        customLaunch('${list[i]['url'].toString()}');
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(100, 0, 0, 0),
                            child: Text(
                              'View More',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                //decoration: TextDecoration.underline,
                                color: Colors.blue[900],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.double_arrow_sharp,
                            size: 16,
                            color: Colors.blue[900],
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
