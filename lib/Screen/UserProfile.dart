import 'package:flutter/material.dart';
import 'package:kat_centre/Animal/detailAnimal.dart';
import 'package:kat_centre/BottomNavigationBar/bottomNavigationBar.dart';
import 'package:kat_centre/Screen/editUser.dart';

class UserProfile extends StatelessWidget {
  final currentUser;
  final rescueData;
  final List list;
  final int index;
  final int dataLength;
  UserProfile(
      {this.currentUser,
      this.rescueData,
      this.list,
      this.index,
      this.dataLength});
  @override
  Widget build(BuildContext context) {
    // DatabaseHelper databaseHelper = new DatabaseHelper();
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: new AppBar(
        title: new Text(
          "${currentUser['user']['name']}",
          style:
              TextStyle(color: Colors.blue[900], fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white70,
        shadowColor: Colors.blue[900],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.blue[900],
          onPressed: () {
            Navigator.of(context).pushReplacement(new MaterialPageRoute(
                builder: (BuildContext context) => BottomNavigationPage()));
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 1,
              bottom: 5,
            ),
            height: 250.0,
            child: Card(
              elevation: 1,
              margin: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "${currentUser['user']['name']}",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black87,
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.italic),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "${currentUser['user']['phone']}",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black87,
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.italic),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "${currentUser['user']['email']}",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black87,
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.italic),
                                        ),
                                      ),
                                      RaisedButton(
                                        child: new Text(
                                          "Edit",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        color: Colors.blue[800],
                                        shape: new RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(30.0),
                                        ),
                                        onPressed: () => {
                                          Navigator.of(context).push(
                                            new MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  new EditUser(
                                                      list: list,
                                                      index: list.length),
                                            ),
                                          )
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            elevation: 1,
            margin: EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Your Posts',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.blue[900],
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                ),
                SizedBox(
                  height: 300,
                  child: ListView.builder(
                    itemCount: dataLength,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        child: GestureDetector(
                          onTap: () => Navigator.of(context).push(
                            new MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  new AnimalDetails(
                                list: rescueData,
                                index: index,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Card(
                              elevation: 1,
                              margin: EdgeInsets.all(20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                            'Animal Name: ${rescueData[index]['animalName']}',
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                color: Colors.black87,
                                                fontStyle: FontStyle.italic)),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                              'Category: ${rescueData[index]['category']}',
                                              style: TextStyle(
                                                  fontSize: 15.0,
                                                  fontStyle: FontStyle.italic,
                                                  color: Colors.black87)),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                            'Age: ${rescueData[index]['year']}',
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                fontStyle: FontStyle.italic,
                                                color: Colors.black87)),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Text(
                                            'Gender: ${rescueData[index]['gender']}',
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                fontStyle: FontStyle.italic,
                                                color: Colors.black87)),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                              'Location: ${rescueData[index]['address']}',
                                              style: TextStyle(
                                                  fontSize: 15.0,
                                                  fontStyle: FontStyle.italic,
                                                  color: Colors.black87)),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                            'Phone: ${rescueData[index]['phone']}',
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                fontStyle: FontStyle.italic,
                                                color: Colors.black87)),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text('Tap to Edit or Remove >>',
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold,
                                                fontStyle: FontStyle.italic)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
