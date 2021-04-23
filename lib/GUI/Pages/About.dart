
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
          children: [
            Text('This is an About Dialog in Flutter'),
          ]
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
        onPressed: () => _showDialog(),
        // onPressed: () {
        //   AlertDialog(
        //     content: ListBody(
        //       children: <Widget>[
        //         Row(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: <Widget>[
        //             if (Image.asset("assets/TastEZ_logo-v2.png",width: 100,), != null) IconTheme(data: Theme.of(context).iconTheme, child: icon),
        //             Expanded(
        //               child: Padding(
        //                 padding: const EdgeInsets.symmetric(horizontal: 24.0),
        //                 child: ListBody(
        //                   children: <Widget>[
        //                     Text("TastEZ", style: Theme.of(context).textTheme.headline5),
        //                     Text("1.0.0", style: Theme.of(context).textTheme.bodyText2),
        //                     const SizedBox(height: 18.0),
        //                     Text(applicationLegalese ?? '', style: Theme.of(context).textTheme.caption),
        //                   ],
        //                 ),
        //               ),
        //             ),
        //           ],
        //         ),
        //         ...?children,
        //       ],
        //     ),
        //     actions: <Widget>[
        //       TextButton(
        //         child: Text(MaterialLocalizations.of(context).viewLicensesButtonLabel),
        //         onPressed: () {
        //           showLicensePage(
        //             context: context,
        //             applicationName: applicationName,
        //             applicationVersion: applicationVersion,
        //             applicationIcon: applicationIcon,
        //             applicationLegalese: applicationLegalese,
        //           );
        //         },
        //       ),
        //       TextButton(
        //         child: Text(MaterialLocalizations.of(context).closeButtonLabel),
        //         onPressed: () {
        //           Navigator.pop(context);
        //         },
        //       ),
        //     ],
        //     scrollable: true,
        //   );
        // },
      ),
    );
  }
}
