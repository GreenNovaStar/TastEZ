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

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TastEZ - Recipe Management',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //home: MyHomePage(title: 'Welcome to TastEZ'), //my stuff
      home: home(title: 'test'), //james stuff

    );
  }
}

