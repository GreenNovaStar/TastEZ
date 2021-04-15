import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fullscreen/fullscreen.dart';
import 'package:tastez/home.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:geolocator/geolocator.dart' as geo;
import 'package:geolocator_platform_interface/geolocator_platform_interface.dart' as geoLocator;
import 'package:permission/permission.dart';


// class MyMap extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Google Maps Demo',
//       home: MapSample(),
//     );
//   }
// }

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  FullScreen fullscreen = new FullScreen();
  //set default location to CSUN Oviatt Library, this is temporary until current location is obtained
  LatLng _initialcameraposition = LatLng(34.239540305067706, -118.52933262863591);
  GoogleMapController _controller;
  Location _location = Location();

  void _onMapCreated(GoogleMapController _control) {
    _controller = _control;
    _location.onLocationChanged().listen((l) {
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(l.latitude, l.longitude), zoom: 15),
        ),
      );
    });
  }
  // LatLng currentPosition;
  // void _getUserLocation() async {
  //   var position = await geo.GeolocatorPlatform.instance
  //       .getCurrentPosition(desiredAccuracy: geoLocator.LocationAccuracy.high);
  //
  //   setState(() {
  //     currentPosition = LatLng(position.latitude, position.longitude);
  //     _initialcameraposition = currentPosition;
  //   });
  // }

  void enterFullScreen(FullScreenMode fullScreenMode) async {
    await FullScreen.enterFullScreen(fullScreenMode);
  }
  void exitFullScreen() async {
    await FullScreen.exitFullScreen();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Map Page",
      home: Scaffold(
        appBar: AppBar(title: Text("Map Page")),
        body: Container(color: Colors.green),
      ),
    );
  }
}