import 'package:tastez/Middleware/Pages/SearchFilterList.dart';
import 'package:flutter/material.dart';

import 'package:tastez/GUI/Const.dart';


/*----------Choice Chips Data----------*/
class ChoiceChipsType {
  static final all = <ChoiceChipData>[
    ChoiceChipData(
      label: 'Appetizer',
      isSelected: false,
      selectedColor: unselectedFilterColor,
      textColor: Colors.white,
    ),
    ChoiceChipData(
      label: 'Bread',
      isSelected: false,
      selectedColor: unselectedFilterColor,
      textColor: Colors.white,
    ),
    ChoiceChipData(
      label: 'Breakfast',
      isSelected: false,
      selectedColor: unselectedFilterColor,
      textColor: Colors.white,
    ),
    ChoiceChipData(
      label: 'Beverage',
      isSelected: false,
      selectedColor: unselectedFilterColor,
      textColor: Colors.white,
    ),
    ChoiceChipData(
      label: 'Dessert',
      isSelected: false,
      selectedColor: unselectedFilterColor,
      textColor: Colors.white,
    ),
    ChoiceChipData(
      label: 'Main Course',
      isSelected: false,
      selectedColor: unselectedFilterColor,
      textColor: Colors.white,
    ),
    ChoiceChipData(
      label: 'Salad',
      isSelected: false,
      selectedColor: unselectedFilterColor,
      textColor: Colors.white,
    ),
    ChoiceChipData(
      label: 'Sauce',
      isSelected: false,
      selectedColor: unselectedFilterColor,
      textColor: Colors.white,
    ),
    ChoiceChipData(
      label: 'Side Dish',
      isSelected: false,
      selectedColor: unselectedFilterColor,
      textColor:  Colors.white,
    ),
    ChoiceChipData(
      label: 'Soup',
      isSelected: false,
      selectedColor: unselectedFilterColor,
      textColor: Colors.white,
    ),
  ];
}


/*----------Filter Chips Data Allergies----------*/
class FilterChipsAllergies {

  static final all = <FilterChipData>[
    FilterChipData(
      label: 'Dairy-Free',
      apiString: 'dairy',
      isSelected: false,
      color: unselectedFilterColor,
      textColor: Colors.white,
    ),
    FilterChipData(
      label: 'Egg-Free',
      apiString: 'egg',
      isSelected: false,
      color: unselectedFilterColor,
      textColor: Colors.white,
    ),
    FilterChipData(
      label: 'Gluten-Free',
      apiString: 'gluten',
      isSelected: false,
      color: unselectedFilterColor,
      textColor: Colors.white,
    ),
    FilterChipData(
      label: 'Peanut-Free',
      apiString: 'peanut',
      isSelected: false,
      color: unselectedFilterColor,
      textColor: Colors.white,
    ),
    FilterChipData(
      label: 'Seafood-Free',
      apiString: 'seafood',
      isSelected: false,
      color: unselectedFilterColor,
      textColor: Colors.white,
    ),
    FilterChipData(
      label: 'Sesame-Free',
      apiString: 'sesame',
      isSelected: false,
      color: unselectedFilterColor,
      textColor: Colors.white,
    ),
    FilterChipData(
      label: 'Soy-Free',
      apiString: 'soy',
      isSelected: false,
      color: unselectedFilterColor,
      textColor: Colors.white,
    ),
    FilterChipData(
      label: 'Tree Nut-Free',
      apiString: 'tree nut',
      isSelected: false,
      color: unselectedFilterColor,
      textColor: Colors.white,
    ),
    FilterChipData(
      label: 'Sulfite-Free',
      apiString: 'sulfite',
      isSelected: false,
      color: unselectedFilterColor,
      textColor: Colors.white,
    ),
    FilterChipData(
      label: 'Wheat-Free',
      apiString: 'wheat',
      isSelected: false,
      color: unselectedFilterColor,
      textColor: Colors.white,
    ),
  ];
} // END FilterChipsAllergies


/*-----FilterChips Data for Diets-----*/
class FilterChipsDiets {

  static final all = <FilterChipData>[
    FilterChipData(
      label: 'Pescetarian',
      isSelected: false,
      color: unselectedFilterColor,
      textColor: Colors.white,
    ),
    FilterChipData(
      label: 'Lacto Vegetarian',
      isSelected: false,
      color: unselectedFilterColor,
      textColor: Colors.white,
    ),
    FilterChipData(
      label: 'Ovo Vegetarian',
      isSelected: false,
      color: unselectedFilterColor,
      textColor: Colors.white,
    ),
    FilterChipData(
      label: 'Vegan',
      isSelected: false,
      color: unselectedFilterColor,
      textColor: Colors.white,
    ),
    FilterChipData(
      label: 'Paleo',
      isSelected: false,
      color: unselectedFilterColor,
      textColor: Colors.white,
    ),
    FilterChipData(
      label: 'Primal',
      isSelected: false,
      color: unselectedFilterColor,
      textColor: Colors.white,
    ),
    FilterChipData(
      label: 'Vegetarian',
      isSelected: false,
      color: unselectedFilterColor,
      textColor: Colors.white,
    ),
  ];
} // END FilterChipsDiets

/*-----FilterChips Data for Diets-----*/
class FilterChipsCuisines {

  static final all = <FilterChipData>[
    FilterChipData(
      label: 'African',
      isSelected: false,
      color: unselectedFilterColor,
      textColor: Colors.white,
    ),
    FilterChipData(
      label: 'Chinese',
      isSelected: false,
      color: unselectedFilterColor,
      textColor: Colors.white,
    ),
    FilterChipData(
      label: 'Japanese',
      isSelected: false,
      color: unselectedFilterColor,
      textColor: Colors.white,
    ),
    FilterChipData(
      label: 'Korean',
      isSelected: false,
      color: unselectedFilterColor,
      textColor: Colors.white,
    ),
    FilterChipData(
      label: 'Vietnamese',
      isSelected: false,
      color: unselectedFilterColor,
      textColor: Colors.white,
    ),
    FilterChipData(
      label: 'Thai',
      isSelected: false,
      color: unselectedFilterColor,
      textColor: Colors.white,
    ),
    FilterChipData(
      label: 'Indian',
      isSelected: false,
      color: unselectedFilterColor,
      textColor: Colors.white,
    ),
    FilterChipData(
      label: 'French',
      isSelected: false,
      color: unselectedFilterColor,
      textColor: Colors.white,
    ),
    FilterChipData(
      label: 'Italian',
      isSelected: false,
      color: unselectedFilterColor,
      textColor: Colors.white,
    ),
    FilterChipData(
      label: 'Mexican',
      isSelected: false,
      color: unselectedFilterColor,
      textColor: Colors.white,
    ),
    FilterChipData(
      label: 'Spanish',
      isSelected: false,
      color: unselectedFilterColor,
      textColor: Colors.white,
    ),
    FilterChipData(
      label: 'Middle Eastern',
      isSelected: false,
      color: unselectedFilterColor,
      textColor: Colors.white,
    ),
    FilterChipData(
      label: 'Jewish',
      isSelected: false,
      color: unselectedFilterColor,
      textColor: Colors.white,
    ),
    FilterChipData(
      label: 'American',
      isSelected: false,
      color: unselectedFilterColor,
      textColor: Colors.white,
    ),
    FilterChipData(
      label: 'Cajun',
      isSelected: false,
      color: unselectedFilterColor,
      textColor: Colors.white,
    ),
    FilterChipData(
      label: 'Southern',
      isSelected: false,
      color: unselectedFilterColor,
      textColor: Colors.white,
    ),
    FilterChipData(
      label: 'Greek',
      isSelected: false,
      color: unselectedFilterColor,
      textColor: Colors.white,
    ),
    FilterChipData(
      label: 'German',
      isSelected: false,
      color: unselectedFilterColor,
      textColor: Colors.white,
    ),
    FilterChipData(
      label: 'Nordic',
      isSelected: false,
      color: unselectedFilterColor,
      textColor: Colors.white,
    ),
    FilterChipData(
      label: 'Eastern European',
      isSelected: false,
      color: unselectedFilterColor,
      textColor: Colors.white,
    ),
    FilterChipData(
      label: 'Caribbean',
      isSelected: false,
      color: unselectedFilterColor,
      textColor: Colors.white,
    ),
    FilterChipData(
      label: 'Latin American',
      isSelected: false,
      color: unselectedFilterColor,
      textColor: Colors.white,
    ),
  ];
} // END FilterChipsCuisines