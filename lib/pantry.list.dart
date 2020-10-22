import 'package:flutter/material.dart';
import 'package:tastez/SelectIngredients.dart';
import 'home.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Widget pantry() {
  return Container(
    //padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
    //margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
    margin: EdgeInsets.fromLTRB(10, 15, 10, 0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        topButton(),
        SizedBox(height: 7.0),
        bottomButton(),
        SizedBox(height: 5.0),
      ],
    ),
  );
}

// Widget buttonTemplate(text, ){
//   return FlatButton(
//     color: Colors.blue,
//     textColor: Colors.white,
//     disabledColor: Colors.grey,
//     disabledTextColor: Colors.black,
//     padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//     splashColor: Colors.blueAccent,
//     onPressed: () {
//       /*...*/
//     },
//     child: Text(
//       '$text',
//       style: TextStyle(fontSize: 20.0),
//     ),
//   );
// }

Widget topButton(){
  return FlatButton(
    color: Colors.blue,
    textColor: Colors.white,
    disabledColor: Colors.grey,
    disabledTextColor: Colors.black,
    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
    splashColor: Colors.blueAccent,
    onPressed: () {
      Navigator.push(MaterialPageRoute(builder: (context) => SelectIngredients());
      ));
    },
    child: Text(
      "Select Ingredients",
      style: TextStyle(fontSize: 20.0),
    ),
  );
}

Widget bottomButton(){
  return FlatButton(
    color: Colors.blue,
    textColor: Colors.white,
    disabledColor: Colors.grey,
    disabledTextColor: Colors.black,
    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
    splashColor: Colors.blueAccent,
    onPressed: () {
      /*...*/
    },
    child: Text(
      "Suggested Recipes",
      style: TextStyle(fontSize: 20.0),
    ),
  );
}