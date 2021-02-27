import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';


class NearbyLocation extends StatefulWidget {
  @override
  _NearbyLocationState createState() => _NearbyLocationState();
}

class _NearbyLocationState extends State<NearbyLocation> {
  //location-tracking-start
  // StreamSubscription _locationSubscription;
  // Location _locationTracker = Location();
  // Marker marker;
  // Circle circle;
  // GoogleMapController _controller;
  //
  // static final CameraPosition initialLocation = CameraPosition(
  //   target: LatLng(27.717245,85.323959),
  //   zoom: 15,
  // );
  // Future<Uint8List> getMarker() async{
  //   ByteData byteData = await DefaultAssetBundle.of(context).load("images/injured_pets.png");
  //   return byteData.buffer.asUint8List();
  // }
  // void getCurrentLocation() async{
  //   try{
  //     Uint8List imageData = await getMarker();
  //     var location = await _locationTracker.getLocation();
  //
  //     updateMarkerAndCircle(location, imageData);
  //
  //     if (_locationSubscription != null){
  //       _locationSubscription.cancel();
  //     }
  //
  //     _locationSubscription = _locationTracker.onLocationChanged().listen((newLocalData){
  //       if (_controller != null){
  //         _controller.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
  //           target: LatLng(new LocalData.latitude, newLocalData.longitude),
  //           bearing: 192.833,
  //           tilt: 0,
  //           zoom: 18.00
  //         )));
  //       } on PlatformException catch (e) {
  //         if (e.code == 'PERMISSION_DENIED'){
  //           debugPrint("Permission Denied");
  //       }
  //       }
  //     })
  //   }
  // }
  //location-tracking-end
  Set<Marker> _markers={};

  void _onMapCreated(GoogleMapController controller){
    _markers.add(
        Marker(
          markerId: MarkerId('id-1'),
          position: LatLng(27.717245,85.323959),
          infoWindow: InfoWindow(
            title: 'Kathmandu Durbar Square',
            snippet:'Historical Royal Museum of Nepal'
          )
        ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Map'),
        backgroundColor: Colors.blue[900],
      ),
      body: Center(
        child: GoogleMap(
          mapType: MapType.hybrid,
          onMapCreated: _onMapCreated,
          markers: _markers,
          initialCameraPosition: CameraPosition(
            target: LatLng(27.717245,85.323959),
            zoom: 15,
        ),
        ),
        ),
    // GoogleMap(
    // mapType: MapType.hybrid,
    // initialCameraPosition: initialLocation,
    // markers: Set.of((marker != null) ? [marker] : []),
    // circles: Set.of((circle != null) ? [circle] : []),
    // onMapCreated: (GoogleMapController controller){
    // _controller = controller;
    // },
    //   floatingActionButton: FloatingActionButton(
    //     child: Icon(Icons.location_searching),
    //     onPressed: (){
    //
    //     },
    //   ),
    );
  }
}

