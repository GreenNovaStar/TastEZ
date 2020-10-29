import 'package:flutter/material.dart';
import 'package:tastez/main.dart';
import 'file:///D:/Documents/School%20Work/CSUN-FALL_2020/Comp490/TastEZ/TastEZ/lib/Old%20Code/Suggestions.dart';
import 'file:///D:/Documents/School%20Work/CSUN-FALL_2020/Comp490/TastEZ/TastEZ/lib/Old%20Code/RecipeBook.dart';
import 'file:///D:/Documents/School%20Work/CSUN-FALL_2020/Comp490/TastEZ/TastEZ/lib/Old%20Code/MyHomePage.dart';
import 'file:///D:/Documents/School%20Work/CSUN-FALL_2020/Comp490/TastEZ/TastEZ/lib/Old%20Code/ShoppingList.dart';
import 'file:///D:/Documents/School%20Work/CSUN-FALL_2020/Comp490/TastEZ/TastEZ/lib/Old%20Code/CocktailCreator.dart';
import 'file:///D:/Documents/School%20Work/CSUN-FALL_2020/Comp490/TastEZ/TastEZ/lib/Old%20Code/ContactUs.dart';
import 'file:///D:/Documents/School%20Work/CSUN-FALL_2020/Comp490/TastEZ/TastEZ/lib/Old%20Code/Settings.dart';

class Pantry extends StatefulWidget {
  // final String title;

  @override
  _PantryState createState() => _PantryState();
}

class _PantryState extends State<Pantry> {
  int currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pantry")),
      body: Center(child: Text('<null>')),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
            // ListTile(
            //   leading: Icon(Icons.home),
            //   title: Text('Suggestions'),
            //   onTap: () {
            //     Navigator.push(context, MaterialPageRoute(builder: (context) => Suggestions()));
            //     //Navigator.pop(context);
            //   },
            // ),//suggestions
            // ListTile(
            //   leading: Icon(Icons.book),
            //   title: Text('Recipe Book'),
            //   onTap: () {
            //     Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeBook()));
            //     //Navigator.pop(context);
            //   },
            // ),//recipe book
            // ListTile(
            //   leading: Icon(Icons.kitchen),
            //   title: Text('Pantry'),
            //   onTap: () {
            //     Navigator.push(context, MaterialPageRoute(builder: (context) => Pantry()));
            //     //Navigator.pop(context);
            //   },
            // ),//pantry
            // ListTile(
            //   leading: Icon(Icons.shopping_basket),
            //   title: Text('Shopping List'),
            //   onTap: () {
            //     Navigator.push(context, MaterialPageRoute(builder: (context) => ShoppingList()));
            //     //Navigator.pop(context);
            //   },
            // ),//shopping list
            // ListTile(
            //   leading: Icon(Icons.local_drink),
            //   title: Text('Cocktail Creator'),
            //   onTap: () {
            //     Navigator.push(context, MaterialPageRoute(builder: (context) => CocktailCreator()));
            //     // Navigator.pop(context);
            //   },
            // ),//cocktail creator
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
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          elevation: 0.0,
          //backgroundColor: Colors.blue[900],
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              title: Text('Favorites'),
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket),
              title: Text('Shopping List'),
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.kitchen),
              title: Text('Pantry'),
            ),
          ],
          onTap: (index){
            setState(() {
              currentIndex = index;
              switch(currentIndex){
                case 0:
                //Navigator.push(context, MaterialPageRoute(builder: (context) => Suggestions()));
                  Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation1, animation2) => Suggestions()));
                  break;
                case 1:
                //Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeBook()));
                  Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation1, animation2) => RecipeBook()));
                  break;
                case 2:
                // Navigator.push(context, MaterialPageRoute(builder: (context) => ShoppingList()));
                  Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation1, animation2) => ShoppingList()));
                  break;
                case 3:
                // Navigator.push(context, MaterialPageRoute(builder: (context) => Pantry()));
                  Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation1, animation2) => Pantry()));
                  break;
              }
            });
          }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){

        },
        elevation: 0.0,
        child:
        Icon(Icons.search),

      ),
    );
  }
}