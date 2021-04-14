import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///F:/Year%203/Final%20Year%20Project/Final%20Project/kat_centre/lib/Splash%20Screen/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashDisplay(),
    );
  }
}

//
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


