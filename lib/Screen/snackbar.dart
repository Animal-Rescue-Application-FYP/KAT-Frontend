import 'package:flutter/material.dart';

void createSnackBar(String message, Color snackBarColor, BuildContext context) {
  final snackBar = SnackBar(
    backgroundColor: snackBarColor,
    content: Text("message"),
    duration: Duration(seconds: 2),
  );
  Scaffold.of(context).showSnackBar(snackBar);
}

//
/*class Snacks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('Snackbar'),
    //   ),
    //   body:
      Builder(builder: (context){
        return Container(
          child: Center(
            child: FlatButton(
              child: Text('Snackbar', style: TextStyle(fontSize: 20.0),),
              onPressed: (){
                SnackBar mysnackbar = SnackBar(content: Text("Hello Snackbar"));
                Scaffold.of(context).showSnackBar(mysnackbar);
              },
            ),
          ),
        );
      });
    //);
  }
}*/
