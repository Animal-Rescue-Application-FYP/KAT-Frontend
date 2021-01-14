import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class NearbyLocation extends StatefulWidget {
  @override
  _NearbyLocationState createState() => _NearbyLocationState();
}

class _NearbyLocationState extends State<NearbyLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nearby Location'),
        backgroundColor: Colors.blue[900],
      ),
    );
  }
}

