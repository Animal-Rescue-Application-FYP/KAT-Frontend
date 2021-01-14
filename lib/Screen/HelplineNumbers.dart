import 'package:flutter/material.dart';
import 'package:kat_centre/Helpline/HelplineCategory_Display.dart';

class HelplineNumbers extends StatefulWidget {
  @override
  _HelplineNumbersState createState() => _HelplineNumbersState();
}

class _HelplineNumbersState extends State<HelplineNumbers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Helpline Numbers'),
        backgroundColor: Colors.blue[900],
      ),
      body: SafeArea(
        child:Column(
          children: [
              SizedBox(
                height: 20,
              ),
            HelplineCategoryDisplay(),
          ],
        )
      ),
    );
  }
}
