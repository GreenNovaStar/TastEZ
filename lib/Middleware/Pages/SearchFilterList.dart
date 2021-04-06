import 'package:flutter/material.dart';

class searchFilterList{
  //RecipeElement recipe;
  String name; // name of the filter
  bool selected; // was item selected?

  // searchFilterList Constructor
  searchFilterList({this.name, this.selected});
} // END searchFilterList


// experimenting with Chips

/*----------Choice Chips----------*/
class ChoiceChipData {
  final String label;
  final bool isSelected;
  Color textColor;
  Color selectedColor;

  ChoiceChipData({
    @required this.label,
    @required this.isSelected,
    @required this.textColor,
    @required this.selectedColor,
  });

  ChoiceChipData copy({
    String label,
    bool isSelected,
    Color textColor,
    Color selectedColor,
  }) =>
      ChoiceChipData(
        label: label ?? this.label,
        isSelected: isSelected ?? this.isSelected,
        textColor: textColor ?? this.textColor,
        selectedColor: selectedColor ?? this.selectedColor,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ChoiceChipData &&
              runtimeType == other.runtimeType &&
              label == other.label &&
              isSelected == other.isSelected &&
              textColor == other.textColor &&
              selectedColor == other.selectedColor;

  @override
  int get hashCode =>
      label.hashCode ^
      isSelected.hashCode ^
      textColor.hashCode ^
      selectedColor.hashCode;
}


/*----------Filter Chips-----------*/
class FilterChipData {
  final String label;
  final String apiString;
  final Color color;
  final Color textColor;
  final bool isSelected;

  const FilterChipData({
    @required this.label,
    @required this.color,
    @required this.textColor,
    this.apiString,
    this.isSelected = false,
  });

  FilterChipData copy({
    String label,
    String apiString,
    Color color,
    bool isSelected,
  }) =>
      FilterChipData(
        label: label ?? this.label,
        apiString: apiString ?? this.apiString,
        color: color ?? this.color,
        textColor: color ?? this.textColor,
        isSelected: isSelected ?? this.isSelected,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is FilterChipData &&
              runtimeType == other.runtimeType &&
              label == other.label &&
              color == other.color &&
              isSelected == other.isSelected;

  @override
  int get hashCode => label.hashCode ^ color.hashCode ^ isSelected.hashCode;
}