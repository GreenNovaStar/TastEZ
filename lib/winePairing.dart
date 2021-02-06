import 'package:flutter/material.dart';
import 'package:tastez/shop.list.dart';
import 'home.dart';
import 'main.dart';
import 'user.dart';
import 'recipe.dart';
import 'package:flutter/cupertino.dart';
import 'shop.list.dart';

class WinePairingTemplate extends StatefulWidget {
  const WinePairingTemplate({
    Key key,
    @required this.recipe,
  }) : super(key: key);

  // final List<bool> isMissing;
  final RecipeElement recipe;
  @override
  _WinePairingState createState() => _WinePairingState();
}

class _WinePairingState extends State<WinePairingTemplate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        widget.recipe.winePairing.first,
      ),
    );
  }
}

Widget WinePairingCall(RecipeElement recipe) {
  return WinePairingTemplate(recipe: recipe);
}