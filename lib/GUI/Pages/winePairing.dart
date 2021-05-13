import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tastez/GUI/Const.dart';
import 'package:tastez/Middleware/APIParsing/RecipeElement.dart';
import 'package:tastez/Middleware/APIParsing/WinePairing/ProductMatches.dart';
import 'package:tastez/Middleware/APIParsing/WinePairing/WinePairing.dart';
import 'package:tastez/Middleware/APIParsing/spoonacular.dart';
import 'package:tastez/Middleware/TestingConst/DefaultUser.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/cupertino.dart';
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
  final Completer<WebViewController> _controller = Completer<WebViewController>();

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          // ignore: deprecated_member_use
          Scaffold.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }


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
              Text("Click on Wines for more info", style: TextStyle(fontStyle: FontStyle.italic)),
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: widget.recipe.winePairing.pairedWines.length,
                  itemBuilder: (context, i) {
                    return Card(
                      child: ListTile(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    WinePageWebView(
                                      url: "https://www.wine.com/search/${widget.recipe.winePairing.pairedWines.elementAt(i).toString()}/0",
                                      wineName: widget.recipe.winePairing.pairedWines.elementAt(i).toString(),
                                    )
                            )
                        ),
                        title: Text(" • "+widget.recipe.winePairing.pairedWines.elementAt(i).toString()),
                        // leading: (widget.recipe.winePairing.productMatches.imageUrl.toString() != "" && widget.recipe.winePairing.productMatches.imageUrl.toString() != "null")
                        //     ? Image.network(widget.recipe.winePairing.productMatches.imageUrl.toString())
                        //     : Image.asset('assets/TastEZ_logo.png'),
                        //onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => winePage(widget.recipe.winePairing))),
                        trailing: Icon(Icons.search),
                      ),
                    );
                  }
              ),
            ]),
      );
    }
    else {
      print("Recipe did not provide a wine pairing.");
      return Card(child: ListTile(title: Text("Recipe did not provide a wine pairing.")));
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

class WinePageWebView extends StatelessWidget {
  String url;
  String wineName;

  WinePageWebView({this.url, this.wineName});

  @override
  Widget build(BuildContext context) {
    final Completer<WebViewController> _controller = Completer<WebViewController>();
    final Set<String> _favorites = defaultUser.webViewFavorites;
    // final List<String> _favorites = List.empty(growable: true);

    _bookmarkButton() {
      return FutureBuilder<WebViewController>(
        future: _controller.future,
        builder:
            (BuildContext context, AsyncSnapshot<WebViewController> controller) {
          if (controller.hasData) {
            return FloatingActionButton(
              backgroundColor: themeColor,
              foregroundColor: subAccentColor,
              onPressed: () async {
                var url = await controller.data.currentUrl();
                if(_favorites.contains(url)){
                  Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text('Already bookmarked this page')),
                  );
                }else{
                  _favorites.add(url);
                  print(url);
                  Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text('Bookmarked $url.')),
                  );
                }

              },
              child: Icon(Icons.bookmark),
            );
          }
          return Container();
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          color: subAccentColor,
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Results for $wineName", style: TextStyle(color: subAccentColor),),
        backgroundColor: themeColor,
        actions: [
          // NavigationControls(_controller.future),
          Menu(_controller.future, () => _favorites),
          // Icon(Icons.bookmark),
        ],
      ),
      body: WebView(
        initialUrl: url,
        onWebViewCreated: (WebViewController webViewController){
          _controller.complete(webViewController);
        },
      ),
      bottomNavigationBar: NavigationControls(_controller.future),
      floatingActionButton: _bookmarkButton(),
    );
  }
}

class NavigationControls extends StatelessWidget {
  const NavigationControls(this._webViewControllerFuture)
      : assert(_webViewControllerFuture != null);

  final Future<WebViewController> _webViewControllerFuture;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WebViewController>(
      future: _webViewControllerFuture,
      builder:
          (BuildContext context, AsyncSnapshot<WebViewController> snapshot) {
        final bool webViewReady =
            snapshot.connectionState == ConnectionState.done;
        final WebViewController controller = snapshot.data;
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.black,),
              onPressed: !webViewReady
                  ? null
                  : () => navigate(context, controller, goBack: true),
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios, color: Colors.black,),
              onPressed: !webViewReady
                  ? null
                  : () => navigate(context, controller, goBack: false),
            ),
          ],
        );
      },
    );
  }

  navigate(BuildContext context, WebViewController controller,
      {bool goBack: false}) async {
    bool canNavigate =
    goBack ? await controller.canGoBack() : await controller.canGoForward();
    if (canNavigate) {
      goBack ? controller.goBack() : controller.goForward();
    } else {
      Scaffold.of(context).showSnackBar(
        SnackBar(
            content: Text("No ${goBack ? 'back' : 'forward'} history item")),
      );
    }
  }
}

class Menu extends StatelessWidget {
  Menu(this._webViewControllerFuture, this.favoritesAccessor);
  final Future<WebViewController> _webViewControllerFuture;
  // TODO(efortuna): Come up with a more elegant solution for an accessor to this than a callback.
  final Function favoritesAccessor;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _webViewControllerFuture,
      builder:
          (BuildContext context, AsyncSnapshot<WebViewController> controller) {
        if (!controller.hasData) return Container();
        return PopupMenuButton<String>(
          icon: Icon(Icons.more_vert, color: subAccentColor,),
          onSelected: (String value) async {
            if (value == 'Email link') {
              var url = await controller.data.currentUrl();
              await launch(
                  'mailto:?subject=Check out this cool Wine page&body=$url');
            } else {
              var newUrl = await Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                    return WebViewFavoriteLinks(favoritesAccessor());
                  }));
              Scaffold.of(context).removeCurrentSnackBar();
              if (newUrl != null) controller.data.loadUrl(newUrl);
              print("hello world");
            }
          },
          itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
            const PopupMenuItem<String>(
              value: 'Email link',
              child: Text('Email link'),
            ),
            const PopupMenuItem<String>(
              value: 'Bookmarks',
              child: Text('Bookmarks'),
            ),
          ],
        );
      },
    );
  }
}

class WebViewFavoriteLinks extends StatelessWidget {
  WebViewFavoriteLinks(this.favorites);
  final Set<String> favorites;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          color: subAccentColor,
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Favorite pages', style: TextStyle(color: subAccentColor)), 
        foregroundColor: subAccentColor, 
        backgroundColor: themeColor,),
      body: ListView(
          children: favorites
              .map((url) => ListTile(
              title: Text(url), onTap: () => Navigator.pop(context, url)))
              .toList()),


    );
  }
}
