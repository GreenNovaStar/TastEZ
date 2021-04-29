import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


final Color themeColor = Colors.orange; //changes the color of the app
final Color accentColor = Colors.orangeAccent; //changes the color of the app
final Color subAccentColor = Colors.orange[50]; //changes the color of the app

final Color DarkTextColor = Colors.black;
final Color LightTextColor = Colors.white;
final Color ThemeTextColor = themeColor;
final Color accentTextColor = Colors.orangeAccent;
final Color accentTextColorAlt = Colors.orange[800];

final Color shadowColor = Colors.orangeAccent[100];

final Color unselectedFilterColor = Colors.grey[500]; //unselected filer color

final Color favoriteIconColor = Colors.red[600]; //the favorite icon color
final double appBarIconPaddingSpace = 40;
final int swipeSensitivity = 8;
// final TextStyle pageTitleFont = GoogleFonts.dancingScript(textStyle: TextStyle(color: DarkTextColor, fontSize: 23));
final TextStyle pageTitleFont = GoogleFonts.sriracha(textStyle: TextStyle(color: DarkTextColor, fontSize: 23));

// final controller = PageController(
//   initialPage: 2,
// );

final ThemeData defaultTheme = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  primaryColor: Colors.orange,
  accentColor: Colors.orange[50],
  primarySwatch: Colors.orange,
  scaffoldBackgroundColor: subAccentColor,
  canvasColor: subAccentColor,
  appBarTheme: AppBarTheme(
    // foregroundColor: Colors.orange,
    backgroundColor: Colors.orange,
    titleTextStyle: TextStyle(color: subAccentColor),
    iconTheme: IconThemeData(color: subAccentColor),
  ),
  iconTheme: IconThemeData(color: subAccentColor),
  primaryIconTheme: IconThemeData(color: subAccentColor),
  accentIconTheme: IconThemeData(color: subAccentColor),

);