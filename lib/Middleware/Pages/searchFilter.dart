import 'package:tastez/GUI/Const.dart';
import 'package:tastez/Middleware/Pages/searchFilterList.dart';
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

  List<ChoiceChipData> choiceChips = ChoiceChips.all;

  /* Choice Chips, which are good for filters that require only one
  * selection. This is just a skeleton for now lol */
  Widget buildChoiceChips() =>
      ExpansionTile(
        title: Text(
          "Choice Chips",
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
                children: choiceChips
                    .map((choiceChip) => ChoiceChip(
                  label: Text(choiceChip.label),
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                  onSelected: (isSelected) => setState(() {
                    choiceChips = choiceChips.map((otherChip) {
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
      );

  // @override
  // Widget build(BuildContext context) {
  //
  //   /*-----First Button Attempt-----*/
  //   return Scaffold(
  //     appBar: AppBar(
  //       backgroundColor: themeColor,
  //       title: Title(
  //         color: Colors.white,
  //         child: Text("Filters"),
  //       ),
  //     ),
  //     body: Container(
  //       child: Wrap(
  //         children: [
  //           // Cook Times Filter
  //           ExpansionTile(
  //             title: Text(
  //               "Cook Times",
  //               style: TextStyle(
  //                 fontSize: 18.0,
  //                 fontWeight: FontWeight.bold,)
  //               ,
  //             ),
  //             children: [
  //               Container(
  //                 padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
  //                 child: Wrap(
  //                   direction: Axis.horizontal,
  //                   children: [
  //                     Container(
  //                       padding: EdgeInsets.only(top: 5.0,left: 10.0),
  //                       child: Align(
  //                         alignment: Alignment.topLeft,
  //                         child: RaisedButton(
  //                           padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 3.0),
  //                           elevation: 10.0,
  //                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
  //                           color: themeColor,
  //                           splashColor: Colors.white,
  //                           // disabledColor:Colors.grey
  //                           onPressed: (){
  //                             Text("Filter Selected in Cook Times");
  //                           }, // onPressed
  //                           child: Text("< 30 min", style: TextStyle(color: Colors.white, fontSize: 16.0)),
  //                         ),
  //                       ),
  //                     ), // END of Button
  //                     // Button in Cook Times Filter
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ], // children
  //       ),
  //     ),
  //   );
  // }

  Widget buildPages() {
    return buildChoiceChips();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: themeColor,
      title: Text("Filter Page Test", style: TextStyle(color: Colors.white, fontSize: 18.0)),
    ),
    body: Align(
      alignment: Alignment.topCenter,
      child: buildPages(),
    ),
  );
}