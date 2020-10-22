import 'package:flutter/material.dart';
import 'package:tastez/SelectIngredients.dart';
import 'home.dart';
import 'SelectIngredients.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

// final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

// Widget pantry() {
//   return Container(
//     //padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
//     //margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
//     margin: EdgeInsets.fromLTRB(10, 15, 10, 0),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         topButton(),
//         SizedBox(height: 7.0),
//         bottomButton(),
//         SizedBox(height: 5.0),
//       ],
//     ),
//   );
// }

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

// Widget topButton(){
//   return FlatButton(
//     color: Colors.blue,
//     textColor: Colors.white,
//     disabledColor: Colors.grey,
//     disabledTextColor: Colors.black,
//     padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//     splashColor: Colors.blueAccent,
//     onPressed: () {
//       //SelectIngredients();
//       print("Select ingredients is pressed");
//       // Navigator.push(context, MaterialPageRoute(builder: (context) => SelectIngredients()));
//     },
//     child: Text(
//       "Select Ingredients",
//       style: TextStyle(fontSize: 20.0),
//     ),
//   );
// }



// Widget bottomButton(){
//   return FlatButton(
//     color: Colors.blue,
//     textColor: Colors.white,
//     disabledColor: Colors.grey,
//     disabledTextColor: Colors.black,
//     padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//     splashColor: Colors.blueAccent,
//     onPressed: () {
//       print("Suggested Recipes is pressed");
//     },
//     child: Text(
//       "Suggested Recipes",
//       style: TextStyle(fontSize: 20.0),
//     ),
//   );
// }

Widget pantry(){
    //dairy
    return Container(
      child:
          ListView(children: [
            Container(
              padding: const EdgeInsets.only(left: 14.0, top: 14.0),
              child: Text("Dairy",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0
                ),
              ),
            ),
            CheckboxGroup( //dairy
              labels: <String>[
                "Milk",
                "Butter",
                "Buttermilk",
                "Cheese",
                "Cream",
                "Crème Fraiche",
                "Egg",
                "Ghee",
                "Half and Half",
                "Sour Cream",
                "Yogurt",
              ],
              onChange: (bool isChecked, String label, int index) => print("isChecked: $isChecked   label: $label  index: $index"),
              onSelected: (List<String> checked) => print("checked: ${checked.toString()}"),
            ),
            Container(
              padding: const EdgeInsets.only(left: 14.0, top: 14.0),
              child: Text("Meat and Poultry",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0
                ),
              ),
            ),
            CheckboxGroup(
              labels: <String>[
                "Bacon",
                "Beef",
                "Bison",
                "Chicken",
                "Chorizo",
                "Cornish Hen",
                "Duck",
                "Foie Gras",
                "Giblets",
                "Goat",
                "Ham",
                "Hot Dog",
                "Kidney",
                "Lamb",
                "Liver",
                "Mutton",
                "Organ Meat",
                "Panchetta",
                "Pastrami",
                "Pepperoni",
                "Pork",
                "Prosciutto",
                "Quail",
                "Rabbit",
                "Salami",
                "Sausage",
                "Tongue",
                "Tripe",
                "Turkey",
                "Veal",
                "Venison",
              ],
              disabled: [
                "Bison",
              ],
              onChange: (bool isChecked, String label, int index) => print("isChecked: $isChecked   label: $label  index: $index"),
              onSelected: (List<String> checked) => print("checked: ${checked.toString()}"),
            ),
            Container(
              padding: const EdgeInsets.only(left: 14.0, top: 14.0),
              child: Text("Herbs and Spices",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0
                ),
              ),
            ),
            CheckboxGroup(
              labels: <String>[
                "Allspice",
                "Annatto",
                "Asafoetida",
                "Basil",
                "Bay Leaf",
                "Black Salt",
                "Caraway",
                "Cardamon",
                "Celery Seed",
                "Chervil",
                "Chicory",
                "Chili Powder",
                "Cilantro",
                "Cinnamon",
                "Coriander",
                "Culantro",
                "Cumin",
                "Dill",
                "Fennel",
                "Fenugreek",
                "Galangal",
                "Garlic",
                "Garlic Powder",
                "Ginger",
                "Green Onion",
                "Juniper Berry",
                "Lemongrass",
                "Mint",
                "Mixed Spice",
                "MSG",
                "Mustard",
                "Nutmeg",
                "Oregano",
                "Paprika",
                "Parsley",
                "Pepper",
                "Rosemary",
                "Saffron",
                "Sage",
                "Serrano Chili",
                "Star Anise",
                "Szechuan Pepper",
                "Tamarind",
                "Tarragon",
                "Thyme",
                "Tumeric",
                "Vanilla",
                "Wasabi",
                "Zhug",
              ],
              disabled: [
                "Bison",
              ],
              onChange: (bool isChecked, String label, int index) => print("isChecked: $isChecked   label: $label  index: $index"),
              onSelected: (List<String> checked) => print("checked: ${checked.toString()}"),
            ),
          ],)

    );
}