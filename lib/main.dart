import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'home.dart';
import 'user.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:intro_slider/dot_animation_enum.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:intro_slider/scrollbar_behavior_enum.dart';
//import 'intro.screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:permission_handler/permission_handler.dart';
import 'missing.ingredients.dart';

List<User> usersDB = new List<User>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Future<Database> database = openDatabase(
    join(await getDatabasesPath(), 'users.db'),
    onCreate: (db, version){
      return db.execute("CREATE TABLE users(id INTEGER PRIMARY KEY, uuid TEXT, name TEXT, email TEXT, hPass TEXT, prefs TEXT, pantry TEXT, favorites TEXT)",);},
    version: 2,
  );
  runApp(MyApp());
}

// void main() => runApp(IntroScreen());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TastEZ - Recipe Management',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: IntroScreen(),
    );
  }
}

class IntroScreen extends StatefulWidget {
  IntroScreen({Key key}) : super(key: key);

  @override
  IntroScreenState createState() => IntroScreenState();
}

class IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = new List();

  Function goToTab;

  @override
  void initState(){
    super.initState();

    slides.add(
      new Slide( // HOME PAGE SLIDE
        title: "HOME",
        styleTitle: TextStyle(
          color: Color(0xffffffff),
          fontSize: 40.0,
          fontWeight: FontWeight.bold,
        ),
        marginTitle: EdgeInsets.only(top:40.0, bottom:10.0),
        description: "Displays recommended Recipes and options to other features",
        styleDescription: TextStyle(
          color: Color(0xff000000),
          fontSize: 20.0,
          fontStyle: FontStyle.italic,
        ),
        maxLineTextDescription: 3,
        marginDescription: EdgeInsets.only(left: 5.0, right: 5.0),
        pathImage: "assets/tutorialImages/tutorialHome.png",
        widthImage: 150.0,
        heightImage: 500.0,
        foregroundImageFit: BoxFit.fitHeight,
        colorBegin: Color(0xfff5a623),
        colorEnd: Color(0xfff7efe1),
        directionColorBegin: Alignment.topCenter,
        directionColorEnd: Alignment.bottomCenter,
      ),
    );
    slides.add( // SEARCH PAGE SLIDE
      new Slide(
        title: "SEARCH",
        styleTitle: TextStyle(
          color: Color(0xffffffff),
          fontSize: 40.0,
          fontWeight: FontWeight.bold,
        ),
        marginTitle: EdgeInsets.only(top:40.0, bottom:10.0),
        description: "Need Suggestions? TastEZ will recommend you Recipes in your 'Home' page!",
        styleDescription: TextStyle(
          color: Color(0xff000000),
          fontSize: 20.0,
          fontStyle: FontStyle.italic,
        ),
        maxLineTextDescription: 3,
        marginDescription: EdgeInsets.only(left: 5.0, right: 5.0),
        pathImage: "assets/tutorialImages/tutorialSearch.png",
        widthImage: 150.0,
        heightImage: 500.0,
        foregroundImageFit: BoxFit.fitHeight,
        colorBegin: Color(0xfff5a623),
        colorEnd: Color(0xfff7efe1),
        directionColorBegin: Alignment.topCenter,
        directionColorEnd: Alignment.bottomCenter,
      ),
    );
    slides.add( // FAVORITES PAGE SLIDE
      new Slide(
        title: "FAVORITES",
        styleTitle: TextStyle(
          color: Color(0xffffffff),
          fontSize: 40.0,
          fontWeight: FontWeight.bold,
        ),
        marginTitle: EdgeInsets.only(top:40.0, bottom:10.0),
        description: "Find your saved recipes in the 'Favorites' feature!",
        styleDescription: TextStyle(
          color: Color(0xff000000),
          fontSize: 20.0,
          fontStyle: FontStyle.italic,
        ),
        maxLineTextDescription: 3,
        marginDescription: EdgeInsets.only(left: 5.0, right: 5.0),
        pathImage: "assets/tutorialImages/tutorialFavorites.png",
        widthImage: 150.0,
        heightImage: 500.0,
        foregroundImageFit: BoxFit.fitHeight,
        //backgroundColor: Color(0xfff5a623),
        colorBegin: Color(0xfff5a623),
        colorEnd: Color(0xfff7efe1),
        directionColorBegin: Alignment.topCenter,
        directionColorEnd: Alignment.bottomCenter,
      ),
    );
    slides.add( // SHOPPING LIST PAGE SLIDE
      new Slide(
        title: "SHOPPING LIST",
        styleTitle: TextStyle(
          color: Color(0xffffffff),
          fontSize: 40.0,
          fontWeight: FontWeight.bold,
        ),
        marginTitle: EdgeInsets.only(top:40.0, bottom:10.0),
        description: "TastEZ allows you to create a shopping list for your next visit to the grocery store!",
        styleDescription: TextStyle(
          color: Color(0xff000000),
          fontSize: 20.0,
          fontStyle: FontStyle.italic,
        ),
        maxLineTextDescription: 3,
        marginDescription: EdgeInsets.only(left: 5.0, right: 5.0),
        pathImage: "assets/tutorialImages/tutorialList.png",
        widthImage: 150.0,
        heightImage: 500.0,
        foregroundImageFit: BoxFit.fitHeight,
        //backgroundColor: Color(0xfff5a623),
        colorBegin: Color(0xfff5a623),
        colorEnd: Color(0xfff7efe1),
        directionColorBegin: Alignment.topCenter,
        directionColorEnd: Alignment.bottomCenter,
      ),
    );
    slides.add( // PANTRY PAGE SLIDE
      new Slide(
        title: "MY PANTRY",
        styleTitle: TextStyle(
          color: Color(0xffffffff),
          fontSize: 40.0,
          fontWeight: FontWeight.bold,
        ),
        marginTitle: EdgeInsets.only(top:40.0, bottom:10.0),
        description: "Add ingredients you own in 'My Pantry' and TastEZ will suggest recipes based off what you own!",
        styleDescription: TextStyle(
          color: Color(0xff000000),
          fontSize: 20.0,
          fontStyle: FontStyle.italic,
        ),
        maxLineTextDescription: 3,
        marginDescription: EdgeInsets.only(left: 5.0, right: 5.0),
        pathImage: "assets/tutorialImages/tutorialPantry.png",
        widthImage: 150.0,
        heightImage: 500.0,
        foregroundImageFit: BoxFit.fitHeight,
        //backgroundColor: Color(0xfff5a623),
        colorBegin: Color(0xfff5a623),
        colorEnd: Color(0xfff7efe1),
        directionColorBegin: Alignment.topCenter,
        directionColorEnd: Alignment.bottomCenter,
      ),
    );
    slides.add( // RECIPE PAGE SLIDE
      new Slide(
        title: "RECIPES",
        styleTitle: TextStyle(
          color: Color(0xffffffff),
          fontSize: 40.0,
          fontWeight: FontWeight.bold,
        ),
        marginTitle: EdgeInsets.only(top:40.0, bottom:10.0),
        description: "TastEZ will allow you to favorite recipes and add ingredients to you Shopping List!",
        styleDescription: TextStyle(
          color: Color(0xff000000),
          fontSize: 20.0,
          fontStyle: FontStyle.italic,
        ),
        maxLineTextDescription: 3,
        marginDescription: EdgeInsets.only(left: 5.0, right: 5.0),
        pathImage: "assets/tutorialImages/tutorialRecipePage.png",
        widthImage: 150.0,
        heightImage: 500.0,
        foregroundImageFit: BoxFit.fitHeight,
        //backgroundColor: Color(0xfff5a623),
        colorBegin: Color(0xfff5a623),
        colorEnd: Color(0xfff7efe1),
        directionColorBegin: Alignment.topCenter,
        directionColorEnd: Alignment.bottomCenter,
      ),
    );

  } //Widget initState

  //Return to first tab
  void onDonePress() {
    Navigator.push(this.context, PageRouteBuilder(pageBuilder: (context, animation1, animation2) => Home()));
  } //onDonePress
  void onTabChangeCompleted(index){
    //Index of current tab is focused
  } //onTabChangeCompleted

  Widget renderNextBtn(){
    return Icon(
      Icons.navigate_next,
      color: Color(0xffffcc5c),
      size: 35.0,
    );
  } //renderNextButton
  Widget renderDoneBtn(){
    return Icon(
      Icons.done,
      color: Color(0xffffcc5c),
    );
  } //renderDoneBtn
  Widget renderSkipBtn(){
    return Icon(
      Icons.skip_next,
      color: Color(0xffffcc5c),
    );
  } //renderSkipBtn
  // Building Intro Slider
  @override
  Widget build(BuildContext context){
    return new IntroSlider(

      //List Slides
      slides: this.slides,

      //Skip Button
      renderSkipBtn: this.renderSkipBtn(),
      colorSkipBtn: Color(0xff99763a),
      highlightColorSkipBtn: Color(0xffffcc5c),

      //Next Button
      renderNextBtn: this.renderNextBtn(),

      //Done Button
      renderDoneBtn: this.renderDoneBtn(),
      onDonePress: this.onDonePress,
      colorDoneBtn: Color(0xff99763a),
      highlightColorDoneBtn: Color(0xffffcc5c),

      //Dot Indicator
      colorDot: Color(0xff99763a),
      sizeDot: 13.0,
      typeDotAnimation: dotSliderAnimation.SIZE_TRANSITION,

      //Tabs
      refFuncGoToTab: (refFunc) {
        this.goToTab = refFunc;
      },

      // Show or hide status bar
      shouldHideStatusBar: true,

      // On tab change completed
      onTabChangeCompleted: this.onTabChangeCompleted,
    );
  }

}