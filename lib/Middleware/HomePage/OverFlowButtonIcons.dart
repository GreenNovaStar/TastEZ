import 'package:flutter/material.dart';
import 'package:tastez/GUI/Login/login_main.dart';
import 'package:tastez/GUI/Pages/intro.screen.dart';
import 'package:tastez/Middleware/Login/google_sign_in.dart';
import 'package:tastez/GUI/Pages/About.dart';

class DialogConstants {
//------------OVER FLOW DIALOGUE CHOICES-----------------------
  static const String Settings = 'Settings';
  static const String Help = 'Help';
  static const String About = 'About';

  static const List<String> dialogChoicesOverflow = <String>[
    Settings,
    Help,
    About
  ];

  static void selectedItemOverflow(String item, BuildContext context) {
    if (item == DialogConstants.Settings) {
      print("settings");
    } else if (item == DialogConstants.About) {
      print("about");
      Navigator.push(context, MaterialPageRoute(builder: (context) => AboutPage()));
    } else if (item == DialogConstants.Help) {
      print("help");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => IntroScreen()));
    }
  }

//------------PROFILE ICON BUTTON DIALOGUE CHOICES--------------
  static const String SignIn = 'Sign in';
  static const String ViewProfile = 'View Profile';
  static const String SignOut = 'Sign Out';

  static const List<String> dialogChoicesProfile_NotLoggedIn = <String>[
    SignIn,
  ];
  static const List<String> dialogChoicesProfile = <String>[
    ViewProfile,
    SignOut
  ];

  static void selectedItemProfile_NotLoggedIn(String item) {
    if (item == DialogConstants.SignIn) {
      print("sign in");
    }
  }

  static void selectedItemProfile(String item, BuildContext context) {
    if (item == DialogConstants.ViewProfile) {
      print("view profile");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ViewProfilee()));
      //LoginPageMain()));
    } else if (item == DialogConstants.SignOut) {
      signOutGoogle();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPageMain()));
      //print("sign out");
    }
  }
}
