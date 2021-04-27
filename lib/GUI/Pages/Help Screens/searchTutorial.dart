import 'package:flutter/material.dart';
import 'package:intro_slider/dot_animation_enum.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:tastez/GUI/Const.dart';
import 'package:tastez/GUI/Login/login_main.dart';
import 'package:tastez/home.dart';

class SearchTutorial extends StatefulWidget {
  SearchTutorial({Key key}) : super(key: key);

  @override
  SearchTutorialState createState() => SearchTutorialState();
}

class SearchTutorialState extends State<SearchTutorial> {
  List<Slide> slides = new List();

  Function goToTab;

  @override
  void initState(){
    super.initState();

    slides.add(
      new Slide( // HOME PAGE SLIDE
        title: "SEARCH",
        styleTitle: TextStyle(
          color: Color(0xffffffff),
          fontSize: 40.0,
          fontWeight: FontWeight.bold,
        ),
        marginTitle: EdgeInsets.only(top:15.0, bottom:5.0),
        description: "Can't Find what you want? Use Search to find Specific Recipes!",
        styleDescription: TextStyle(
          color: Color(0xff000000),
          fontSize: 20.0,
          fontStyle: FontStyle.italic,
        ),
        maxLineTextDescription: 3,
        marginDescription: EdgeInsets.only(left: 8.0, right: 8.0, top: 3.0),
        pathImage: "assets/tutorialImages/tutorialSearch.png",
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
        title: "SEARCH",
        styleTitle: TextStyle(
          color: Color(0xffffffff),
          fontSize: 40.0,
          fontWeight: FontWeight.bold,
        ),
        marginTitle: EdgeInsets.only(top:15.0, bottom:5.0),
        description: 'Search recipes using Keywords on the Search Bar. You can also refine your search using the Filter option.',
        styleDescription: TextStyle(
          color: Color(0xff000000),
          fontSize: 20.0,
          fontStyle: FontStyle.italic,
        ),
        maxLineTextDescription: 3,
        marginDescription: EdgeInsets.only(left: 8.0, right: 8.0, top: 3.0),
        pathImage: "assets/tutorialImages/tutorialSearch1.png",
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
        title: "FILTERS",
        styleTitle: TextStyle(
          color: Color(0xffffffff),
          fontSize: 40.0,
          fontWeight: FontWeight.bold,
        ),
        marginTitle: EdgeInsets.only(top:15.0, bottom:5.0),
        description: "Select your desired Filters and Hit 'Apply'. Selected Filters will be applied to your next Search.",
        styleDescription: TextStyle(
          color: Color(0xff000000),
          fontSize: 20.0,
          fontStyle: FontStyle.italic,
        ),
        maxLineTextDescription: 3,
        marginDescription: EdgeInsets.only(left: 8.0, right: 8.0, top: 3.0),
        pathImage: "assets/tutorialImages/tutorialSearch2.png",
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
        title: "SEARCH RESULTS",
        styleTitle: TextStyle(
          color: Color(0xffffffff),
          fontSize: 40.0,
          fontWeight: FontWeight.bold,
        ),
        marginTitle: EdgeInsets.only(top:15.0, bottom:5.0),
        description: "Success! TastEZ should return a list of recipes based off your specifications.",
        styleDescription: TextStyle(
          color: Color(0xff000000),
          fontSize: 20.0,
          fontStyle: FontStyle.italic,
        ),
        maxLineTextDescription: 3,
        marginDescription: EdgeInsets.only(left: 8.0, right: 8.0, top: 3.0),
        pathImage: "assets/tutorialImages/tutorialSearch3.png",
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
      sizeDot: 13.0,
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