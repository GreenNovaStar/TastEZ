import 'package:flutter/material.dart';

import 'home.dart';
import 'main.dart';

import 'package:flutter/cupertino.dart';

Widget missingIngredient(){
  //List<bool> isMissing = [false, true, false, false, false];
  List<MissingIngredient> isMissing = [];

  //missing ingredients takes in a List<MissingIngredient> isMissing, and it will update the rest.
  isMissing.add(MissingIngredient(ingredient: "bread", hasInPantry: false));
  isMissing.add(MissingIngredient(ingredient: "cheese", hasInPantry: false));
  isMissing.add(MissingIngredient(ingredient: "milk", hasInPantry: false));
  isMissing.add(MissingIngredient(ingredient: "tomato", hasInPantry: false));
  isMissing.add(MissingIngredient(ingredient: "steak", hasInPantry: false));
  isMissing.add(MissingIngredient(ingredient: "bread2", hasInPantry: false));
  isMissing.add(MissingIngredient(ingredient: "cheese2", hasInPantry: false));
  isMissing.add(MissingIngredient(ingredient: "milk2", hasInPantry: false));
  isMissing.add(MissingIngredient(ingredient: "tomato2", hasInPantry: false));
  isMissing.add(MissingIngredient(ingredient: "steak2", hasInPantry: false));

  return MissingTemplate(isMissing: isMissing);
}

class MissingTemplate extends StatefulWidget {
  const MissingTemplate({
    Key key,
    @required this.isMissing,
  }) : super(key: key);

  // final List<bool> isMissing;
  final List<MissingIngredient> isMissing;

  @override
  _MissingTemplateState createState() => _MissingTemplateState();
}

class _MissingTemplateState extends State<MissingTemplate> {
  @override
  Widget build(BuildContext context) {
    return //Scaffold(
      // appBar: AppBar(
      //   title: Text('demo missing ingredients'),
      // ),
      // body:
      Container(
        child:
        ListView.builder(
          itemCount: widget.isMissing.length, //5, //automatically adjusts based on the widget array
          itemBuilder: (context, index) {
            return Card(
              child: Container(
                child: InkWell(
                  onTap: () {
                    print("card $index tapped");

                    setState(() {
                      if(widget.isMissing[index].hasInPantry){
                        // print("ingredient $index is not missing anymore");
                        // widget.isMissing[index] = false;
                        print("${widget.isMissing[index].ingredient} sent to shopping cart");
                        //send item to shopping cart
                      }else{
                        print("${widget.isMissing[index].ingredient} is now missing");
                        widget.isMissing[index].hasInPantry = true;
                      }
                    });
                    // setState(() {widget.isMissing[index] ? widget.isMissing[index] = false : widget.isMissing[index] = true;});
                  },

                  onLongPress: (){
                    setState(() {
                      if(widget.isMissing[index].hasInPantry){
                        print("ingredient ${widget.isMissing[index].ingredient} is not missing anymore");
                        widget.isMissing[index].hasInPantry = false;
                        //print("Ingredient sent to shopping cart");
                      }
                      print("${widget.isMissing[index].ingredient} was long pressed");
                    });

                  },

                  child: ListTile(
                    // title: (index % 3 == 0) ? Text("$index title missing", style: TextStyle(color: Colors.red[900])) : Text("$index title filler", style: TextStyle(color: Colors.black)), //replace text with favorite recipe name
                    //title: widget.isMissing[index] ? Text("$index title missing", style: TextStyle(color: Colors.red[900])) : Text("$index title filler", style: TextStyle(color: Colors.black)), //replace text with favorite recipe name
                    title: widget.isMissing[index].hasInPantry ? Text("${widget.isMissing[index].ingredient} missing", style: TextStyle(color: Colors.red[900])) : Text("${widget.isMissing[index].ingredient}", style: TextStyle(color: Colors.black)),
                    //leading: Image.asset('assets/nullimage.png'), //replace image with favorite recipe picture
                    // trailing: (index % 3 == 0) ? Icon(Icons.error_outline_rounded, color: Colors.red[900],) : null,
                    trailing: widget.isMissing[index].hasInPantry ? Icon(Icons.error_outline_rounded, color: Colors.red[900],) : null,
                  ),
                ),
              ),
            );
          },
        ),
      //),
    );
  }
}

class MissingIngredient{
  String ingredient;
  bool   hasInPantry;

  MissingIngredient({this.ingredient, this.hasInPantry});
}

// Widget missingIngredient(){
//   List<bool> isMissing = [false, false, false, false, false];
//   return Scaffold(
//     appBar: AppBar(
//       title: Text('demo missing ingredients'),
//     ),
//     body:
//     Container(
//       child:
//       ListView.builder(
//         itemCount: isMissing.length, //5, //replace 5 with the length of the favorites array
//         itemBuilder: (context, index) {
//           return Card(
//             child: Container(
//               child: InkWell(
//                 onTap: () {
//                   print("card $index tapped");
//                   //jump to recipe page
//                 },
//                 child: ListTile(
//                   // title: (index % 3 == 0) ? Text("$index title missing", style: TextStyle(color: Colors.red[900])) : Text("$index title filler", style: TextStyle(color: Colors.black)), //replace text with favorite recipe name
//                   title: isMissing[index] ? Text("$index title missing", style: TextStyle(color: Colors.red[900])) : Text("$index title filler", style: TextStyle(color: Colors.black)), //replace text with favorite recipe name
//                   leading: Image.asset('assets/nullimage.png'), //replace image with favorite recipe picture
//                   // trailing: (index % 3 == 0) ? Icon(Icons.error_outline_rounded, color: Colors.red[900],) : null,
//                   trailing: isMissing[index] ? Icon(Icons.error_outline_rounded, color: Colors.red[900],) : null,
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     ),
//   );
// }
