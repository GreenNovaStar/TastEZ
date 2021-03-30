import 'package:tastez/GUI/Const.dart';
import 'package:tastez/Middleware/Pages/SearchFilterList.dart';
import 'package:tastez/Middleware/Pages/searchFilterData.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';



class searchFilter extends StatefulWidget {

  // variables
  // list of filters
  final List<searchFilterList> filterCookTime;
  final List<searchFilterList> filterAllergies;
  final List<searchFilterList> filterDiets;
  final List<searchFilterList> filterCuisines;

  // Chip List Experiment
  // List<ChoiceChipData> choiceChips = ChoiceChip.all;

  // final constructor
  const searchFilter({
    Key key,
    this.filterCookTime, this.filterAllergies, this.filterDiets, this.filterCuisines
  }) : super(key: key);

  @override
  _searchFilterState createState() => _searchFilterState();
}

class _searchFilterState extends State<searchFilter> {

  List<ChoiceChipData> choiceChipsType = ChoiceChipsType.all;
  List<FilterChipData> filterChipsAllergies = FilterChipsAllergies.all;
  List<FilterChipData> filterChipsDiets = FilterChipsDiets.all;
  List<FilterChipData> filterChipsCuisines = FilterChipsCuisines.all;

  get index => null;


  /*----- Food Type Choice Chip Widget -----*/
  /* Used for food Course, such as "dessert". Spoonacular uses query "type"
  * only one option can be chosen, so using Choice Chips. */
  Widget buildChoiceChipsType() =>
      ExpansionTile(
        title: Text(
          "Courses",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        children: [
          Container(
            padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Wrap(
                runSpacing: 1.0,
                spacing: 5.0,
                children: choiceChipsType
                    .map((choiceChip) => ChoiceChip(
                  label: Text(choiceChip.label),
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                  onSelected: (isSelected) => setState(() {
                    choiceChipsType = choiceChipsType.map((otherChip) {
                      final newChip = otherChip.copy(isSelected: false);

                      return choiceChip == newChip
                          ? newChip.copy(isSelected: isSelected)
                          : newChip;
                    }).toList();
                  }),
                  selected: choiceChip.isSelected,
                  selectedColor: accentColor,
                  backgroundColor: Colors.grey[500],
                ))
                    .toList(),
              ),
            ),
          ),
        ],
      ); //END Choice Chip Widget


  /* Filter Chips. User can select multiple items. This will be used for
  * allergies and filters such as that */

  /*-----Allergies Filter Chips Widget-----*/
  /* Uses query "Intolerance" when searching Spoonacular */
  Widget buildFilterChipsAllergies() =>
      ExpansionTile(
        title: Text(
          "Allergies",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ), // Expansion Tile Title
        children: [
          Container(
            padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Wrap(
                runSpacing: 1.0,
                spacing: 5.0,
                children: filterChipsAllergies
                    .map((filterChip) => FilterChip(
                  label: Text(filterChip.label),
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: filterChip.textColor,
                  ),
                  backgroundColor: filterChip.color,
                  onSelected: (isSelected) => setState(() {
                    filterChipsAllergies = filterChipsAllergies.map((otherChip) {
                      return filterChip == otherChip
                          ? otherChip.copy(isSelected: isSelected)
                          : otherChip;
                    }).toList();
                  }),
                  selected: filterChip.isSelected,
                  checkmarkColor: filterChip.textColor,
                  selectedColor: accentColor,
                  // textColor: filterChip.textColor,
                ))
                    .toList(),
              ),
            ),
          ),
        ], // ExpansionTile Children
      ); // END FilterChipsAllergies Widget

  /*-----Diets Filter Chips Widget-----*/
  /* Uses query "diet" when searching Spoonacular */
  Widget buildFilterChipsDiets() =>
      ExpansionTile(
        title: Text(
          "Diets",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ), // Expansion Tile Title
        children: [
          Container(
            padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Wrap(
                runSpacing: 1.0,
                spacing: 5.0,
                children: filterChipsDiets
                    .map((filterChip) => FilterChip(
                  label: Text(filterChip.label),
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: filterChip.textColor,
                  ),
                  backgroundColor: filterChip.color,
                  onSelected: (isSelected) => setState(() {
                    filterChipsDiets = filterChipsDiets.map((otherChip) {
                      return filterChip == otherChip
                          ? otherChip.copy(isSelected: isSelected)
                          : otherChip;
                    }).toList();
                  }),
                  selected: filterChip.isSelected,
                  checkmarkColor: filterChip.textColor,
                  selectedColor: accentColor,
                  // textColor: filterChip.textColor,
                ))
                    .toList(),
              ),
            ),
          ),
        ], // ExpansionTile Children
      ); // END FilterChipsDiets Widget

  Widget buildFilterChipsCuisines() =>
      ExpansionTile(
        title: Text(
          "Cuisines",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ), // Expansion Tile Title
        children: [
          Container(
            padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Wrap(
                runSpacing: 1.0,
                spacing: 5.0,
                children: filterChipsCuisines
                    .map((filterChip) => FilterChip(
                  label: Text(filterChip.label),
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: filterChip.textColor,
                  ),
                  backgroundColor: filterChip.color,
                  onSelected: (isSelected) => setState(() {
                    filterChipsCuisines = filterChipsCuisines.map((otherChip) {
                      return filterChip == otherChip
                          ? otherChip.copy(isSelected: isSelected)
                          : otherChip;
                    }).toList();
                  }),
                  selected: filterChip.isSelected,
                  checkmarkColor: filterChip.textColor,
                  selectedColor: accentColor,
                  // textColor: filterChip.textColor,
                ))
                    .toList(),
              ),
            ),
          ),
        ], // ExpansionTile Children
      );

  Widget buildApplyButton() =>
      RaisedButton.icon(
        onPressed: (){
          print("Apply Filters Button Pressed");
          // choiceChipsType[0].isSelected == true ? print(choiceChipsType[0].label) : print("Choice 0 is not selected");
          // choiceChipsType.map((index) {
          //   // index.isSelected == true ? print(index.label + ",") : print("");
          //   print("${index.label},");
          // });

          //prints the allergies
          print("Selected Allergies:");
          for(int i = 0; i < filterChipsAllergies.length; i++){
            if(filterChipsAllergies[i].isSelected){
              print("\t${filterChipsAllergies[i].label} is selected");
            }else{
              //print("\t${filterChipsAllergies[i].label} is not selected");
            }
          }

          //prints the diets
          print("Selected Diets:");
          for(int i = 0; i < filterChipsDiets.length; i++){
            if(filterChipsDiets[i].isSelected){
              print("\t${filterChipsDiets[i].label} is selected");
            }else{
              //print("\t${filterChipsDiets[i].label} is not selected");
            }
          }

          // prints the label for Courses
          print("Selected Courses:");
          for(int i = 0; i < choiceChipsType.length; i++){
            if(choiceChipsType[i].isSelected){
              print("\t${choiceChipsType[i].label} is selected");
            }else{
              //print("\t${choiceChipsType[i].label} is not selected");
            }
          }

          // prints the label for Cuisines
          print("Selected Cuisines:");
          for(int i = 0; i < filterChipsCuisines.length; i++){
            if(filterChipsCuisines[i].isSelected){
              print("\t${filterChipsCuisines[i].label} is selected");
            }else{
              //print("\t${filterChipsCuisines[i].label} is not selected");
            }
          }

        }, // END onPressed
        icon: Icon(
          Icons.filter_alt_rounded,
        ),
        label: Text("Apply", style: TextStyle(fontSize: 18.0)),
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        color: themeColor,
      );



  /*----- Build Page GUI -----*/
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: subAccentColor,
    appBar: AppBar(
      backgroundColor: themeColor,
      title: Text("Filter Page Test", style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold)),
    ),
    body: Stack(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: ListView(
            children: [
              // call each widget in order displayed
              buildFilterChipsAllergies(),
              buildFilterChipsDiets(),
              buildChoiceChipsType(),
              buildFilterChipsCuisines(),
            ], // children for ListView
          ),
        ),
        // Display Apply Button on the page
        Container(
          padding: EdgeInsets.only(right: 25.0, bottom: 25.0),
          child: Align(
              alignment: Alignment.bottomRight,
              child: buildApplyButton()
          ),
        ),
      ], // children for Stack
    ),
  );
}
