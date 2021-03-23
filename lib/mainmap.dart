import 'package:flutter/material.dart';
import 'Maps/places_search_map.dart';
import 'Maps/search_filter.dart';

void main() => runApp(GoogleMapsSampleApp());

class GoogleMapsSampleApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GoogleMapSampleApp();
  }
}

class _GoogleMapSampleApp extends State<GoogleMapsSampleApp>{
  //this keyword determines what places are being searched
  static String keyword = "grocery+store+supermarket+bakery";//grocery+store+supermarket+bakery

  void updateKeyWord(String newKeyword) {
    print(newKeyword);
    setState(() {
      keyword = newKeyword;  
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Maps Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Google Maps RW'),
          actions: <Widget>[
            Builder(
              builder: (BuildContext context) {
                return IconButton(
                    icon: Icon(Icons.filter_list),
                    tooltip: 'Filter Search',
                    onPressed: () {
                      Scaffold.of(context).openEndDrawer();
                    });
              },
            ),
          ],
        ),
        body: PlacesSearchMapSample(keyword),
        endDrawer: SearchFilter(updateKeyWord),
      ),
    );
  }
}
