import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tastez/BlankScreen.dart';
import 'package:tastez/GUI/AppBar/AppBarV2.dart';
import 'package:tastez/GUI/AppBar/CurvyAppBar.dart';
import 'package:tastez/GUI/BottomNavigationBar/BottomNavigationBar.dart';
import 'package:tastez/GUI/BottomNavigationBar/CurvyBottomNavigationBar.dart';
import 'package:tastez/GUI/Const.dart';
import 'package:tastez/GUI/Pages/DetailedWinePage.dart';
import 'package:tastez/GUI/Pages/DishPairingFromWine.dart';
import 'package:tastez/GUI/Pages/favorites.dart';
import 'package:tastez/GUI/Pages/shop.list.dart';
import 'package:tastez/GUI/Pages/suggestions.dart';
import 'package:tastez/Middleware/APIParsing/Recipe.dart';
import 'package:tastez/Middleware/HomePage/HomePage.dart';
import 'package:tastez/Middleware/HomePage/OverFlowButtonIcons.dart';
import 'package:tastez/Middleware/Pages/Search.dart';
import 'package:tastez/Middleware/Pages/searchResult.dart';
import 'package:tastez/Middleware/TestingConst/DefaultUser.dart';
import 'package:tastez/Middleware/TestingConst/NavigatorConst.dart';

CustomSearch search = new CustomSearch();
int _lastIntegerSelected;
PageController controller = PageController(
  initialPage: 0,
);

class Home extends StatefulWidget {
  final String title;
  Home({Key key, this.title}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  String query, currTitle;
  Recipe response;

  final List<String> _pageTitles = ["Welcome to TastEZ", "Favorites", "Pantry", "Shopping List"];
  TabController _controller;
  // PageController _pageController;

  final BaseOptions _options = new BaseOptions(
    baseUrl: "https://rapidapi.p.rapidapi.com",
    connectTimeout:5000,
    receiveTimeout:3000,
    headers: {
      "x-rapidapi-host": "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com",
      "x-rapidapi-key": "0b83fa3f6emshf35335a21f7c826p178545jsnf157389bedd5",
      "useQueryString": true,
    },
    contentType: "application/json",
  );

  @override
  void initState(){
    super.initState();
    currTitle = _pageTitles[0];
    _controller =  TabController(length:4, vsync:this);
    defaultUser.initUser();
    controller = PageController(
      initialPage: 0,
    );

  }

  Future<void> refreshTitle() {
    setState(() {
      return currTitle = _pageTitles[_controller.index];
    });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    print("hello");
    final Size size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: themeColor, //color of the system status bar (TOP bar)
      systemNavigationBarColor: Colors.black, //color of system navigation bar (BOTTOM bar)
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   shadowColor: subAccentColor,
      // ),
      theme: defaultTheme,
      home: Scaffold(
          extendBody: true,
          resizeToAvoidBottomInset: false,
          extendBodyBehindAppBar: false,
          appBar: PreferredSize(
            preferredSize: Size(size.width, 100),
            child: CurvyAppBar(
              size: size,
              onLogoPressed: () {
                setState(() {
                  controller.jumpToPage(0);
                });
              },
              currentPageTitle: controller.hasClients ? getCurrentPageName(controller.page.toInt()) : getCurrentPageName(0),
              // currentPageTitle: controller.hasClients ? getCurrentPageName(controller.page.toInt()) : "Loading...",
            ),
          ),
          backgroundColor: subAccentColor,
          body: Stack(
              children: [
                Container(
                  color: subAccentColor,
//--------------------Home Page-------------------------------
                  child: HomePageView(currUser: defaultUser, pageController: controller,),
                )//displays the body of the app
              ],
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(

              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: shadowColor,
                  blurRadius:100,
                ),
              ],
            ),
            child: Container(
                width: size.width,
                height: 80,
                // color: subAccentColor,
                child: Stack(
                  children: [
                    CustomPaint(
                      size: Size(size.width, 80),
                      painter: BNBCustomPainter(),
                    ),

//--------------------Floating Action Button-------------------------------
                    Center(
                        heightFactor: 0.6,
                        child: GestureDetector(
                          child:
                          // FloatingActionButton(onPressed: (){print("search button pressed");},
                          FloatingActionButton(
                            onPressed: () async {
                              final resultsFromSearch = await showSearch(
                                context: context,
                                delegate: CustomSearch(searchQuery: defaultUser.previousSearches, searchFilterResults: defaultUser.searchFilter),
                              );
                              if(resultsFromSearch != null){
                                print("result from search = $resultsFromSearch");
                                print("search filter results = ${defaultUser.searchFilter.toString()}");
                                Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeBySearch(defaultUser, resultsFromSearch, defaultUser.searchFilter, false)));
                              }else{
                                print("pressed back from search, nothing returned");
                              }

                            },
                            backgroundColor: themeColor,
                            child: Icon(Icons.search, color: subAccentColor,), elevation: 0.1,),
                        )
                    ),

//--------------------Bottom Navigation Icons-------------------------------
                    Container(
                      width: size.width,
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(icon: Icon(Icons.home),
                            onPressed: (){
                              setState((){
                                controller.jumpToPage(0);
                                print(controller.page);
                              });
                            },
                            color: controller.hasClients && controller.page.toInt() == 0 ? Colors.redAccent : Colors.white,
                          ),
                          IconButton(icon: Icon(Icons.favorite),
                            onPressed: (){
                              print("favorites button pressed");
                              setState((){
                                controller.jumpToPage(1);
                                print(controller.page);
                              });
                            },
                            color: controller.hasClients && controller.page.toInt() == 1 ? Colors.redAccent : Colors.white,
                          ),
                          Container(width:size.width*0.20), //spacer for bottom icons
                          IconButton(icon: Icon(Icons.wine_bar_rounded),
                            onPressed: (){
                              print("pantry button pressed");
                              setState((){
                                controller.jumpToPage(2);
                                print(controller.page);
                              });
                            },
                            color: controller.hasClients && controller.page.toInt() == 2 ? Colors.redAccent : Colors.white,
                          ),
                          IconButton(
                            // icon: Icon(Icons.shopping_basket),
                            icon: Icon(Icons.assignment),
                            onPressed: (){
                              print("shopping list button pressed");
                              setState((){
                                controller.jumpToPage(3);
                                print(controller.page);
                              });
                            },
                            color: controller.hasClients && controller.page.toInt() == 3 ? Colors.redAccent : Colors.white,
                          ),
                        ],
                      ),
                    )
                  ],
                )
            ),
          ),
      ),
    );
  }

  String getCurrentPageName(int page){
    switch(page){
      // case 0: return "Suggestions";
      case 0: return "Top Recipes";
      case 1: return "Favorites";
      case 2: return "Wine Pairing";
      case 3: return "Shopping List";
    }
  }


}


