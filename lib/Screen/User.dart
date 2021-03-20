import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'HomePage.dart';

class Users extends StatelessWidget {
  @override
  Widget textfield({@required String hintText}){
    return Material(
      elevation: 4,
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            letterSpacing: 2,
            color: Colors.black45,
            fontWeight: FontWeight.bold,
          ),
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none
          ),
        ),
      ),
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.blue[900],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.of(context).pushReplacement(new MaterialPageRoute(
                builder: (BuildContext context) => HomeScreen()));
          },
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 550,
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(0, 170, 0, 0),
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                textfield(
                  hintText: 'Rasana Tamrakar',
                ),
                textfield(
                  hintText: 'rasana12945@gmail.com',
                ),
                textfield(
                  hintText: '*********',
                ),
                textfield(
                  hintText: '*********',
                ),
                Container(
                  height: 55,
                  width: double.infinity,
                  child: RaisedButton(
                    onPressed: (){
                    },
                    color: Colors.blue[900],
                    child: Center(
                      child: Text("Update",
                      style: TextStyle(
                        fontSize: 23,
                        color: Colors.white,

                      ),),
                    ),
                  ),
                )
              ],
            ),
          ),
          CustomPaint(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            painter: HeaderCurverContainer(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.all(1),
                child: Text("Profile",
                  style: TextStyle(fontSize: 30, letterSpacing: 1.5, color: Colors.white, fontWeight: FontWeight.w600),),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                width: MediaQuery.of(context).size.width/2,
                height: MediaQuery.of(context).size.width/2,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 5),
                  shape: BoxShape.circle,
                  color: Colors.white,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('images/pp1.jpg')
                  ),
                ),
              )
            ],
          ),
          Padding(padding: EdgeInsets.only(bottom: 270, left: 184),
            child: CircleAvatar(
              backgroundColor: Colors.blue[900],
              child: IconButton(icon: Icon(
                Icons.edit,
                color: Colors.white,
              ),
                onPressed: (){},
              ),
            ),)
        ],
      ),
    );
  }
}

class HeaderCurverContainer extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size){
    Paint paint=Paint()..color=Colors.blue[900];
    Path path=Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 2, 225, size.width, 150)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate)=>false;
}


