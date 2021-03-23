import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tastez/GUI/Const.dart';
import 'package:tastez/GUI/Pages/ListOfWinesInCategory.dart';
import 'package:tastez/Middleware/Json%20Parsing/WineCategory.dart';
import 'package:tastez/Middleware/Json%20Parsing/WineConstants.dart';
import 'package:tastez/Middleware/Json%20Parsing/Wines.dart';
import 'package:tastez/Middleware/user.dart';

Widget DishPairing(User currUser){
  return DishPairingClass(currUser: currUser);
}

class DishPairingClass extends StatefulWidget {
  const DishPairingClass({
    Key key,
    @required this.currUser,
  }) : super(key: key);
  final User currUser;

  @override
  _DishPairingClassState createState() => _DishPairingClassState();
}

class _DishPairingClassState extends State<DishPairingClass> {
  List<String> data = List.generate(40, (index) => "index $index");

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    // return Scaffold(
    //   backgroundColor: subAccentColor,
    //   body: Stack(
    //       children: [
    //         Padding(
    //           padding: const EdgeInsets.symmetric(
    //             vertical: 20.0,
    //             horizontal: 5.0,
    //           ),
    //           child: GridView.builder(
    //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 20.0, crossAxisSpacing: 20.0),
    //             itemCount: wines.length,
    //             itemBuilder: (BuildContext context, int index){
    //               return InkWell(
    //                 onTap: (){
    //                   print("${wines[index].categoryName} category was pressed");
    //                   // print("Wine length is ${wines[index].wine.length} before add");
    //                   // wines[index].wine.add(testWine);
    //                   // print("Wine length is ${wines[index].wine.length} after add");
    //                   if(wines[index].wine.isEmpty){
    //                     ScaffoldMessenger.of(context).showSnackBar(
    //                       SnackBar(
    //                         backgroundColor: subAccentColor,
    //                         behavior: SnackBarBehavior.floating,
    //                         duration: Duration(seconds: 1,),
    //                         content: Text("No Wines Favorited,Start favoriting a wine today!", style: TextStyle(color: Colors.black,),),
    //                         action: SnackBarAction(
    //                           label: "Dismiss",
    //                           onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
    //                         ),
    //                       )
    //                     );
    //                   }else{
    //                     ScaffoldMessenger.of(context).removeCurrentSnackBar();
    //                     Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation1, animation2) => ListOfWinesInCategory(wine: wines[index].wine, controller: widget.controller), reverseTransitionDuration: Duration(seconds: 0),));
    //                   }
    //                 },
    //                 child: Card(
    //                   child: GridTile(
    //                     footer: Center(
    //                         child: Container(
    //                           child: Stack(
    //                             children: <Widget>[
    //                               // Stroked text as border.
    //                               Text(
    //                                 "${wines[index].categoryName}",
    //                                 style: GoogleFonts.sriracha(
    //                                   textStyle: TextStyle(
    //                                     fontSize: 23,
    //                                     foreground: Paint()
    //                                       ..style = PaintingStyle.stroke
    //                                       ..strokeWidth = 6
    //                                       ..color = Colors.black,
    //                                   ),
    //                                 ),
    //
    //                               ),
    //                               // Solid text as fill.
    //                               Text(
    //                                 "${wines[index].categoryName}",
    //                                 style: GoogleFonts.sriracha(
    //                                   textStyle: TextStyle(
    //                                     color: themeColor,
    //                                     fontSize: 23,
    //                                   ),
    //                                 ),
    //                               ),
    //                             ],
    //                           )
    //                           // child: Text(
    //                           //   "${wines[index].categoryName}",
    //                           //   style: GoogleFonts.sriracha(
    //                           //       textStyle: TextStyle(
    //                           //           color: themeColor,
    //                           //           fontSize: 23,
    //                           //       ),
    //                           //   ),
    //                           ),
    //                     ),
    //                     // child: Container(color: Colors.blueAccent,child: Image.asset("assets/TastEZ_logo.png")),
    //                     child: wines[index].image != "" ? Image.asset(wines[index].image) : Image.asset("assets/TastEZ_logo.png"),
    //                   ),
    //                 ),
    //               );
    //             },
    //           ),
    //         ),
    //       ]
    //   ),
    // );

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 20.0, crossAxisSpacing: 20.0),
      itemCount: wines.length,
      itemBuilder: (BuildContext context, int index){
        return InkWell(
          onTap: (){
            print("${wines[index].categoryName} category was pressed");
            // print("Wine length is ${wines[index].wine.length} before add");
            // wines[index].wine.add(testWine);
            // print("Wine length is ${wines[index].wine.length} after add");
            if(wines[index].wine.isEmpty){
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: subAccentColor,
                    behavior: SnackBarBehavior.floating,
                    duration: Duration(seconds: 5,),
                    content: Text("No Wines Favorited,Start favoriting a wine today!", style: TextStyle(color: Colors.black,),),
                    action: SnackBarAction(
                      label: "Dismiss",
                      onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
                    ),
                  )
              );
            }else{
              ScaffoldMessenger.of(context).removeCurrentSnackBar();
              Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation1, animation2) => ListOfWinesInCategory(wine: wines[index].wine, categoryName: wines[index].categoryName), reverseTransitionDuration: Duration(seconds: 0),));
            }
          },
          child: Card(
            child: GridTile(
              footer: Center(
                child: Container(
                    child: Stack(
                      children: <Widget>[
                        // Stroked text as border.
                        Text(
                          "${wines[index].categoryName}",
                          style: GoogleFonts.sriracha(
                            textStyle: TextStyle(
                              fontSize: 23,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 6
                                ..color = Colors.black,
                            ),
                          ),

                        ),
                        // Solid text as fill.
                        Text(
                          "${wines[index].categoryName}",
                          style: GoogleFonts.sriracha(
                            textStyle: TextStyle(
                              color: themeColor,
                              fontSize: 23,
                            ),
                          ),
                        ),
                      ],
                    )
                  // child: Text(
                  //   "${wines[index].categoryName}",
                  //   style: GoogleFonts.sriracha(
                  //       textStyle: TextStyle(
                  //           color: themeColor,
                  //           fontSize: 23,
                  //       ),
                  //   ),
                ),
              ),
              // child: Container(color: Colors.blueAccent,child: Image.asset("assets/TastEZ_logo.png")),
              child: wines[index].image != "" ? Image.asset(wines[index].image) : Image.asset("assets/TastEZ_logo.png"),
            ),
          ),
        );
      },
    );
  }
}
