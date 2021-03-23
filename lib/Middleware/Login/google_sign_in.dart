import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tastez/GUI/AppBar/AppBar.dart';
import 'package:tastez/GUI/Const.dart';
import 'package:tastez/GUI/Login/login_main.dart';
import 'package:tastez/Middleware/HomePage/HomePage.dart';
import 'package:tastez/Middleware/HomePage/OverFlowButtonIcons.dart';
import 'package:tastez/home.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();
String name;
String email;
String imageUrl;

Future<String> signInWithGoogle() async {
  await Firebase.initializeApp();

  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final UserCredential authResult = await _auth.signInWithCredential(credential);
  final User user = authResult.user;

  if (user != null) {
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);
    assert(user.email != null);
    assert(user.displayName != null);
    assert(user.photoURL != null);

    // Store the retrieved data
    name = user.displayName;
    email = user.email;
    imageUrl = user.photoURL;

    final User currentUser = _auth.currentUser;
    assert(user.uid == currentUser.uid);

    if (name.contains(" ")) {
      name = name.substring(0, name.indexOf(" "));
    }

    print('signInWithGoogle succeeded: $user');
    // Navigator.pushAndRemoveUntil(context, PageRouteBuilder(pageBuilder: (context, animation1, animation2) => Home()),(Route<dynamic> route) => false,);
    return '$user';
    // Navigator.of(context).pushReplacementNamed('/homepage');
  }
  return null;
}

Future<void> signOutGoogle() async {
  await googleSignIn.signOut();
  _auth.signOut();
  print("User Signed Out");
}

class ViewProfilee extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold (
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(preferredSize: Size(size.width, 100),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: size.width,
                  height: 100,
                  color: subAccentColor,//Color(0x00000000),
                  child: Stack(
                    children: [
                      CustomPaint(
                        size: Size(size.width, 100),
                        painter: AppBarCustomPainter(),
                      ),
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: SizedBox(height: 33, child: Image.asset('assets/TastEZ_whitetext.png')),
                                ),
                              ), //app logo
                              Container(width: size.width*0.35), //separator between logo and buttons
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ), // appbar_top
              Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  height: 35,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 80, bottom: 0),
                      child: Text('Your Profile', style: pageTitleFont,),
                      //child: controller.hasClients ? Text(getCurrentPageName(controller.page.toInt()), style: pageTitleFont) : Text("Loading...", style: pageTitleFont),
                    ),
                  ),
                ),
              ), // appbar_bottom
            ],
          ),
        ),
      ),

      body: Container(
        decoration: BoxDecoration(
          color: subAccentColor,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: (imageUrl != null || imageUrl != "")? NetworkImage(imageUrl) : Image.asset("assets/TastEZ_logo.png"),
                //backgroundImage: NetworkImage("https://www.clipartmax.com/png/small/15-153165_log-clipart-user-profile-phone-png.png"), //Fall back
                radius: 60,
                backgroundColor: Colors.transparent,
              ),
              SizedBox(height: 40),
              Text(
                'NAME',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: accentColor,
                ),
              ),
              Text(
                name,
                //"John Smith", //Fall back
                style: TextStyle(
                  fontSize: 25,
                  color:  Colors.black,
                  //fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'EMAIL',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: accentColor,
                ),
              ),
              Text(
                email,
                //"johnSmith@tastez.com", //Fall back
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  // fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 40),
              RaisedButton(
                onPressed: () {
                  signOutGoogle();
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return LoginPageMain();}), ModalRoute.withName('/'));
                },
                color: accentColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Sign Out',
                    style: TextStyle(fontSize: 25, color: subAccentColor),
                  ),
                ),
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
              ),
              SizedBox(height: 60),
              RaisedButton(
                onPressed: () {
                  //signOutGoogle();
                  Navigator.pop(context);
                  //Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return LoginPageMain();}), ModalRoute.withName('/'));
                },
                color: accentColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'return',
                    style: TextStyle(fontSize: 25, color: subAccentColor),
                  ),
                ),
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
              ),
            ],
          ),
        ),
      ),
    );
    throw UnimplementedError();
  }
}