import 'package:flutter/material.dart';

class Dev extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Developer Contact'),
        backgroundColor: Colors.black87
      ),
      body: Container(
        child: Row(
          children: [
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
        )
      ),
    );
  }
}
