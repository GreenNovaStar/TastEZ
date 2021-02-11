import 'package:tastez/login/google_sign_in.dart';
import 'package:tastez/login/const_login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tastez/home.dart';

import '../intro.screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isUserSignedIn = false;
  bool _remember = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              //color: Colors.amber,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end:
                Alignment(1,0), // 10% of the width, so there are ten blinds.
                colors: [
                  Colors.amber,
                  Colors.amber[800],
                ],
                tileMode: TileMode.repeated,
              ),
            ),
          ),
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              //Scroll view when text accumulate
              // SingleChildScrollView({Key key, Axis scrollDirection: Axis.vertical, bool reverse: false, EdgeInsetsGeometry padding, bool primary, ScrollPhysics physics, ScrollController controller, Widget child, DragStartBehavior dragStartBehavior: DragStartBehavior.start, Clip clipBehavior: Clip.hardEdge, String restorationId})
              //physics: ScrollAction(),
              physics: AlwaysScrollableScrollPhysics(), //check
              padding: EdgeInsets.all(
                40.0,
              ),
              //padding: EdgeInsets.symmetric (),

              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'TastEZ',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 40.0, //check
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'login page',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 30.0, //check
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 20.0, //check
                    ),
                    _buildTextField(false, 'Enter Email Address...',
                        TextInputType.emailAddress, Icons.alternate_email),
                    SizedBox(
                      height: 10.0, //check
                    ),
                    _buildTextField(true, 'Enter Password...',
                        TextInputType.visiblePassword, Icons.vpn_key),

                    SizedBox(height: 10.0),
                    Container(
                      //Remember container
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Theme(
                            data: ThemeData(
                                unselectedWidgetColor:
                                Colors.white.withOpacity(0.5)),
                            child: Checkbox(
                              value: _remember,
                              checkColor: Colors.amber,
                              activeColor: Colors.white,
                              onChanged: (value) {
                                print('Remember me');
                                //setState(() {
                                //_remember = value;
                                //);
                              },
                            ),
                          ),
                          Text(
                            'Remember me',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    _buildButton(_printTest('login pressed'), 'Login', Icon(Icons.arrow_forward_ios)),

                    // Container(
                    //   //padding: EdgeInsets.symmetric(vertical: 25.0),
                    //
                    //   width: double.infinity,
                    //   child: FlatButton(
                    //     onPressed: () {
                    //       print('Login Button pressed');
                    //     },
                    //     color: Colors.white,
                    //     child: Text('l o g i n',
                    //         style: TextStyle(
                    //           fontSize: 15.0,
                    //           fontWeight: FontWeight.bold,
                    //           color: Colors.amber,
                    //         )),
                    //   ),
                    // ),
                    SizedBox(height: 10),

                    //_buildButton(_printTest, 'Sign Up', Icon(null)),



                    Column(children: <Widget>[
                      Text(
                        '- OR -',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0,
                            color: Colors.white),

                      ),
                    ]),
                    SizedBox(height: 10),
                    Container(
                      //padding: EdgeInsets.symmetric(vertical: 25.0),
                      width: double.infinity,
                      height: 40,
                      child: FlatButton(
                        onPressed: (){
                          //TODO sign up function

                          print(
                              "clicked on sign up with email"
                          );
                        },
                        color: Colors.white,
                        padding: EdgeInsets.all(5.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.email, size: 30.0),
                            Padding(padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                "Sign up with email",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  // color: Colors.amber,
                                ),
                              ),
                            ),
                            // Text(
                            //   "Sign up with email",
                            //   style: TextStyle(
                            //     fontSize: 20.0,
                            //     // color: Colors.amber,
                            //   ),
                            // ),
                          ],
                        ),
                        textColor: Colors.amber,
                      ),
                    ),
                    SizedBox(height: 10),

                    //Google sign in button
                    Container(
                      //padding: EdgeInsets.symmetric(vertical: 25.0),
                      width: double.infinity,
                      height: 40,
                      child: FlatButton(
                        onPressed:  () {
                          _signInWithGoogle();},
                        color: Colors.white,
                        padding: EdgeInsets.all(5.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),

                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image(image: AssetImage("assets/google_logo.png"), height: 30.0),
                            Padding(padding: const EdgeInsets.only(left: 10.0),
                              child: Text("Continue with google",
                                style: TextStyle(
                                  fontSize: 20,
                                  //color: Colors.amber,
                                ),
                              ),
                            ),
                          ],
                        ),
                        textColor: Colors.amber,
                      ),),
                  ]),
            ),
          ),
        ],
      ),
    );
  }


  _printTest(String str){
    return print(str);
  }

  _buildButton(Function function, String innerText, Icon icon) {
    return Container(
      //padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      height: 40,
      child: FlatButton(
        onPressed: function,
        color: Colors.white,
        padding: EdgeInsets.all(5.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              innerText,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                // color: Colors.amber,
              ),
            ),
            icon,
          ],
        ),
        textColor: Colors.amber,
      ),
    );
  }

  _buildTextField(
      bool obscure, String labelText, TextInputType textInput, IconData icon) {
    return Container(
      alignment: Alignment.center, //check Alignment.centerRight
      decoration: kBoxDecorationStyle,
      // BoxDecoration(
      //   color: Colors.white.withOpacity(0.5),
      //   borderRadius: BorderRadius.circular(15),
      // ),
      height: 50.0,
      child: TextField(
        obscureText: obscure,
        keyboardType: textInput,
        style: TextStyle(
          //  color: Colors.,
          fontWeight: FontWeight.normal,
          fontSize: 17.0,
          color: Colors.black54,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          //check, default value .none
          // contentPadding: EdgeInsets.symmetric(
          //   vertical: 20.0,
          // ),
          //check, different hint font, change in padding
          prefixIcon: Icon(icon),
          hintText: labelText,
          hintStyle: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 17.0,
          ),
        ),
      ),
    );
  }

  _signInWithGoogle() {
    print('Button Pressed');
    signInWithGoogle().then((result) {
      if (result != null) {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return IntroScreen();
          }),
        );
      }
    });
  }
}
