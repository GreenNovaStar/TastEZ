import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tastez/GUI/Const.dart';
import 'package:tastez/Middleware/API Parsing/RecipeElement.dart';
import 'package:tastez/Middleware/API Parsing/WinePairing/ProductMatches.dart';
import 'package:tastez/Middleware/API Parsing/WinePairing/WinePairing.dart';
import 'package:tastez/Middleware/API%20Parsing/spoonacular.dart';
import 'recipe.dart';
import 'package:flutter/cupertino.dart';
import 'shop.list.dart';
import 'package:url_launcher/url_launcher.dart';

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

int index;

class _WinePairingState extends State<WinePairingTemplate> {
  final Dio spoon = new Dio(Spoonacular.getBaseOptions());
  Response spoonResp;
  WinePairing ret = WinePairing();

  @override
  Widget build(BuildContext context) {
    if (widget.recipe.cuisines.isNotEmpty && widget.recipe.getWinePairing()) {
      print("Recipe has provided a wine pairing.");
      return SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
            children: [
              Card(
                child: ListTile(
                  title: Text(widget.recipe.winePairing.pairingText),
                ),
              ),
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: widget.recipe.winePairing.pairedWines.length,
                  itemBuilder: (context, i) {
                    return Card(
                      color: subAccentColor,
                      elevation: 0.2,
                      child: ListTile(
                        title: Text(
                            widget.recipe.winePairing.pairedWines.elementAt(i).toString()),
                        leading: (widget.recipe.winePairing.productMatches.imageUrl.toString() != "" && widget.recipe.winePairing.productMatches.imageUrl.toString() != "null")
                            ? Image.network(widget.recipe.winePairing.productMatches.imageUrl.toString())
                            : Image.asset('assets/TastEZ_logo.png'),
                        //onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => winePage(widget.recipe.winePairing))),
                      ),
                    );
                  }
              ),
            ]),
      );
    }
    else {
      print("Recipe did not provide a wine pairing.");
      return Card(child: Text("Recipe did not provide a wine pairing."));
      // return FutureBuilder<WinePairing>(
      //     future: getPairingFromDishName(),
      //     builder: (BuildContext context, AsyncSnapshot<WinePairing> response) {
      //       Widget child;
      //       if (response.hasData) {
      //         print("RESPONSE DATA: " + response.data.toString());
      //         child = SingleChildScrollView(
      //           physics: ScrollPhysics(),
      //           child: Column(
      //               children: [
      //                 ListTile(
      //                   title: Text(response.data.pairingText),
      //                 ),
      //                 ListView.builder(
      //                     scrollDirection: Axis.vertical,
      //                     shrinkWrap: true,
      //                     itemCount: response.data.pairedWines.length,
      //                     itemBuilder: (context, i) {
      //                       return Card(
      //                         color: subAccentColor,
      //                         elevation: 0.2,
      //                         child: ListTile(
      //                           title: Text(
      //                               response.data.pairedWines.elementAt(i).toString()),
      //                           leading: (response.data.productMatches.imageUrl.toString() != "" &&
      //                               response.data.productMatches.imageUrl.toString() != "null") ? Image.network(
      //                               response.data.productMatches.imageUrl.toString()) : Image.asset('assets/nullimage.png'),
      //                           onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => winePage(response.data))),
      //                         ),
      //                       );
      //                     }
      //                 ),
      //               ]),
      //         );
      //       }
      //       else{
      //         child = Container(height:0.0, width: 0.0);
      //       }
      //       return child;
      //     }
      // );
    }
  }
}
class WinePageInfo extends StatefulWidget {
  const WinePageInfo({
    Key key,
    @required this.wines,
  }):super(key:key);

  final WinePairing wines;

  @override
  _WinePageInfoState createState() => _WinePageInfoState();
}

Widget winePage(WinePairing wines) {
  return WinePageInfo(wines: wines);
}

class _WinePageInfoState extends State<WinePageInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Hello World'),),
    );
  }
}

Widget winePairingCall(RecipeElement recipe) {
  return WinePairingTemplate(recipe: recipe);
}

_launchURL() async {
  const url = 'https://flutter.dev';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}