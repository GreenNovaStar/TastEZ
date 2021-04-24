import 'package:flutter/material.dart';
import 'package:tastez/GUI/BottomNavigationBar/BottomIconNavigation.dart';
import 'package:tastez/GUI/BottomNavigationBar/BottomNavigationBar.dart';
import 'package:tastez/GUI/BottomNavigationBar/SearchButton.dart';
import 'package:tastez/GUI/Const.dart';
import 'package:tastez/Middleware/Pages/Search.dart';
import 'package:tastez/Middleware/Pages/searchResult.dart';
import 'package:tastez/Middleware/TestingConst/DefaultUser.dart';
import 'package:tastez/Middleware/TestingConst/NavigatorConst.dart';
import 'package:tastez/Middleware/user.dart';
import 'dart:async';

class CurvyBottomNavigationBar extends StatefulWidget {

  User currUser;
  CurvyBottomNavigationBar({@required this.currUser});

  @override
  _CurvyBottomNavigationBarState createState() => _CurvyBottomNavigationBarState();
}

class _CurvyBottomNavigationBarState extends State<CurvyBottomNavigationBar> {


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black,
            blurRadius: 10,
          ),
        ],
      ),
      child: Container(
          width: size.width,
          height: 80,
          color: subAccentColor,
          child: Stack(
            children: [
              CustomPaint(
                size: Size(size.width, 80),
                painter: BNBCustomPainter(),
              ),

//--------------------Floating Action Button-------------------------------
              Center(
                  heightFactor: 0.6,
                  // child: SearchButton(
                  //   onPressedSearch: widget.onPressedSearch,
                  // ),
                  child: FloatingActionButton(
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
                    child: Icon(
                        Icons.search,
                        color: subAccentColor,
                    ),
                    elevation: 0.1,
                  )
              ),

//--------------------Bottom Navigation Icons-------------------------------
              Container(
                width: size.width,
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // BottomIconNavigation(icon: Icons.home, controller: controller),
                    IconButton(icon: Icon(Icons.home),
                      onPressed: (){
                        setState(() {
                          bodyNavigatorKey.currentState.pushReplacementNamed('/suggestions');
                          // print(bodyNavigatorKey.currentWidget);
                          // widget.pageController.jumpToPage(0);
                          // print(widget.pageController.page);
                        });
                      },
                      // color: controller.hasClients && controller.page.toInt() == 0 ? Colors.redAccent : Colors.white,
                      color: subAccentColor,
                      // color: widget.pageController != null ?
                      // widget.pageController.hasClients?
                      // widget.pageController.page.toInt() == 0?
                      //               Colors.redAccent:
                      //               subAccentColor:
                      //             subAccentColor:
                      //           subAccentColor,
                      // color: subAccentColor,
                    ),
                    IconButton(icon: Icon(Icons.favorite),
                      onPressed: (){
                        // print("favorites button pressed");
                        setState(() {
                          // widget.pageController.jumpToPage(1);
                          // print(widget.pageController.page);
                          bodyNavigatorKey.currentState.pushReplacementNamed('/favorites');
                          // print(bodyNavigatorKey.currentWidget);
                        });
                      },
                      // color: controller.hasClients && controller.page.toInt() == 1 ? Colors.redAccent : Colors.white,
                      color: subAccentColor,
                      // color: widget.pageController != null ?
                      // widget.pageController.hasClients?
                      // widget.pageController.page.toInt() == 1?
                      //               Colors.redAccent:
                      //               subAccentColor:
                      //             subAccentColor:
                      //           subAccentColor,
                      // color: subAccentColor,
                    ),
                    Container(width:size.width*0.20), //spacer for bottom icons
                    IconButton(icon: Icon(Icons.wine_bar_rounded),
                      onPressed: (){
                        // print("pantry button pressed");
                        // setState(() {
                        //   widget.pageController.jumpToPage(2);
                        //   print(widget.pageController.page);
                        // });
                        bodyNavigatorKey.currentState.pushReplacementNamed('/wines');
                        // print(bodyNavigatorKey.currentWidget);
                      },
                      // color: controller.hasClients && controller.page.toInt() == 2 ? Colors.redAccent : Colors.white,
                      color: subAccentColor,
                      // color: widget.pageController != null ?
                      // widget.pageController.hasClients?
                      // widget.pageController.page.toInt() == 2?
                      //             Colors.redAccent:
                      //             subAccentColor:
                      //           subAccentColor:
                      //         subAccentColor,
                      // color: subAccentColor,
                    ),
                    IconButton(
                      // icon: Icon(Icons.shopping_basket),
                      icon: Icon(Icons.description),
                      onPressed: (){
                        // print("shopping list button pressed");
                        setState(() {
                          // widget.pageController.jumpToPage(3);
                          // print(widget.pageController.page);
                          bodyNavigatorKey.currentState.pushReplacementNamed('/shoppingList');
                          // print(bodyNavigatorKey.currentWidget);
                        });
                      },
                      // color: controller.hasClients && controller.page.toInt() == 3 ? Colors.redAccent : Colors.white,
                      color: subAccentColor,
                      // color: widget.pageController != null ?
                      // widget.pageController.hasClients?
                      // widget.pageController.page.toInt() == 3?
                      //             Colors.redAccent:
                      //             subAccentColor:
                      //           subAccentColor:
                      //         subAccentColor,
                      // color: subAccentColor,
                    ),
                  ],
                ),
              )
            ],
          )
      ),
    );
  }
}
