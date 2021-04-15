

import 'package:flutter/material.dart';
import 'package:tastez/GUI/Const.dart';
import 'package:tastez/Maps/places_search_map.dart';
import 'package:tastez/Maps/search_filter.dart';

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
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: subAccentColor,
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 5,),
          content: Text("$newKeyword selected.", style: TextStyle(color: Colors.black,),),
          action: SnackBarAction(
            label: "Dismiss",
            onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Google Maps RW'),
        actions: <Widget>[
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                  icon: Icon(Icons.filter_alt_rounded),
                  tooltip: 'Filter Search',
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //     SnackBar(
                    //       backgroundColor: subAccentColor,
                    //       behavior: SnackBarBehavior.floating,
                    //       duration: Duration(seconds: 5,),
                    //       content: Text("$updateKeyWord selected.", style: TextStyle(color: Colors.black,),),
                    //       action: SnackBarAction(
                    //         label: "Dismiss",
                    //         onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
                    //       ),
                    //     )
                    // );
                  });
            },
          ),
        ],
      ),
      body: PlacesSearchMapSample(keyword),
      endDrawer: SearchFilter(updateKeyWord),

    );
  }
}
