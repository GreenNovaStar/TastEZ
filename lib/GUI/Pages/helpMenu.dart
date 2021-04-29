import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:tastez/GUI/Const.dart';
import 'package:tastez/GUI/Pages/Help%20Screens/ListTutorial.dart';
import 'package:tastez/GUI/Pages/Help%20Screens/intro.screen.dart';
import 'package:tastez/GUI/Pages/Help%20Screens/recipeTutorial.dart';
import 'package:tastez/GUI/Pages/Help%20Screens/searchTutorial.dart';
import 'package:tastez/GUI/Pages/Help%20Screens/winepairTutorial.dart';

class HelpMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: themeColor,
          title: Text("Help Menu", style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold)),
        ), // appBar
        body: ListView(
          children:[
            Card(
              color: subAccentColor,
              child: InkWell(
                splashColor: accentColor,
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => IntroScreen()));
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                      leading: Icon(Icons.directions_walk_rounded),
                      title: Text('Simple Navigation'),
                      subtitle: Text('Learn how to navigate TastEZ'),
                    )
                  ]
                ),
              ),
            ),
            Card(
              color: subAccentColor,
              child: InkWell(
                splashColor: accentColor,
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => SearchTutorial()));
                },
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.search),
                        title: Text('Search'),
                        subtitle: Text('Learn how to use Search'),
                      )
                    ]
                ),
              ),
            ),
            Card(
              color: subAccentColor,
              child: InkWell(
                splashColor: accentColor,
                onTap: () {
                  Navigator.push(
                          context, MaterialPageRoute(builder: (context) => WinePairTutorial()));
                },
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.wine_bar),
                        title: Text('Wine Pairing'),
                        subtitle: Text("Learn how to use TastEZ's Wine Pairing Tab"),
                      )
                    ]
                ),
              ),
            ),
            Card(
              color: subAccentColor,
              child: InkWell(
                splashColor: accentColor,
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => ListTutorial()));
                },
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.assignment_rounded),
                        title: Text('Shopping List'),
                        subtitle: Text("Learn what TastEZ's Shopping List has to offer"),
                      )
                    ]
                ),
              ),
            ),
            Card(
              color: subAccentColor,
              child: InkWell(
                splashColor: accentColor,
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => RecipeTutorial()));
                },
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.art_track_rounded),
                        title: Text('Recipe Page'),
                        subtitle: Text("Learn the Features in TastEZ's Recipe Pages"),
                      )
                    ]
                ),
              ),
            ),
         ], // children
        ),
        backgroundColor: subAccentColor,// body
      ),
    );
  }
}
