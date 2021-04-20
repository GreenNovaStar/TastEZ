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
import 'package:tastez/Middleware/API%20Parsing/Recipe.dart';
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
  // User defaultUser = User(
  //   id: 0,                                    //id
  //   uuid: "ABCDEFG1234567",                     //uuid
  //   name: "John Smith",                         //name
  //   email: "example@aol.com",                    //email
  //   prefs: new Prefs(),
  //   pantry: new Pantry(
  //     cannedGoods: List.empty(growable: true),
  //     refrigerator: List.empty(growable: true),
  //     freezer: List.empty(growable: true),
  //     misc: List.empty(growable: true),
  //     meats: List.empty(growable: true),
  //     dairy: List.empty(growable: true),
  //     grainsNuts: List.empty(growable: true),
  //     specialty: List.empty(growable: true),
  //     drinks: List.empty(growable: true),
  //     snacks: List.empty(growable: true),
  //     produce: List.empty(growable: true),
  //     toppings: List.empty(growable: true),
  //     bakedGoods: List.empty(growable: true),
  //   ),
  //   favorites: List.empty(growable: true), //favorites
  //   shopping: List.empty(growable: true), //shopping list
  //   previousSearches: List.empty(growable: true), //previous searches
  // );
  // final searchProvider = Search();
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
      theme: ThemeData(
        shadowColor: subAccentColor,
      ),
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
                  child: HomePageView(currUser: defaultUser, pageController: controller,), //displays the body of the app
//                   child: Center(child: Text("Temporary Body", style: TextStyle(fontSize: 30),)), //temporary body
//                   child: FillerHomePage(pageController: controller,),
                ),
//--------------------Bottom Navigation Page UI Design-------------------------------
//                 Positioned(
//                   bottom: 0,
//                   left: 0,
//                   child: Container(
//                       width: size.width,
//                       height: 80,
//                       child: Stack(
//                         children: [
//                           CustomPaint(
//                             size: Size(size.width, 80),
//                             painter: BNBCustomPainter(),
//                           ),
//
// //--------------------Floating Action Button-------------------------------
//                           Center(
//                               heightFactor: 0.6,
//                               child: GestureDetector(
//                                 child:
//                                   // FloatingActionButton(onPressed: (){print("search button pressed");},
//                                   FloatingActionButton(
//                                       onPressed: () async {
//                                         final resultsFromSearch = await showSearch(
//                                           context: context,
//                                           delegate: CustomSearch(searchQuery: defaultUser.previousSearches),
//                                         );
//                                         if(resultsFromSearch != null){
//                                           print("result from search = $resultsFromSearch");
//                                           Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeBySearch(defaultUser, resultsFromSearch)));
//                                         }else{
//                                           print("pressed back from search, nothing returned");
//                                         }
//
//                                     },
//                                     backgroundColor: themeColor,
//                                     child: Icon(Icons.search), elevation: 0.1,),
//                               )
//                           ),
//
// //--------------------Bottom Navigation Icons-------------------------------
//                           Container(
//                             width: size.width,
//                             height: 80,
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 IconButton(icon: Icon(Icons.home),
//                                   onPressed: (){
//                                     setState((){
//                                       controller.jumpToPage(0);
//                                       print(controller.page);
//                                     });
//                                   },
//                                   color: controller.hasClients && controller.page.toInt() == 0 ? Colors.redAccent : Colors.white,
//                                 ),
//                                 IconButton(icon: Icon(Icons.favorite),
//                                   onPressed: (){
//                                     print("favorites button pressed");
//                                     setState((){
//                                       controller.jumpToPage(1);
//                                       print(controller.page);
//                                     });
//                                   },
//                                   color: controller.hasClients && controller.page.toInt() == 1 ? Colors.redAccent : Colors.white,
//                                 ),
//                                 Container(width:size.width*0.20), //spacer for bottom icons
//                                 IconButton(icon: Icon(Icons.kitchen),
//                                   onPressed: (){
//                                     print("pantry button pressed");
//                                     setState((){
//                                       controller.jumpToPage(2);
//                                       print(controller.page);
//                                     });
//                                   },
//                                   color: controller.hasClients && controller.page.toInt() == 2 ? Colors.redAccent : Colors.white,
//                                 ),
//                                 IconButton(icon: Icon(Icons.shopping_basket),
//                                   onPressed: (){
//                                     print("shopping list button pressed");
//                                     setState((){
//                                       controller.jumpToPage(3);
//                                       print(controller.page);
//                                     });
//                                   },
//                                   color: controller.hasClients && controller.page.toInt() == 3 ? Colors.redAccent : Colors.white,
//                                 ),
//                               ],
//                             ),
//                           )
//                         ],
//                       )
//                   ),
//                 )
              ]
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
                                Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeBySearch(defaultUser, resultsFromSearch, defaultUser.searchFilter)));
                              }else{
                                print("pressed back from search, nothing returned");
                              }

                            },
                            backgroundColor: themeColor,
                            child: Icon(Icons.search), elevation: 0.1,),
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

    // return Scaffold(
    //   appBar: PreferredSize(preferredSize: Size(size.width, 100),
    //     child: CurvyAppBar(
    //       size: size,
    //     ),
    //   ),
    //   body: Navigator(
    //     key: bodyNavigatorKey,
    //     onGenerateRoute: (settings) {
    //       print(settings.name);
    //
    //       if(settings.name == '/suggestions'){
    //         return MaterialPageRoute(
    //           builder: (context) => suggestions(defaultUser),
    //         );
    //       }
    //       if(settings.name == '/favorites'){
    //         return MaterialPageRoute(
    //           builder: (context) => favorites(defaultUser),
    //         );
    //       }
    //       if(settings.name == '/wines'){
    //         return MaterialPageRoute(
    //           builder: (context) => DishPairing(defaultUser),
    //         );
    //       }
    //       if(settings.name == '/shoppingList'){
    //         return MaterialPageRoute(
    //           builder: (context) => ShoppingList(currUser: defaultUser),
    //         );
    //       }
    //
    //       return MaterialPageRoute(
    //         builder: (context) => suggestions(defaultUser),
    //       );
    //
    //     },
    //   ),
    //   bottomNavigationBar: CurvyBottomNavigationBar(currUser: defaultUser,),
    // );

    // return Scaffold(
    //   // appBar: PreferredSize(preferredSize: Size(size.width, 100),
    //   //   child: CurvyAppBar(size: size),
    //   // ),
    //   appBar: AppBar(
    //     backgroundColor: themeColor,
    //
    //     title: MaterialButton(
    //       onPressed: () {
    //         bodyNavigatorKey.currentState.pushReplacementNamed('/suggestions');
    //         Navigator.pop(context);
    //       },
    //       child: SizedBox(height: 33, child: Image.asset('assets/TastEZ_whitetext.png')),
    //     ),
    //     actions: [
    //       IconButton(
    //         onPressed: () {print("refresh button pressed");},
    //         icon: Icon(Icons.refresh_rounded),
    //         splashRadius: 20,
    //         color: Colors.white,
    //       ),
    //       PopupMenuButton<String>(
    //         color: Colors.white,
    //         onSelected: (item) => DialogConstants.selectedItemProfile(item, context),
    //         itemBuilder: (BuildContext context){
    //           //if person is logged in
    //           return DialogConstants.dialogChoicesProfile.map((String item) {
    //             return PopupMenuItem<String>(
    //               value: item,
    //               child: Text(item),
    //             );
    //           }).toList();
    //         },
    //         icon: CircleAvatar(
    //           maxRadius: 15,
    //           //backgroundColor: Colors.black12,
    //           backgroundColor: Color(0x00000000), //transparent color code
    //           //backgroundImage: NetworkImage("https://www.clipartmax.com/png/small/15-153165_log-clipart-user-profile-phone-png.png"), //need to link with user profile
    //           child: Container(
    //             // decoration: BoxDecoration(
    //             //   shape: BoxShape.circle,
    //             //   border: Border.all(color: Colors.white)),
    //               child: Icon(Icons.person, color: Colors.white)), //fallback if there is no profile picture
    //         ),
    //       ),
    //       PopupMenuButton<String>(
    //         color: Colors.white,
    //         onSelected: (item) => DialogConstants.selectedItemOverflow(item),
    //         itemBuilder: (BuildContext context){
    //           return DialogConstants.dialogChoicesOverflow.map((String item) {
    //             return PopupMenuItem<String>(
    //               value: item,
    //               child: Text(item),
    //             );
    //           }).toList();
    //         },
    //         icon: Icon(Icons.more_vert, color: Colors.white),
    //       ),
    //     ]
    //   ),
    //   bottomNavigationBar: CurvyBottomNavigationBar(
    //     currUser: defaultUser,
    //   ),
    //   body: Navigator(
    //     key: bodyNavigatorKey,
    //     onGenerateRoute: (settings){
    //       if(settings.name == "/suggestions"){
    //         return MaterialPageRoute(builder: (context) => suggestions(defaultUser));
    //       }
    //       return MaterialPageRoute(builder: (context) => BlankScreen(routeName: "Tester",));
    //     },
    //   ),
    // );

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

  // Widget navigation() {
  //   return Container(
  //     color: Colors.white,
  //     child: TabBar(
  //       controller:_controller,
  //       labelColor: Colors.amber,
  //       unselectedLabelColor: Colors.deepOrange,
  //       indicatorSize: TabBarIndicatorSize.tab,
  //       indicatorPadding: EdgeInsets.all(5.0),
  //       indicatorColor: Colors.amber,
  //       tabs: [
  //         Tab(icon: Icon(Icons.home)),
  //         Tab(icon: Icon(Icons.favorite)),
  //         Tab(icon: Icon(Icons.kitchen)),
  //         Tab(icon: Icon(Icons.shopping_basket)),
  //       ],),);
  // }
}


