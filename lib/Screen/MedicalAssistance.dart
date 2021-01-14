import 'package:flutter/material.dart';
import 'package:kat_centre/MedAid/Med_Display.dart';

class MedicalAssistance extends StatefulWidget {
  @override
  _MedicalAssistanceState createState() => _MedicalAssistanceState();
}

class _MedicalAssistanceState extends State<MedicalAssistance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medical Assistance'),
        backgroundColor: Colors.blue[900],
      ),
      body: SafeArea(
          child:Column(
            children: [
              Image(
                image: AssetImage('images/Pet_tips.jpg'),
              ),
             Divider(
               thickness: 10.0,
             ),
              MedDisplay(), // MedDisplay(),
            ], //children
          )
      ),
    );
  }
}
