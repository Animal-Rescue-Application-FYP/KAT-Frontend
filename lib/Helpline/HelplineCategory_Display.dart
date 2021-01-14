
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Helpline_Configuration.dart';
import 'Vet_Card.dart';



class HelplineCategoryDisplay extends StatelessWidget {
  const HelplineCategoryDisplay({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: vets.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 5),

                child: VetCard(
                  vetId: vets[index]['id'],
                  vetName: vets[index]['name'],
                  contact: vets[index]['contact'],
                 distance: vets[index]['distance'],
                 imagePath: vets[index]['imagePath'],
                ),
              );
        },
      ),
    );
  }
}

