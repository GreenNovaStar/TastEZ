import 'package:tastez/Middleware/user.dart';
import 'package:tastez/pantry.list.dart';
import 'package:tastez/prefs.dart';

final User defaultUser = User(
  id: 0,                                    //id
  uuid: "ABCDEFG1234567",                     //uuid
  name: "John Smith",                         //name
  email: "example@aol.com",                    //email
  prefs: new Prefs(),
  pantry: new Pantry(
    cannedGoods: List.empty(growable: true),
    refrigerator: List.empty(growable: true),
    freezer: List.empty(growable: true),
    misc: List.empty(growable: true),
    meats: List.empty(growable: true),
    dairy: List.empty(growable: true),
    grainsNuts: List.empty(growable: true),
    specialty: List.empty(growable: true),
    drinks: List.empty(growable: true),
    snacks: List.empty(growable: true),
    produce: List.empty(growable: true),
    toppings: List.empty(growable: true),
    bakedGoods: List.empty(growable: true),
  ),
  favorites: List.empty(growable: true), //favorites
  shopping: List.empty(growable: true), //shopping list
  previousSearches: List.empty(growable: true), //previous searches
  searchFilter: List.empty(growable: true), //search filter
  webViewFavorites: Set<String>(),
);