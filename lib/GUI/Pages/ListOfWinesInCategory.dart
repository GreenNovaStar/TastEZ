import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tastez/GUI/AppBar/CurvyAppBar.dart';
import 'package:tastez/GUI/BottomNavigationBar/CurvyBottomNavigationBar.dart';
import 'package:tastez/GUI/Const.dart';
import 'package:tastez/GUI/Pages/DetailedWinePage.dart';
import 'package:tastez/Middleware/Json%20Parsing/WineConstants.dart';
import 'package:tastez/Middleware/Json%20Parsing/Wines.dart';
import 'package:tastez/Middleware/TestingConst/DefaultUser.dart';
import 'package:tastez/Middleware/TestingConst/NavigatorConst.dart';

class ListOfWinesInCategory extends StatefulWidget {

  List<Wines> wine;
  PageController controller;
  String categoryName;
  ListOfWinesInCategory({this.wine, this.controller, this.categoryName});

  @override
  _ListOfWinesInCategoryState createState() => _ListOfWinesInCategoryState();
}

class _ListOfWinesInCategoryState extends State<ListOfWinesInCategory> {

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    // return Scaffold(
    //   appBar: PreferredSize(preferredSize: Size(size.width, 100),
    //           child: CurvyAppBar(size: size,
    //           onLogoPressed: () {
    //             print("logo pressed");
    //           },),),
    //   body: GridView.builder(
    //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 20.0, crossAxisSpacing: 20.0),
    //     itemCount: widget.wine.length,
    //     itemBuilder: (BuildContext context, int index){
    //       return InkWell(
    //         onTap: (){
    //           print("${widget.wine[index].name} was pressed");
    //           Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation1, animation2) => DetailedWinePage(title: widget.wine[index].name, description: widget.wine[index].description, foodPairings: widget.wine[index].foodPairings,), reverseTransitionDuration: Duration(seconds: 0),));
    //         },
    //         child: Card(
    //           child: GridTile(
    //             header: Align(
    //               alignment: Alignment.centerRight,
    //               child: IconButton(
    //                 onPressed: (){
    //                   setState(() {
    //                     if(wines[0].wine.contains(widget.wine[index])){
    //                       print("Wine already favorited");
    //                     }else{
    //                       wines[0].wine.add(widget.wine[index]);
    //                     }
    //                   });
    //                 },
    //                 icon: wines[0].wine.contains(widget.wine[index]) ? Icon(Icons.favorite_rounded, color: Colors.red,) : Icon(Icons.favorite_border_rounded, color: Colors.red,),
    //               ),
    //             ),
    //             footer: Center(
    //               child: Container(
    //                   child: Stack(
    //                     children: widget.wine[index].name.length > 16 ?
    //                     <Widget>[
    //                       // Stroked text as border.
    //                       Text(
    //                         "${widget.wine[index].name}",
    //                         style: GoogleFonts.sriracha(
    //                           textStyle: TextStyle(
    //                             fontSize: 19,
    //                             foreground: Paint()
    //                               ..style = PaintingStyle.stroke
    //                               ..strokeWidth = 6
    //                               ..color = Colors.black,
    //                           ),
    //                         ),
    //
    //                       ),
    //                       // Solid text as fill.
    //                       Text(
    //                         "${widget.wine[index].name}",
    //                         style: GoogleFonts.sriracha(
    //                           textStyle: TextStyle(
    //                             color: themeColor,
    //                             fontSize: 19,
    //                           ),
    //                         ),
    //                       ),
    //                     ]:
    //                     <Widget>[
    //                       // Stroked text as border.
    //                       Text(
    //                         "${widget.wine[index].name}",
    //                         style: GoogleFonts.sriracha(
    //                           textStyle: TextStyle(
    //                             fontSize: 23,
    //                             foreground: Paint()
    //                               ..style = PaintingStyle.stroke
    //                               ..strokeWidth = 6
    //                               ..color = Colors.black,
    //                           ),
    //                         ),
    //
    //                       ),
    //                       // Solid text as fill.
    //                       Text(
    //                         "${widget.wine[index].name}",
    //                         style: GoogleFonts.sriracha(
    //                           textStyle: TextStyle(
    //                             color: themeColor,
    //                             fontSize: 23,
    //                           ),
    //                         ),
    //                       ),
    //                     ],
    //                   )
    //               ),
    //             ),
    //             // child: Container(color: Colors.blueAccent,child: Image.asset("assets/TastEZ_logo.png")),
    //             child: widget.wine[index].image != "" ? Image.asset(widget.wine[index].image) : Image.asset("assets/TastEZ_logo.png"),
    //           ),
    //         ),
    //       );
    //     },
    //   ),
    //   bottomNavigationBar: CurvyBottomNavigationBar(
    //     currUser: defaultUser,
    //   ),
    // );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        title: Text(widget.categoryName),
        centerTitle: true,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 20.0, crossAxisSpacing: 20.0),
        itemCount: widget.wine.length,
        itemBuilder: (BuildContext context, int index){
          return GestureDetector(
            onTap: (){
              print("${widget.wine[index].name} was pressed");
              return Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation1, animation2) => DetailedWinePage(title: widget.wine[index].name, description: widget.wine[index].description, foodPairings: widget.wine[index].foodPairings, wineImage: widget.wine[index].image), reverseTransitionDuration: Duration(seconds: 0),));
              // return Navigator.pushNamed(context, '/detailedWinePage');

            },
            child: Card(
              child: GridTile(
                header: Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: (){
                      setState(() {
                        if(wines[0].wine.contains(widget.wine[index])){
                          print("Wine already favorited");
                        }else{
                          wines[0].wine.add(widget.wine[index]);
                        }
                      });
                    },
                    icon: wines[0].wine.contains(widget.wine[index]) ? Icon(Icons.favorite_rounded, color: Colors.red,) : Icon(Icons.favorite_border_rounded, color: Colors.red,),
                  ),
                ),
                footer: Center(
                  child: Container(
                      child: Stack(
                        children: widget.wine[index].name.length > 16 ?
                        <Widget>[
                          // Stroked text as border.
                          Text(
                            "${widget.wine[index].name}",
                            style: GoogleFonts.dancingScript(
                              textStyle: TextStyle(
                                fontSize: 19,
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 6
                                  ..color = Colors.black,
                              ),
                            ),

                          ),
                          // Solid text as fill.
                          Text(
                            "${widget.wine[index].name}",
                            style: GoogleFonts.dancingScript(
                              textStyle: TextStyle(
                                color: themeColor,
                                fontSize: 19,
                              ),
                            ),
                          ),
                        ]:
                        <Widget>[
                          // Stroked text as border.
                          Text(
                            "${widget.wine[index].name}",
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
                            "${widget.wine[index].name}",
                            style: GoogleFonts.sriracha(
                              textStyle: TextStyle(
                                color: themeColor,
                                fontSize: 23,
                              ),
                            ),
                          ),
                        ],
                      )
                  ),
                ),
                // child: Container(color: Colors.blueAccent,child: Image.asset("assets/TastEZ_logo.png")),
                child: widget.wine[index].image != "" ? Image.asset(widget.wine[index].image) : Image.asset("assets/TastEZ_logo.png"),
              ),
            ),
          );
        },
      ),
    );
  }
}
