import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NearbyLocation extends StatefulWidget {
  @override
  _NearbyLocationState createState() => _NearbyLocationState();
}

class _NearbyLocationState extends State<NearbyLocation> {

  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();
  }
  double zoomVal=5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              //
            }),
        title: Text("Animal Hospitals"),
        backgroundColor: Colors.blue[900],
        // actions: <Widget>[
        //   IconButton(
        //       icon: Icon(FontAwesomeIcons.search),
        //       onPressed: () {
        //         //
        //       }),
        // ],
      ),
      body: Stack(
        children: <Widget>[
          _buildGoogleMap(context),
          _ZoomMinus(),
          _ZoomPlus(),
          _buildContainer(),
        ],
      ),
    );
  }
  // ignore: non_constant_identifier_names
  Widget _ZoomMinus() {

    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
          icon: Icon(FontAwesomeIcons.searchMinus,color:Colors.blue[900]),
          onPressed: () {
            zoomVal--;
            _minus( zoomVal);
          }),
    );
  }
  // ignore: non_constant_identifier_names
  Widget _ZoomPlus() {

    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
          icon: Icon(FontAwesomeIcons.searchPlus,color:Colors.blue[900]),
          onPressed: () {
            zoomVal++;
            _plus(zoomVal);
          }),
    );
  }
  Future<void> _minus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(27.740822, 85.335066), zoom: zoomVal)));
  }
  Future<void> _plus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(27.740822, 85.335066), zoom: zoomVal)));
  }
  Widget _buildContainer() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 150.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://scontent.fktm7-1.fna.fbcdn.net/v/t31.18172-8/17547029_775574645943727_6429623891022261632_o.jpg?_nc_cat=103&ccb=1-3&_nc_sid=e3f864&_nc_ohc=uq6NkdBJAowAX88zahm&_nc_ht=scontent.fktm7-1.fna&oh=331bc39c53ceb7dcfacc3e3f7bcfd6b2&oe=60886C81",
                  27.740628, 85.335008,"Kathmandu Veterinary Clinic","Ring Road Chakrapath, Kathmandu"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh3.googleusercontent.com/p/AF1QipP1naHMUM8ZR5VV5cyu0jl8rV020jDgFk3jKDoy=s1600-w400",
                  27.695294, 85.311274,"Central Referral Veterinary Hospital","	त्र्‍िपुरा मार्ग, Kathmandu 44614, Nepal"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://www.nepalyp.com/img/np/d/_1434512923-69-kathmandu-animal-hospital-and-research-centre.png",
                  27.677654, 85.343997,"Animal Hospital and Research Center","530 Pandol Marg, Baluwatar, Kathmandu"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://scontent.fktm3-1.fna.fbcdn.net/v/t1.6435-9/60452502_2282157098538245_5002352932251762688_n.jpg?_nc_cat=100&ccb=1-3&_nc_sid=8bfeb9&_nc_ohc=zxJe1q5p3ukAX9lGi9h&_nc_ht=scontent.fktm3-1.fna&oh=a5ac3a90346afa95bbf5a8c0235bdee3&oe=608C48FA",
                  27.719290, 85.351635,"Animal Medical Center","Chucchepati, Chabahil Kathmandu, Nepal 01"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _boxes(String _image, double lat,double long,String restaurantName, String locationName) {
    return  GestureDetector(
      onTap: () {
        _gotoLocation(lat,long);
      },
      child:Container(
        child: new FittedBox(
          child: Material(
              color: Colors.white,
              elevation: 14.0,
              borderRadius: BorderRadius.circular(24.0),
              shadowColor: Color(0x802196F3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 180,
                    height: 200,
                    child: ClipRRect(
                      borderRadius: new BorderRadius.circular(24.0),
                      child: Image(
                        fit: BoxFit.fill,
                        image: NetworkImage(_image),
                      ),
                    ),),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: myDetailsContainer1(restaurantName, locationName),
                    ),
                  ),
                ],)
          ),
        ),
      ),
    );
  }

  Widget myDetailsContainer1(String restaurantName, String locationName) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text(restaurantName,
                style: TextStyle(
                    color: Colors.blue[900],
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),
              )),
        ),
        SizedBox(height:5.0),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text(locationName,
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20.0),
              )),
        ),
        SizedBox(height:5.0),
        Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                    child: Text(
                      "4.5",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 18.0,
                      ),
                    )),
                Container(
                  child: Icon(
                    FontAwesomeIcons.solidStar,
                    color: Colors.amber,
                    size: 15.0,
                  ),
                ),
                Container(
                  child: Row(
                      children: [
                            Icon(
                              FontAwesomeIcons.solidStar,
                              color: Colors.amber,
                              size: 15.0,
                            ),
                            Icon(
                              FontAwesomeIcons.solidStar,
                              color: Colors.amber,
                              size: 15.0,
                            ),
                            Icon(
                              FontAwesomeIcons.solidStar,
                              color: Colors.amber,
                              size: 15.0,
                            ),
                            Icon(
                              FontAwesomeIcons.solidStarHalf,
                              color: Colors.amber,
                              size: 15.0,
                            ),
                      ]
                  ),
                ),
              ],
            )),
        SizedBox(height:5.0),
        // Container(
        //     child: Text(
        //       "Nepal",
        //       // "American \u00B7 \u0024\u0024 \u00B7 1.6 mi",
        //       style: TextStyle(
        //         color: Colors.black54,
        //         fontSize: 18.0,
        //       ),
        //     )),
        // SizedBox(height:5.0),
        Container(
            child: Text(
              "Closed \u00B7 Opens 17:00 Thu",
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            )),
      ],
    );
  }

  Widget _buildGoogleMap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:  CameraPosition(target: LatLng(27.705437, 85.311152), zoom: 12),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: {
          kathmanduMarker,CentralReferralVeterinaryHospitalMarker,AnimalHospitalAndResearchCenterMarker,AnimalMedicalCenterMarker
        },
      ),
    );
  }

  Future<void> _gotoLocation(double lat,double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(lat, long), zoom: 15,tilt: 50.0,
      bearing: 45.0,)));
  }
}

Marker kathmanduMarker = Marker(
  markerId: MarkerId('kathmandu'),
  position: LatLng(27.740822, 85.335066),
  infoWindow: InfoWindow(title: 'Kathmandu Veterinary Clinic'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueBlue,
  ),
);

Marker CentralReferralVeterinaryHospitalMarker = Marker(
  markerId: MarkerId('CentralReferralVeterinaryHospital'),
  position: LatLng(27.695294, 85.311274),
  infoWindow: InfoWindow(title: 'Central Referral Veterinary Hospital'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueBlue,
  ),
);
Marker AnimalHospitalAndResearchCenterMarker = Marker(
  markerId: MarkerId('AnimalHospitalAndResearchCenter'),
  position: LatLng(27.677654, 85.343997),
  infoWindow: InfoWindow(title: 'Animal Hospital And Research Center'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueBlue,
  ),
);
Marker AnimalMedicalCenterMarker = Marker(
  markerId: MarkerId('AnimalMedicalCenter'),
  position: LatLng(27.719290, 85.351635),
  infoWindow: InfoWindow(title: 'Animal Medical Center Marker'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueBlue,
  ),
);

