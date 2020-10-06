import 'package:flutter/material.dart';
import 'package:tastez/main.dart';
import 'package:tastez/Suggestions.dart';
import 'package:tastez/RecipeBook.dart';
import 'package:tastez/Pantry.dart';
import 'package:tastez/ShoppingList.dart';
import 'package:tastez/CocktailCreator.dart';
import 'package:tastez/ContactUs.dart';
import 'package:tastez/Settings.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),),
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Suggestions()));
                  break;
                case 1:
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeBook()));
                  break;
                case 2:
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ShoppingList()));
                  break;
                case 3:
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Pantry()));
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