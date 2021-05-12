
import 'package:flutter/material.dart';
import 'package:tastez/GUI/Const.dart';

class AboutPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    void _showDialog() {
      showAboutDialog(
          context: context,
          applicationName: 'TastEZ',
          applicationIcon: Image.asset("assets/TastEZ_logo-v2.png",width: 100,),
          // applicationIcon: Image.asset("assets/TastEZ_logo.png",width: 100,),
          // applicationIcon: FlutterLogo(),
          applicationVersion: '1.0.0',
          // children: [
          //   Text('This is an About Dialog in Flutter'),
          // ]
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        title: Text("About", style: TextStyle(color: subAccentColor),),
      ),
      body: Container(
        color: subAccentColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/TastEZ_logo.png",),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
              child: Text("TastEZ is a recipe and wine pairing application available on both iOS and Android, the application recommends the user with top recipes and provides the user the right wine to pair with their dish.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  // fontWeight: FontWeight.bold,
                  // letterSpacing: 1,
                  fontSize: 20,
                  color: Colors.black87
                ),
              ),
            ),
            // ExpansionTile(
            //   title: Text("Licenses"),
            //   children: [
            //     SizedBox(
            //       height: MediaQuery.of(context).size.height - 100,
            //       child: LicensePage(
            //         applicationVersion: '1.0.0',
            //         applicationName: 'TastEZ',
            //         applicationIcon: Image.asset("assets/TastEZ_logo-v2.png",width: 100,),
            //       ),
            //     ),
            //   ],
            // )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: themeColor,
        // onPressed: () => _showDialog(),
        child: Icon(Icons.article_outlined),
        onPressed: () => showLicensePage(
          context: context,
          applicationVersion: '1.0.0',
          applicationName: 'TastEZ',
          applicationIcon: Image.asset("assets/TastEZ_logo-v2.png",width: 100,),
          useRootNavigator: false,
        ),
      ),
    );
  }
}
