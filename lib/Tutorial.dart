
import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intro_slider/dot_animation_enum.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:intro_slider/scrollbar_behavior_enum.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: IntroScreen(),
      debugShowCheckedModeBanner: false,
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
      new Slide(
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
    slides.add(
      new Slide(
        title: "SEARCH",
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
    slides.add(
      new Slide(
        title: "FAVORITES",
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

  } //Widget initState

  //Return to first tab
  void onDonePress() {
    // Do what you want
    this.goToTab(0);
  } //onDonePress
  void onTabChangeCompleted(index){
    //Index of current tab is focued
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

  //Render List Custom Tabs
  /*List<Widget> renderListCustomTabs() {
    List<Widget> tabs = new List();
    for (int i = 0; i < slides.length; i++) {
      Slide currentSlide = slides[i];
      tabs.add(Container(
        width: double.infinity,
        height: double.infinity,
        child: Container(
          margin: EdgeInsets.only(bottom: 60.0, top: 60.0),
          child: ListView(
            children: <Widget>[
              Container(
                child: Text( //Title Stuff
                  currentSlide.title,
                  style: currentSlide.styleTitle,
                  textAlign: TextAlign.center,
                ),
                margin: EdgeInsets.only(top: 0.0),
              ),
              GestureDetector(
                  child: Image.asset(
                    currentSlide.pathImage,
                    width: 200.0,
                    height: 500.0,
                    fit: BoxFit.contain,
                  )
              ),
              Container( //Description Stuff
                child: Text(
                  currentSlide.description,
                  style: currentSlide.styleDescription,
                  textAlign: TextAlign.center,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
                margin: EdgeInsets.only(top: 0.0),
              ),
            ],
          ),
        ),
      ));
    }
    return tabs;
  }*/

  @override
  Widget build(BuildContext context){
    return new IntroSlider(

      //List Slides
      slides: this.slides,
      //onDonePress: this.onDonePress,

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
      //listCustomTabs: this.renderListCustomTabs(),
      //backgroundColorAllSlides: Colors.grey,
      refFuncGoToTab: (refFunc) {
        this.goToTab = refFunc;
      },

      // Show or hide status bar
      shouldHideStatusBar: true,

      // On tab change completed
      onTabChangeCompleted: this.onTabChangeCompleted,
    );
  }

} //MyApp