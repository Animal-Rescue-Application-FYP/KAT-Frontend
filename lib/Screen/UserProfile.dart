import 'package:flutter/material.dart';
import 'package:kat_centre/BottomNavigationBar/bottomNavigationBar.dart';
import 'package:kat_centre/Screen/editUser.dart';
import 'package:kat_centre/controller/databaseHelper.dart';


class UserProfile extends StatelessWidget {

  final currentUser;
  final rescueData;
  final List list;
  final int index;
  //final dataLength;
  UserProfile({this.currentUser, this.rescueData, this.index, this.list});
  @override
  Widget build(BuildContext context) {
    var widget;
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
        backgroundColor: Colors.blue[900],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.of(context).pushReplacement(new MaterialPageRoute(
                builder: (BuildContext context) => BottomNavigationPage()));
          },
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(
          top: 35,
          bottom: 35,
        ),
        height: 250.0,
        child: Row(
          children: [
            Expanded(
              child: Container(
                margin:
                EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   Row(
                     children: [
                       Column(
                         children: <Widget>[
                           Image(
                             image: AssetImage(
                                 'images/KatCentre.jpg'),
                             width: 150.0,
                           ),
                         ],
                       ),
                       Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Name: ${currentUser['user']['name']}",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text("Phone: ${currentUser['user']['phone']}",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text("Email Address: ${currentUser['user']['email']}",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            RaisedButton(
                              child: new Text("Edit"),
                              color: Colors.blue[800],
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0),
                              ),
                              onPressed: () => {
                                Navigator.of(context).push(
                                  new MaterialPageRoute(builder: (BuildContext context) =>
                                  new EditUser(list: widget.list, index: widget.index),),)
                              },
                            ),
                          ],
                        ),
                       // Container(
                       //   decoration: BoxDecoration(
                       //     //  color: randomColor,
                       //     //  boxShadow: customShadow,
                       //     borderRadius: BorderRadius.circular(22),
                       //   ),
                       //   margin: EdgeInsets.only(top: 50),
                       // ),
                       // Align(
                       //   child: Hero(
                       //     child: Image.asset(
                       //         'images/KatCentre.jpg'
                       //     ),
                       //   ),
                       // ),
                     ],
                   ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.blue[900],
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        ),
        // child: Card(
        //   child: Column(
        //       children: [
        //               Text("${currentUser['user']['name']}",
        //               ),
        //               Text("${currentUser['user']['phone']}"),
        //               Text("${currentUser['user']['email']}"),
        //               //Text("${rescueData[2]['animalName']}"),
        //         //
        //       ],
        //   ),
        // ),
      ),
    );
  }
}
