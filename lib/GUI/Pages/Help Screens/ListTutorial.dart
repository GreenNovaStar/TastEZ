import 'package:flutter/material.dart';
import 'package:intro_slider/dot_animation_enum.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:tastez/GUI/Const.dart';
import 'package:tastez/GUI/Login/login_main.dart';
import 'package:tastez/home.dart';

class ListTutorial extends StatefulWidget {
  ListTutorial({Key key}) : super(key: key);

  @override
  ListTutorialState createState() => ListTutorialState();
}

class ListTutorialState extends State<ListTutorial> {
  List<Slide> slides = new List();

  Function goToTab;

  @override
  void initState(){
    super.initState();

    slides.add(
      new Slide( // HOME PAGE SLIDE
        title: "SHOPPING LIST",
        styleTitle: TextStyle(
          color: Color(0xffffffff),
          fontSize: 40.0,
          fontWeight: FontWeight.bold,
        ),
        marginTitle: EdgeInsets.only(top:15.0, bottom:5.0),
        description: "Never forget an Ingredient! Add Ingredients to your Shopping List for your next Grocery Outing!",
        styleDescription: TextStyle(
          color: Color(0xff000000),
          fontSize: 20.0,
          fontStyle: FontStyle.italic,
        ),
        maxLineTextDescription: 3,
        marginDescription: EdgeInsets.only(left: 8.0, right: 8.0, top: 3.0),
        pathImage: "assets/tutorialImages/ShoppingListImages/tutorialList.png",
        heightImage: 460.0,
        foregroundImageFit: BoxFit.fitHeight,
        colorBegin: themeColor,
        colorEnd: shadowColor,
        directionColorBegin: Alignment.topCenter,
        directionColorEnd: Alignment.center,
      ),
    );
    slides.add( // SEARCH PAGE SLIDE
      new Slide(
        title: "SHOPPING LIST",
        styleTitle: TextStyle(
          color: Color(0xffffffff),
          fontSize: 40.0,
          fontWeight: FontWeight.bold,
        ),
        marginTitle: EdgeInsets.only(top:15.0, bottom:5.0),
        description: 'Here you will find Ingredients added from Recipe Pages. Or add one by clicking "New Ingredient".',
        styleDescription: TextStyle(
          color: Color(0xff000000),
          fontSize: 20.0,
          fontStyle: FontStyle.italic,
        ),
        maxLineTextDescription: 3,
        marginDescription: EdgeInsets.only(left: 8.0, right: 8.0, top: 3.0),
        pathImage: "assets/tutorialImages/ShoppingListImages/tutorialList1.png",
        heightImage: 460.0,
        foregroundImageFit: BoxFit.fitHeight,
        colorBegin: themeColor,
        colorEnd: shadowColor,
        directionColorBegin: Alignment.topCenter,
        directionColorEnd: Alignment.center,
      ),
    );
    slides.add( // FAVORITES PAGE SLIDE
      new Slide(
        title: "SHOPPING LIST",
        styleTitle: TextStyle(
          color: Color(0xffffffff),
          fontSize: 40.0,
          fontWeight: FontWeight.bold,
        ),
        marginTitle: EdgeInsets.only(top:15.0, bottom:5.0),
        description: "Cross Off Items by tapping the ingredient on the List. Uncross the Ingredient by doing a Long Press on it.",
        styleDescription: TextStyle(
          color: Color(0xff000000),
          fontSize: 20.0,
          fontStyle: FontStyle.italic,
        ),
        maxLineTextDescription: 3,
        marginDescription: EdgeInsets.only(left: 8.0, right: 8.0, top: 3.0),
        pathImage: "assets/tutorialImages/ShoppingListImages/tutorialList1.png",
        heightImage: 460.0,
        foregroundImageFit: BoxFit.fitHeight,
        //backgroundColor: Color(0xfff5a623),
        colorBegin: themeColor,
        colorEnd: shadowColor,
        directionColorBegin: Alignment.topCenter,
        directionColorEnd: Alignment.center,
      ),
    );
    slides.add( // SHOPPING LIST PAGE SLIDE
      new Slide(
        title: "MAPS",
        styleTitle: TextStyle(
          color: Color(0xffffffff),
          fontSize: 40.0,
          fontWeight: FontWeight.bold,
        ),
        marginTitle: EdgeInsets.only(top:15.0, bottom:5.0),
        description: "Where to buy Ingredients? TastEZ can help you locate Local Markets when you tap 'Nearby Stores'.",
        styleDescription: TextStyle(
          color: Color(0xff000000),
          fontSize: 20.0,
          fontStyle: FontStyle.italic,
        ),
        maxLineTextDescription: 3,
        marginDescription: EdgeInsets.only(left: 8.0, right: 8.0, top: 3.0),
        pathImage: "assets/tutorialImages/ShoppingListImages/tutorialList2.png",
        heightImage: 460.0,
        foregroundImageFit: BoxFit.fitHeight,
        //backgroundColor: Color(0xfff5a623),
        colorBegin: themeColor,
        colorEnd: shadowColor,
        directionColorBegin: Alignment.topCenter,
        directionColorEnd: Alignment.center,
      ),
    );
    slides.add( // SHOPPING LIST PAGE SLIDE
      new Slide(
        title: "MAPS",
        styleTitle: TextStyle(
          color: Color(0xffffffff),
          fontSize: 40.0,
          fontWeight: FontWeight.bold,
        ),
        marginTitle: EdgeInsets.only(top:15.0, bottom:5.0),
        description: "Tap 'Search this area' to find near by stores provided by Google Maps!",
        styleDescription: TextStyle(
          color: Color(0xff000000),
          fontSize: 20.0,
          fontStyle: FontStyle.italic,
        ),
        maxLineTextDescription: 3,
        marginDescription: EdgeInsets.only(left: 8.0, right: 8.0, top: 3.0),
        pathImage: "assets/tutorialImages/ShoppingListImages/tutorialList3.png",
        heightImage: 460.0,
        foregroundImageFit: BoxFit.fitHeight,
        //backgroundColor: Color(0xfff5a623),
        colorBegin: themeColor,
        colorEnd: shadowColor,
        directionColorBegin: Alignment.topCenter,
        directionColorEnd: Alignment.center,
      ),
    );
    slides.add( // SHOPPING LIST PAGE SLIDE
      new Slide(
        title: "MAPS",
        styleTitle: TextStyle(
          color: Color(0xffffffff),
          fontSize: 40.0,
          fontWeight: FontWeight.bold,
        ),
        marginTitle: EdgeInsets.only(top:15.0, bottom:5.0),
        description: "When Tapping a store, you have the option to Open it on Google Maps for Directions!",
        styleDescription: TextStyle(
          color: Color(0xff000000),
          fontSize: 20.0,
          fontStyle: FontStyle.italic,
        ),
        maxLineTextDescription: 3,
        marginDescription: EdgeInsets.only(left: 8.0, right: 8.0, top: 3.0),
        pathImage: "assets/tutorialImages/ShoppingListImages/tutorialList4.png",
        heightImage: 460.0,
        foregroundImageFit: BoxFit.fitHeight,
        //backgroundColor: Color(0xfff5a623),
        colorBegin: themeColor,
        colorEnd: shadowColor,
        directionColorBegin: Alignment.topCenter,
        directionColorEnd: Alignment.center,
      ),
    );

  } //Widget initState

  //Return to first tab
  void onDonePress() {
    // Navigator.pushAndRemoveUntil(this.context, PageRouteBuilder(pageBuilder: (context, animation1, animation2) => Home()),(Route<dynamic> route) => false,);
    // Navigator.pushAndRemoveUntil(this.context, PageRouteBuilder(pageBuilder: (context, animation1, animation2) => LoginPageMain()),(Route<dynamic> route) => false,);
    Navigator.pop(context);
  } //onDonePress
  void onTabChangeCompleted(index){
    //Index of current tab is focused
  } //onTabChangeCompleted

  Widget renderNextBtn(){
    return Icon(
      Icons.navigate_next,
      color: Color(0xff99763a),
      size: 35.0,
    );
  } //renderNextButton
  Widget renderDoneBtn(){
    return Icon(
      Icons.done,
      color: Color(0xff99763a),
      size: 35.0,
    );
  } //renderDoneBtn
  Widget renderSkipBtn(){
    return Icon(
      Icons.skip_next,
      color: Color(0xff99763a),
      size: 35.0,
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
      // colorSkipBtn: Colors.black,
      highlightColorSkipBtn: Colors.black,

      //Next Button
      renderNextBtn: this.renderNextBtn(),

      //Done Button
      renderDoneBtn: this.renderDoneBtn(),
      onDonePress: this.onDonePress,
      // colorDoneBtn: Color(0xff99763a),
      highlightColorDoneBtn: Colors.black,

      //Dot Indicator
      colorDot: Color(0xff99763a),
      sizeDot: 10.0,
      typeDotAnimation: dotSliderAnimation.SIZE_TRANSITION,

      //Tabs
      refFuncGoToTab: (refFunc) {
        this.goToTab = refFunc;
      },

      // Show or hide status bar
      hideStatusBar: false,

      // On tab change completed
      onTabChangeCompleted: this.onTabChangeCompleted,
    );
  }

}