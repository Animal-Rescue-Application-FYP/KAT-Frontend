import 'package:flutter/material.dart';
import 'package:kat_centre/Screen/HelplineNumbers.dart';
import 'package:kat_centre/Screen/HomePage.dart';
import 'package:kat_centre/Screen/NearbyHospitals.dart';
import 'package:kat_centre/Screen/MedicalAssistance.dart';
import 'package:kat_centre/Screen/User.dart';
import 'package:kat_centre/Helpline/listHelpline.dart';

import 'package:flutter/material.dart';

class BottomNavigationPage extends StatefulWidget {
  static String routeName = "/bottom_nav";

  @override
  _BottomNavigationPageState createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    NearbyLocation(),
    HelplineNumbers(),
    // ListHelpline(),
    MedicalAssistance(),
    //Users(),

    // Categories(),
    // CartScreen(),
    // MyOrders(),
    // ProfilePage(),

    // Profile()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on_outlined),
            label: 'Nearby Location',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call_outlined),
            label: 'Helpline Numbers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_hospital_outlined),
            label: 'Medical Assistance',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.account_circle),
          //   label: 'Profile',
          // ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[900],
        onTap: _onItemTapped,
        unselectedItemColor: Colors.grey[600],
      ),
    );
  }
}
