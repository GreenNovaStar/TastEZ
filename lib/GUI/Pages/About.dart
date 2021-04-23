
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
        title: Text("About"),

      ),
      body: Container(
        color: subAccentColor,
        child: Column(
          children: [
            Image.asset("assets/TastEZ_logo.png",),
            Text("Hello World"),
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
        ),
      ),
    );
  }
}
