import 'package:flutter/material.dart';
import 'package:intro_slider/dot_animation_enum.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:tastez/GUI/Const.dart';
import 'package:tastez/GUI/Login/login_main.dart';
import 'package:tastez/home.dart';

class RecipeTutorial extends StatefulWidget {
  RecipeTutorial({Key key}) : super(key: key);

  @override
  RecipeTutorialState createState() => RecipeTutorialState();
}

class RecipeTutorialState extends State<RecipeTutorial> {
  List<Slide> slides = new List();

  Function goToTab;

  @override
  void initState(){
    super.initState();

    slides.add(
      new Slide( // HOME PAGE SLIDE
        title: "RECIPE PAGE",
        styleTitle: TextStyle(
          color: Color(0xffffffff),
          fontSize: 40.0,
          fontWeight: FontWeight.bold,
        ),
        marginTitle: EdgeInsets.only(top:15.0, bottom:5.0),
        description: "Learn what TastEZ Recipe Pages have to offer!",
        styleDescription: TextStyle(
          color: Color(0xff000000),
          fontSize: 20.0,
          fontStyle: FontStyle.italic,
        ),
        maxLineTextDescription: 3,
        marginDescription: EdgeInsets.only(left: 8.0, right: 8.0, top: 3.0),
        pathImage: "assets/tutorialImages/RecipePageImages/tutorialRecipePage.png",
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
        title: "RECIPE INFO",
        styleTitle: TextStyle(
          color: Color(0xffffffff),
          fontSize: 40.0,
          fontWeight: FontWeight.bold,
        ),
        marginTitle: EdgeInsets.only(top:15.0, bottom:5.0),
        description: 'Our Recipes include Cook Time, Rating, Servings, and Allergies (Gluten-Free, Dairy-Free, etc.)',
        styleDescription: TextStyle(
          color: Color(0xff000000),
          fontSize: 20.0,
          fontStyle: FontStyle.italic,
        ),
        maxLineTextDescription: 3,
        marginDescription: EdgeInsets.only(left: 8.0, right: 8.0, top: 3.0),
        pathImage: "assets/tutorialImages/RecipePageImages/tutorialRecipePage1.png",
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
        title: "INGREDIENTS",
        styleTitle: TextStyle(
          color: Color(0xffffffff),
          fontSize: 40.0,
          fontWeight: FontWeight.bold,
        ),
        marginTitle: EdgeInsets.only(top:15.0, bottom:5.0),
        description: "Find a list of Ingredients for each recipe. Tapping the ingredients will add it to your Shopping List!",
        styleDescription: TextStyle(
          color: Color(0xff000000),
          fontSize: 20.0,
          fontStyle: FontStyle.italic,
        ),
        maxLineTextDescription: 3,
        marginDescription: EdgeInsets.only(left: 8.0, right: 8.0, top: 3.0),
        pathImage: "assets/tutorialImages/RecipePageImages/tutorialRecipePage2.png",
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
        title: "INSTRUCTIONS",
        styleTitle: TextStyle(
          color: Color(0xffffffff),
          fontSize: 40.0,
          fontWeight: FontWeight.bold,
        ),
        marginTitle: EdgeInsets.only(top:15.0, bottom:5.0),
        description: "Our Recipe page provides simple Step-by-Step Instructions!",
        styleDescription: TextStyle(
          color: Color(0xff000000),
          fontSize: 20.0,
          fontStyle: FontStyle.italic,
        ),
        maxLineTextDescription: 3,
        marginDescription: EdgeInsets.only(left: 8.0, right: 8.0, top: 3.0),
        pathImage: "assets/tutorialImages/RecipePageImages/tutorialRecipePage3.png",
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
        title: "WINE PAIRING",
        styleTitle: TextStyle(
          color: Color(0xffffffff),
          fontSize: 40.0,
          fontWeight: FontWeight.bold,
        ),
        marginTitle: EdgeInsets.only(top:15.0, bottom:5.0),
        description: "TastEZ will provide Wine Pairings when available. Tapping a Wine will redirect you to www.Wine.com.",
        styleDescription: TextStyle(
          color: Color(0xff000000),
          fontSize: 20.0,
          fontStyle: FontStyle.italic,
        ),
        maxLineTextDescription: 3,
        marginDescription: EdgeInsets.only(left: 8.0, right: 8.0, top: 3.0),
        pathImage: "assets/tutorialImages/RecipePageImages/tutorialRecipePage4.png",
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
        title: "SEARCH WINE",
        styleTitle: TextStyle(
          color: Color(0xffffffff),
          fontSize: 40.0,
          fontWeight: FontWeight.bold,
        ),
        marginTitle: EdgeInsets.only(top:15.0, bottom:5.0),
        description: "TastEZ will begin a search on your selected Wine in Wine.com. Browse and Purchase Desired Wine Products from the website!",
        styleDescription: TextStyle(
          color: Color(0xff000000),
          fontSize: 20.0,
          fontStyle: FontStyle.italic,
        ),
        maxLineTextDescription: 3,
        marginDescription: EdgeInsets.only(left: 8.0, right: 8.0, top: 3.0),
        pathImage: "assets/tutorialImages/RecipePageImages/tutorialRecipePage5.png",
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
        title: "FAVORITE RECIPE",
        styleTitle: TextStyle(
          color: Color(0xffffffff),
          fontSize: 40.0,
          fontWeight: FontWeight.bold,
        ),
        marginTitle: EdgeInsets.only(top:15.0, bottom:5.0),
        description: "Like the Recipe? Press the 'Heart' Icon to Favorite the Recipe! You can find Favorited Recipes in the 'Favorites' Tab.",
        styleDescription: TextStyle(
          color: Color(0xff000000),
          fontSize: 20.0,
          fontStyle: FontStyle.italic,
        ),
        maxLineTextDescription: 3,
        marginDescription: EdgeInsets.only(left: 8.0, right: 8.0, top: 3.0),
        pathImage: "assets/tutorialImages/RecipePageImages/tutorialRecipePage6.png",
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