import 'package:flutter/material.dart';
import 'package:tastez/main.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:holding_gesture/holding_gesture.dart';

class RecipeBook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Recipe Book')),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.search), onPressed: () {},),
      body: Center(),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 4.0,
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(icon: Icon(Icons.home), onPressed: () {},),
            IconButton(icon: Icon(Icons.book), onPressed: () {},),
            IconButton(icon: Icon(Icons.kitchen), onPressed: () {},),
            IconButton(icon: Icon(Icons.shopping_basket), onPressed: () {},),
          ],
      ),
    ),
    drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.black38,
                  image: DecorationImage(
                      image: AssetImage("assets/TastEZ_logo.png"),
                      fit: BoxFit.cover
                  )
              ),
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Help'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Contact Us'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}