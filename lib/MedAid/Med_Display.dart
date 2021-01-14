
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Med_Card.dart';
import 'Med_Configuration.dart';


class MedDisplay extends StatelessWidget {
  const MedDisplay({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: med.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            child: MedCard(
              medId: med[index]['id'],
              question: med[index]['question'],
              search: med[index]['search'],
             // imagePath: med[index]['imagePath'],
            ),
          );
        },
      ),
    );
  }
}

