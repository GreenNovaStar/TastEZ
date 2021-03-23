// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:tastez/Middleware/Pages/MissingIngredient.dart';
// import 'package:tastez/Middleware/Pages/ShoppingListElement.dart';
//
// import '../../Middleware/Pages/missing.ingredients.dart';
// import '../../Middleware/user.dart';
//
// List<MissingIngredient> isMissing;
// User currUser;
//
// ListView MissingIngredientGUI(List<MissingIngredient> isMissing, User currUser) {
//   return ListView.builder(
//     itemCount: isMissing.length, //5, //automatically adjusts based on the widget array
//     scrollDirection: Axis.vertical,
//     shrinkWrap: true,
//     controller: ScrollController(),
//     itemBuilder: (context, index) {
//       return Card(
//         child: Container(
//           child: InkWell(
//             onTap: () {
//               //print("card $index tapped");
//                 if(!isMissing[index].hasInPantry && !isMissing[index].hasInCart){
//                   print("im in here");
//                   currUser.shopping.add(ShoppingListElement(ingredient: isMissing[index].ingredient, crossedOff: false));
//                   isMissing[index].hasInCart = true;
//                 }
//             },
//
//             onLongPress: (){
//                 if(isMissing[index].hasInCart){
//                   int indexToRemove = isInCartIndex(currUser.shopping, isMissing[index].ingredient);
//                   currUser.shopping.removeAt(indexToRemove);
//                   // widget.currUser.shopping.remove(ShoppingListElement(ingredient: widget.isMissing[index].ingredient, crossedOff: false));
//                   isMissing[index].hasInCart = false;
//                 }
//             },
//
//             child: ListTile(
//               // title: !widget.isMissing[index].hasInPantry ? Text("${widget.isMissing[index].ingredient} missing", style: TextStyle(color: Colors.red[900])) : Text("${widget.isMissing[index].ingredient}", style: TextStyle(color: Colors.black)),
//               // trailing: !widget.isMissing[index].hasInPantry ? Icon(Icons.error_outline_rounded, color: Colors.red[900],) : null,
//               title: (!isMissing[index].hasInPantry) ?
//               (!isMissing[index].hasInCart ? Text("${isMissing[index].ingredient} missing", style: TextStyle(color: Colors.red[900])) : Text("${isMissing[index].ingredient}", style: TextStyle(color: Colors.red[900]))) :
//               Text("${isMissing[index].ingredient}", style: TextStyle(color: Colors.black)),
//               trailing:(!isMissing[index].hasInPantry) ?
//               (!isMissing[index].hasInCart ? Icon(Icons.error_outline_rounded, color: Colors.red[900]) :Icon(Icons.add_shopping_cart_rounded, color: Colors.red[900])) :
//               null,
//             ),
//           ),
//         ),
//       );
//     },
//   );
// }