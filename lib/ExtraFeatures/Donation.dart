import 'package:flutter/material.dart';
import 'package:kat_centre/BottomNavigationBar/bottomNavigationBar.dart';

class Donation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        title: new Text("Donation Page", style: TextStyle(
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
      body: Container(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0,25,0,0),
                child: Text('Fone Pay Scan to Donate',
                style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.green[600], fontSize: 25.0
                ),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image(image: AssetImage('images/fonepay.PNG'),height:100, width: 150),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image(image: AssetImage('images/QRCode.PNG'),height:300, width: 300),
              ),
              Text('Islington College Pvt. Ltd.',
                style: TextStyle(
                    color: Colors.black87, fontSize: 20.0
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
