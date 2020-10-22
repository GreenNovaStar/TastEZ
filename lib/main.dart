import 'package:flutter/material.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'TastEZ - Recipe Management',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(title: ''),
    );}}

