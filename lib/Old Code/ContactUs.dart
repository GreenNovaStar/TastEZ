import 'package:flutter/material.dart';
import 'package:tastez/main.dart';
import 'file:///D:/Documents/School%20Work/CSUN-FALL_2020/Comp490/TastEZ/TastEZ/lib/Old%20Code/Suggestions.dart';
import 'file:///D:/Documents/School%20Work/CSUN-FALL_2020/Comp490/TastEZ/TastEZ/lib/Old%20Code/RecipeBook.dart';
import 'file:///D:/Documents/School%20Work/CSUN-FALL_2020/Comp490/TastEZ/TastEZ/lib/Old%20Code/Pantry.dart';
import 'file:///D:/Documents/School%20Work/CSUN-FALL_2020/Comp490/TastEZ/TastEZ/lib/Old%20Code/ShoppingList.dart';
import 'file:///D:/Documents/School%20Work/CSUN-FALL_2020/Comp490/TastEZ/TastEZ/lib/Old%20Code/CocktailCreator.dart';
import 'file:///D:/Documents/School%20Work/CSUN-FALL_2020/Comp490/TastEZ/TastEZ/lib/Old%20Code/MyHomePage.dart';
import 'file:///D:/Documents/School%20Work/CSUN-FALL_2020/Comp490/TastEZ/TastEZ/lib/Old%20Code/Settings.dart';

class ContactUs extends StatelessWidget {
  // final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contact Us")),
      body: Center(child: Text('<null>')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Features'),
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Suggestions'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Suggestions()));
                //Navigator.pop(context);
              },
            ),//suggestions
            ListTile(
              leading: Icon(Icons.book),
              title: Text('Recipe Book'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeBook()));
                //Navigator.pop(context);
              },
            ),//recipe book
            ListTile(
              leading: Icon(Icons.kitchen),
              title: Text('Pantry'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Pantry()));
                //Navigator.pop(context);
              },
            ),//pantry
            ListTile(
              leading: Icon(Icons.shopping_basket),
              title: Text('Shopping List'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ShoppingList()));
                //Navigator.pop(context);
              },
            ),//shopping list
            ListTile(
              leading: Icon(Icons.local_drink),
              title: Text('Cocktail Creator'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CocktailCreator()));
                // Navigator.pop(context);
              },
            ),//cocktail creator
            ListTile(
              leading: Icon(Icons.book),
              title: Text('Contact Us'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUs()));
                // Navigator.pop(context);
              },
            ),//contact us
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
                // Navigator.pop(context);
              },
            ),//settings
          ],
        ),
      ),
    );
  }
}