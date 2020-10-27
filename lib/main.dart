import 'package:flutter/material.dart';
import 'package:tastez/MyHomePage.dart';
import 'package:tastez/Suggestions.dart';
import 'package:tastez/RecipeBook.dart';
import 'package:tastez/Pantry.dart';
import 'package:tastez/ShoppingList.dart';
import 'package:tastez/CocktailCreator.dart';
import 'package:tastez/ContactUs.dart';
import 'package:tastez/Settings.dart';
import 'home.dart';
import 'user.dart';

List<User> usersDB = new List<User>();

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TastEZ - Recipe Management',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Welcome to TastEZ'),

    );
  }
}

// class MyHomePage extends StatelessWidget {
//   final String title;
//
//   MyHomePage({Key key, this.title}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(title)),
//       body: Center(child: Text('<null>')),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             DrawerHeader(
//               child: Text('Features'),
//               decoration: BoxDecoration(
//                 color: Colors.orangeAccent,
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.home),
//               title: Text('Suggestions'),
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => Suggestions()));
//                 //Navigator.pop(context);
//               },
//             ),//suggestions
//             ListTile(
//               leading: Icon(Icons.book),
//               title: Text('Recipe Book'),
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeBook()));
//                 //Navigator.pop(context);
//               },
//             ),//recipe book
//             ListTile(
//               leading: Icon(Icons.kitchen),
//               title: Text('Pantry'),
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => Pantry()));
//                 //Navigator.pop(context);
//               },
//             ),//pantry
//             ListTile(
//               leading: Icon(Icons.shopping_basket),
//               title: Text('Shopping List'),
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => ShoppingList()));
//                 //Navigator.pop(context);
//               },
//             ),//shopping list
//             ListTile(
//               leading: Icon(Icons.local_drink),
//               title: Text('Cocktail Creator'),
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => CocktailCreator()));
//                 // Navigator.pop(context);
//               },
//             ),//cocktail creator
//             ListTile(
//               leading: Icon(Icons.book),
//               title: Text('Contact Us'),
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUs()));
//                 // Navigator.pop(context);
//               },
//             ),//contact us
//             ListTile(
//               leading: Icon(Icons.settings),
//               title: Text('Settings'),
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
//                 // Navigator.pop(context);
//               },
//             ),//settings
//           ],
//         ),
//       ),
//     );
//   }
// }

// class Suggestions extends StatelessWidget {
//   // final String title;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Suggestions")),
//       body: Center(child: Text('<null>')),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             DrawerHeader(
//               child: Text('Features'),
//               decoration: BoxDecoration(
//                 color: Colors.orangeAccent,
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.home),
//               title: Text('Suggestions'),
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => Suggestions()));
//                 //Navigator.pop(context);
//               },
//             ),//suggestions
//             ListTile(
//               leading: Icon(Icons.book),
//               title: Text('Recipe Book'),
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeBook()));
//                 //Navigator.pop(context);
//               },
//             ),//recipe book
//             ListTile(
//               leading: Icon(Icons.kitchen),
//               title: Text('Pantry'),
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => Pantry()));
//                 //Navigator.pop(context);
//               },
//             ),//pantry
//             ListTile(
//               leading: Icon(Icons.shopping_basket),
//               title: Text('Shopping List'),
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => ShoppingList()));
//                 //Navigator.pop(context);
//               },
//             ),//shopping list
//             ListTile(
//               leading: Icon(Icons.local_drink),
//               title: Text('Cocktail Creator'),
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => CocktailCreator()));
//                 // Navigator.pop(context);
//               },
//             ),//cocktail creator
//             ListTile(
//               leading: Icon(Icons.book),
//               title: Text('Contact Us'),
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUs()));
//                 // Navigator.pop(context);
//               },
//             ),//contact us
//             ListTile(
//               leading: Icon(Icons.settings),
//               title: Text('Settings'),
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
//                 // Navigator.pop(context);
//               },
//             ),//settings
//           ],
//         ),
//       ),
//     );
//   }
// }

// class RecipeBook extends StatelessWidget {
//   // final String title;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Recipe Book")),
//       body: Center(child: Text('<null>')),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             DrawerHeader(
//               child: Text('Features'),
//               decoration: BoxDecoration(
//                 color: Colors.orangeAccent,
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.home),
//               title: Text('Suggestions'),
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => Suggestions()));
//                 //Navigator.pop(context);
//               },
//             ),//suggestions
//             ListTile(
//               leading: Icon(Icons.book),
//               title: Text('Recipe Book'),
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeBook()));
//                 //Navigator.pop(context);
//               },
//             ),//recipe book
//             ListTile(
//               leading: Icon(Icons.kitchen),
//               title: Text('Pantry'),
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => Pantry()));
//                 //Navigator.pop(context);
//               },
//             ),//pantry
//             ListTile(
//               leading: Icon(Icons.shopping_basket),
//               title: Text('Shopping List'),
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => ShoppingList()));
//                 //Navigator.pop(context);
//               },
//             ),//shopping list
//             ListTile(
//               leading: Icon(Icons.local_drink),
//               title: Text('Cocktail Creator'),
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => CocktailCreator()));
//                 // Navigator.pop(context);
//               },
//             ),//cocktail creator
//             ListTile(
//               leading: Icon(Icons.book),
//               title: Text('Contact Us'),
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUs()));
//                 // Navigator.pop(context);
//               },
//             ),//contact us
//             ListTile(
//               leading: Icon(Icons.settings),
//               title: Text('Settings'),
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
//                 // Navigator.pop(context);
//               },
//             ),//settings
//           ],
//         ),
//       ),
//     );
//   }
// }

// class Pantry extends StatelessWidget {
//   // final String title;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Pantry")),
//       body: Center(child: Text('<null>')),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             DrawerHeader(
//               child: Text('Features'),
//               decoration: BoxDecoration(
//                 color: Colors.orangeAccent,
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.home),
//               title: Text('Suggestions'),
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => Suggestions()));
//                 //Navigator.pop(context);
//               },
//             ),//suggestions
//             ListTile(
//               leading: Icon(Icons.book),
//               title: Text('Recipe Book'),
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeBook()));
//                 //Navigator.pop(context);
//               },
//             ),//recipe book
//             ListTile(
//               leading: Icon(Icons.kitchen),
//               title: Text('Pantry'),
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => Pantry()));
//                 //Navigator.pop(context);
//               },
//             ),//pantry
//             ListTile(
//               leading: Icon(Icons.shopping_basket),
//               title: Text('Shopping List'),
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => ShoppingList()));
//                 //Navigator.pop(context);
//               },
//             ),//shopping list
//             ListTile(
//               leading: Icon(Icons.local_drink),
//               title: Text('Cocktail Creator'),
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => CocktailCreator()));
//                 // Navigator.pop(context);
//               },
//             ),//cocktail creator
//             ListTile(
//               leading: Icon(Icons.book),
//               title: Text('Contact Us'),
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUs()));
//                 // Navigator.pop(context);
//               },
//             ),//contact us
//             ListTile(
//               leading: Icon(Icons.settings),
//               title: Text('Settings'),
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
//                 // Navigator.pop(context);
//               },
//             ),//settings
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ShoppingList extends StatelessWidget {
//   // final String title;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Shopping List")),
//       body: Center(child: Text('<null>')),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             DrawerHeader(
//               child: Text('Features'),
//               decoration: BoxDecoration(
//                 color: Colors.orangeAccent,
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.home),
//               title: Text('Suggestions'),
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => Suggestions()));
//                 //Navigator.pop(context);
//               },
//             ),//suggestions
//             ListTile(
//               leading: Icon(Icons.book),
//               title: Text('Recipe Book'),
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeBook()));
//                 //Navigator.pop(context);
//               },
//             ),//recipe book
//             ListTile(
//               leading: Icon(Icons.kitchen),
//               title: Text('Pantry'),
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => Pantry()));
//                 //Navigator.pop(context);
//               },
//             ),//pantry
//             ListTile(
//               leading: Icon(Icons.shopping_basket),
//               title: Text('Shopping List'),
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => ShoppingList()));
//                 //Navigator.pop(context);
//               },
//             ),//shopping list
//             ListTile(
//               leading: Icon(Icons.local_drink),
//               title: Text('Cocktail Creator'),
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => CocktailCreator()));
//                 // Navigator.pop(context);
//               },
//             ),//cocktail creator
//             ListTile(
//               leading: Icon(Icons.book),
//               title: Text('Contact Us'),
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUs()));
//                 // Navigator.pop(context);
//               },
//             ),//contact us
//             ListTile(
//               leading: Icon(Icons.settings),
//               title: Text('Settings'),
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
//                 // Navigator.pop(context);
//               },
//             ),//settings
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CocktailCreator extends StatelessWidget {
//   // final String title;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Cocktail Creator")),
//       body: Center(child: Text('<null>')),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             DrawerHeader(
//               child: Text('Features'),
//               decoration: BoxDecoration(
//                 color: Colors.orangeAccent,
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.home),
//               title: Text('Suggestions'),
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => Suggestions()));
//                 //Navigator.pop(context);
//               },
//             ),//suggestions
//             ListTile(
//               leading: Icon(Icons.book),
//               title: Text('Recipe Book'),
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeBook()));
//                 //Navigator.pop(context);
//               },
//             ),//recipe book
//             ListTile(
//               leading: Icon(Icons.kitchen),
//               title: Text('Pantry'),
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => Pantry()));
//                 //Navigator.pop(context);
//               },
//             ),//pantry
//             ListTile(
//               leading: Icon(Icons.shopping_basket),
//               title: Text('Shopping List'),
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => ShoppingList()));
//                 //Navigator.pop(context);
//               },
//             ),//shopping list
//             ListTile(
//               leading: Icon(Icons.local_drink),
//               title: Text('Cocktail Creator'),
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => CocktailCreator()));
//                 // Navigator.pop(context);
//               },
//             ),//cocktail creator
//             ListTile(
//               leading: Icon(Icons.book),
//               title: Text('Contact Us'),
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUs()));
//                 // Navigator.pop(context);
//               },
//             ),//contact us
//             ListTile(
//               leading: Icon(Icons.settings),
//               title: Text('Settings'),
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
//                 // Navigator.pop(context);
//               },
//             ),//settings
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ContactUs extends StatelessWidget {
//   // final String title;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Contact Us")),
//       body: Center(child: Text('<null>')),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             DrawerHeader(
//               child: Text('Features'),
//               decoration: BoxDecoration(
//                 color: Colors.orangeAccent,
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.home),
//               title: Text('Suggestions'),
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => Suggestions()));
//                 //Navigator.pop(context);
//               },
//             ),//suggestions
//             ListTile(
//               leading: Icon(Icons.book),
//               title: Text('Recipe Book'),
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeBook()));
//                 //Navigator.pop(context);
//               },
//             ),//recipe book
//             ListTile(
//               leading: Icon(Icons.kitchen),
//               title: Text('Pantry'),
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => Pantry()));
//                 //Navigator.pop(context);
//               },
//             ),//pantry
//             ListTile(
//               leading: Icon(Icons.shopping_basket),
//               title: Text('Shopping List'),
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => ShoppingList()));
//                 //Navigator.pop(context);
//               },
//             ),//shopping list
//             ListTile(
//               leading: Icon(Icons.local_drink),
//               title: Text('Cocktail Creator'),
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => CocktailCreator()));
//                 // Navigator.pop(context);
//               },
//             ),//cocktail creator
//             ListTile(
//               leading: Icon(Icons.book),
//               title: Text('Contact Us'),
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUs()));
//                 // Navigator.pop(context);
//               },
//             ),//contact us
//             ListTile(
//               leading: Icon(Icons.settings),
//               title: Text('Settings'),
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
//                 // Navigator.pop(context);
//               },
//             ),//settings
//           ],
//         ),
//       ),
//     );
//   }
// }

// class Settings extends StatelessWidget {
//   // final String title;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Settings")),
//       body: Center(child: Text('<null>')),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             DrawerHeader(
//               child: Text('Features'),
//               decoration: BoxDecoration(
//                 color: Colors.orangeAccent,
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.home),
//               title: Text('Suggestions'),
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => Suggestions()));
//                 //Navigator.pop(context);
//               },
//             ),//suggestions
//             ListTile(
//               leading: Icon(Icons.book),
//               title: Text('Recipe Book'),
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeBook()));
//                 //Navigator.pop(context);
//               },
//             ),//recipe book
//             ListTile(
//               leading: Icon(Icons.kitchen),
//               title: Text('Pantry'),
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => Pantry()));
//                 //Navigator.pop(context);
//               },
//             ),//pantry
//             ListTile(
//               leading: Icon(Icons.shopping_basket),
//               title: Text('Shopping List'),
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => ShoppingList()));
//                 //Navigator.pop(context);
//               },
//             ),//shopping list
//             ListTile(
//               leading: Icon(Icons.local_drink),
//               title: Text('Cocktail Creator'),
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => CocktailCreator()));
//                 // Navigator.pop(context);
//               },
//             ),//cocktail creator
//             ListTile(
//               leading: Icon(Icons.book),
//               title: Text('Contact Us'),
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUs()));
//                 // Navigator.pop(context);
//               },
//             ),//contact us
//             ListTile(
//               leading: Icon(Icons.settings),
//               title: Text('Settings'),
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
//                 // Navigator.pop(context);
//               },
//             ),//settings
//           ],
//         ),
//       ),
//     );
//   }
// }