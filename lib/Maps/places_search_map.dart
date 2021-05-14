import 'dart:async';
import 'dart:convert';
import 'error.dart';
import 'place_response.dart';
import 'result.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:geolocator/geolocator.dart' as geo;
import 'package:geolocator_platform_interface/geolocator_platform_interface.dart' as geoLocator;
import 'package:permission/permission.dart';
import '../GUI/Const.dart';

//global variables
double latitude;
double longitude;
bool unlock = false;

//this method prevents the camera from locking
void _lockUnlockLocation(){
  if (unlock == false){
    unlock = true;
  }else{
    unlock = false;
  }
}

class PlacesSearchMapSample extends StatefulWidget {
  final String keyword;
  PlacesSearchMapSample(this.keyword);

  @override
  State<PlacesSearchMapSample> createState() {
    return _PlacesSearchMapSample();
  }
}

class _PlacesSearchMapSample extends State<PlacesSearchMapSample> {
  static const String _API_KEY = 'your api key';

  // //set default location to CSUN Oviatt Library, this is temporary until current location is obtained
  // static double latitude = 34.239540305067706;
  // static double longitude = -118.52933262863591;
  LatLng _initialcameraposition = LatLng(34.239540305067706, -118.52933262863591);

  GoogleMapController _controller;
  Location _location = Location();

  static const String baseUrl =
      "https://maps.googleapis.com/maps/api/place/nearbysearch/json";

  List<Marker> markers = <Marker>[];
  Error error;
  List<Result> places;
  bool searching = true;
  String keyword;

  //Completer<GoogleMapController> _controller = Completer();

  //this method gets user location
  void _onMapCreated(GoogleMapController _control) {
    _controller = _control;
    _location.onLocationChanged().listen((l) {
      if (unlock == false) {
        unlock = true;
        _controller.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(target: LatLng(l.latitude, l.longitude), zoom: 12),
          ),
        );
        //make longitude and longitude equal to current location's longitude and latitude
        latitude = l.latitude;
        longitude = l.longitude;
       }
      });
    void onCameraMove(CameraPosition position) {
      _initialcameraposition = position.target;
    }
  }

   // static final CameraPosition _myLocation = CameraPosition(
   //   target: LatLng(latitude, longitude),
   //  zoom: 12,
   //   bearing: 15.0,
   //   tilt: 75.0
   // );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
        // padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
        // height: 600,
        width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [GoogleMap(
              mapType: MapType.normal,
              myLocationEnabled: true,
              initialCameraPosition: CameraPosition(target: _initialcameraposition),
              onMapCreated: (GoogleMapController controller) {
                _setStyle(controller);
                _onMapCreated(controller);
                // _controller.complete(controller);
              },
              markers: Set<Marker>.of(markers),
            ),
            ],
          ),
        ),
      floatingActionButton: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: FloatingActionButton.extended(
                onPressed: () {
                  //_lockUnlockLocation();//when this button is pressed camera will be unlocked, if pushed again camera will lock (return to current location)
                  searchNearby(latitude, longitude);
                },
                backgroundColor: subAccentColor,
                foregroundColor: Colors.black,
                label: Text('Search this area', style: TextStyle(color: Colors.black87),),
                icon: Row(
                  children: [
                    Icon(Icons.place, color: Colors.black87,),
                  ],
                ),
              ),
            ),
          ],
      ),
    );
  }

  //this method sets the style of the google map
  void _setStyle(GoogleMapController controller) async {
    String value = await DefaultAssetBundle.of(context).loadString('assets/maps_style.json');
    controller.setMapStyle(value);
  }

  //this method searches nearby places, with keyword from mainmap
  void searchNearby(double latitude, double longitude) async {
    setState(() {
      markers.clear();
    });
    String url =
        '$baseUrl?key=$_API_KEY&location=$latitude,$longitude&radius=10000&keyword=${widget.keyword}';
    print(url);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      _handleResponse(data);
    } else {
      throw Exception('An error occurred getting places nearby');
    }

    // make sure to hide searching
    setState(() {
      searching = false;
    });
  }

  void _handleResponse(data){
    // bad api key or otherwise
      if (data['status'] == "REQUEST_DENIED") {
        setState(() {
          error = Error.fromJson(data);
        });
        // success
      } else if (data['status'] == "OK") {
        setState(() {
          places = PlaceResponse.parseResults(data['results']);
          for (int i = 0; i < places.length; i++) {
            markers.add(
              Marker(
                markerId: MarkerId(places[i].placeId),
                position: LatLng(places[i].geometry.location.lat,
                    places[i].geometry.location.long),
                infoWindow: InfoWindow(
                    title: places[i].name, snippet: places[i].vicinity),
                onTap: () {},
              ),
            );
          }
        });
      } else {
        print(data);
      }
  }
}
