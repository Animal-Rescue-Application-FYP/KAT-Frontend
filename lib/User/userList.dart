import 'package:flutter/material.dart';
import 'detailUser.dart';

class UserList extends StatelessWidget {
  final List list;
  UserList({this.list});
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child: new GestureDetector(
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => new DetailUser(
                list: list,
                index: i,
              ),
            ),),
            child: new Card(
              child: new ListTile(
                title: Column(
                  children: [
                    SingleChildScrollView(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                          ),
                          Expanded(
                            child: new Text(
                              list[i]['name'].toString(),
                              style: TextStyle(fontSize: 25.0, color: Colors.black87),
                            ),
                          ),
                        ],
                      ),
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

