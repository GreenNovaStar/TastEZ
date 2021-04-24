import 'package:flutter/material.dart';
import 'package:tastez/GUI/AppBar/CurvyAppBar.dart';
import 'package:tastez/GUI/BottomNavigationBar/CurvyBottomNavigationBar.dart';
import 'package:tastez/GUI/Const.dart';
import 'package:tastez/Middleware/Json%20Parsing/FoodPairings.dart';
import 'package:tastez/Middleware/Pages/searchResult.dart';
import 'package:tastez/Middleware/TestingConst/DefaultUser.dart';
import 'package:tastez/Middleware/TestingConst/NavigatorConst.dart';

class DetailedWinePage extends StatelessWidget {

  String title;
  String description;
  List<FoodPairings> foodPairings;
  String wineImage;
  DetailedWinePage({this.title, this.description, this.foodPairings, this.wineImage});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    // return Scaffold(
    //   appBar: PreferredSize(
    //     preferredSize: Size(size.width, 100),
    //     child: CurvyAppBar(size: size,),
    //   ),
    //   backgroundColor: subAccentColor,
    //   body: Column(
    //     children: [
    //       // Card(
    //       //   elevation: 10,
    //       //   child: Column(
    //       //     children: [
    //       //       ListTile(title: Text(title, style: pageTitleFont)),
    //       //       ListTile(title: Text(description)),
    //       //     ],
    //       //   ),
    //       // ),
    //       Card(
    //         color: Colors.greenAccent,
    //         child: Padding(
    //           padding: const EdgeInsets.only(left: 3, top: 0, bottom: 10, right: 5),
    //           child: ListTile(
    //             title: Text(title, style: pageTitleFont),
    //             subtitle: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),//Text(description,),
    //           ),
    //         ),
    //       ),
    //       // Card(
    //       //   child: ListTile(title: Text(description)),
    //       // ),
    //
    //       Expanded(
    //         //fit: FlexFit.tight,
    //         child: ListView.builder(
    //           itemCount: 10,//foodPairings.length,
    //           itemBuilder: (context, index){
    //             return Card(
    //               color: Colors.green[100],
    //                 child: Column(
    //                   children: [
    //                     Image.asset("assets/TastEZ_logo.png"),
    //                     ListTile(
    //                       title: Text("food pairing $index", style: TextStyle(fontSize: 20, ),),
    //                       trailing: MaterialButton(
    //                         onPressed: () {
    //                           print("card button pressed");
    //                           Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeBySearch(defaultUser, "tacos")));
    //                         },
    //                         child: Flexible(
    //                           fit: FlexFit.tight,
    //                           child: Row(
    //                             mainAxisSize: MainAxisSize.min,
    //                             children: [
    //                               Icon(Icons.search_rounded, size: 20),
    //                               Padding(
    //                                 padding: const EdgeInsets.only(left: 10),
    //                                 child: Text("Search", style: TextStyle(fontSize: 16,),),
    //                               ),
    //                             ],
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                   ],
    //                 )
    //             );
    //           },
    //         ),
    //       )
    //
    //       // Flexible(
    //       //   fit: FlexFit.tight,
    //       //   child: ListView.builder(
    //       //     itemCount: 10,//foodPairings.length,
    //       //     itemBuilder: (context, index){
    //       //       return Card(
    //       //         child: Column(
    //       //           children: [
    //       //             Image.asset("assets/TastEZ_logo.png"),
    //       //             ListTile(
    //       //                 title: Text("food pairing $index"),
    //       //               trailing: MaterialButton(
    //       //                 onPressed: () {print("card button pressed");},
    //       //                 child: Flexible(
    //       //                   fit: FlexFit.tight,
    //       //                   child: Row(
    //       //                     mainAxisSize: MainAxisSize.min,
    //       //                     children: [
    //       //                       Icon(Icons.search_rounded),
    //       //                       Text("Search"),
    //       //                     ],
    //       //                   ),
    //       //                 ),
    //       //               ),
    //       //             ),
    //       //           ],
    //       //         )
    //       //       );
    //       //     },
    //       //   ),
    //       // )
    //     ],
    //   ),
    //   bottomNavigationBar: CurvyBottomNavigationBar(
    //
    //   ),
    // );

    // return Scaffold(
    //   body: Column(
    //     children: [
    //       Card(
    //         color: Colors.greenAccent,
    //         child: Padding(
    //           padding: const EdgeInsets.only(left: 3, top: 0, bottom: 10, right: 5),
    //           child: ListTile(
    //             title: Text(title, style: pageTitleFont),
    //             subtitle: Text(description, style: TextStyle(fontSize: 16)),
    //             // subtitle: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),//Text(description,),
    //           ),
    //         ),
    //       ),
    //       // ListView.builder(
    //       //   itemCount: foodPairings.length,
    //       //   itemBuilder: (context, index){
    //       //     return Card(
    //       //         color: Colors.green[100],
    //       //         child: Column(
    //       //           children: [
    //       //             Image.asset("assets/TastEZ_logo.png"),
    //       //             ListTile(
    //       //               // title: Text("food pairing $index", style: TextStyle(fontSize: 20, ),),
    //       //               title: Text(foodPairings[index], style: TextStyle(fontSize: 20, ),),
    //       //               trailing: MaterialButton(
    //       //                 onPressed: () {
    //       //                   print("card button pressed");
    //       //                   Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeBySearch(defaultUser, "tacos")));
    //       //                 },
    //       //                 child: Flexible(
    //       //                   fit: FlexFit.tight,
    //       //                   child: Row(
    //       //                     mainAxisSize: MainAxisSize.min,
    //       //                     children: [
    //       //                       Icon(Icons.search_rounded, size: 20),
    //       //                       Padding(
    //       //                         padding: const EdgeInsets.only(left: 10),
    //       //                         child: Text("Search", style: TextStyle(fontSize: 16,),),
    //       //                       ),
    //       //                     ],
    //       //                   ),
    //       //                 ),
    //       //               ),
    //       //             ),
    //       //           ],
    //       //         )
    //       //     );
    //       //   },
    //       // ),
    //       Expanded(
    //         //fit: FlexFit.tight,
    //         child: ListView.builder(
    //           itemCount: foodPairings.length,
    //           itemBuilder: (context, index){
    //             return Card(
    //                 color: Colors.green[100],
    //                 child: Column(
    //                   children: [
    //                     Image.asset("assets/TastEZ_logo.png"),
    //                     ListTile(
    //                       title: Text(foodPairings[index], style: TextStyle(fontSize: 20, ),),
    //                       trailing: MaterialButton(
    //                         onPressed: () {
    //                           print("card button pressed");
    //                           bodyNavigatorKey.currentState.push(MaterialPageRoute(builder: (context) => RecipeBySearch(defaultUser, "tacos")));
    //                         },
    //                         child: Flexible(
    //                           fit: FlexFit.tight,
    //                           child: Row(
    //                             mainAxisSize: MainAxisSize.min,
    //                             children: [
    //                               Icon(Icons.search_rounded, size: 20),
    //                               Padding(
    //                                 padding: const EdgeInsets.only(left: 10),
    //                                 child: Text("Search", style: TextStyle(fontSize: 16,),),
    //                               ),
    //                             ],
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                   ],
    //                 )
    //             );
    //           },
    //         ),
    //       )
    //     ],
    //   ),
    // );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        title: SizedBox(height: 33, child: Image.asset('assets/TastEZ_whitetext.png')),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Card(
            child: Column(
              children: [
                //SizedBox(width: 100, child: Image.asset('assets/Wine/WhiteWine/WhiteWineCategory.jpg')),
                ListTile(
                  leading: Image.asset(wineImage, fit: BoxFit.fitWidth,),
                  title: Text(title, style: pageTitleFont),
                  subtitle: Text(description + "\n"),
                ),
              ],
            ),
          ),
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: foodPairings.length,
              itemBuilder: (context, index){
                return Card(
                  child: Column(
                    children: [
                      foodPairings[index].image != "" ? Image.asset(foodPairings[index].image) : Image.asset('assets/TastEZ_logo.png'),
                      ListTile(
                        title: Text(foodPairings[index].name),
                        trailing: FlatButton.icon(
                          icon: Icon(Icons.search_rounded, color: Colors.black,),
                          label: Text("Search"),
                          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeBySearch(defaultUser, foodPairings[index].name, List.empty(), true))),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
