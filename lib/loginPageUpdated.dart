import 'dart:math';
import 'package:firebase_core/firebase_core.dart';
import 'package:tastez/first_screen.dart';
import 'package:tastez/google_sign_in.dart';
import 'package:tastez/test_login.dart';
import 'constLogin.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tastez/test_login_2.dart';

import 'login2.dart';

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
            // height: double.infinity,
            // width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.amber,
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
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0, //check
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'login page',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0, //check
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 20.0, //check
                    ),
                    // Column(         //Email
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: <Widget>[
                    // Text(
                    //   'Email address',
                    //   style: TextStyle(
                    //     color: Colors.white,
                    //     fontWeight: FontWeight.bold,
                    //     fontSize: 16.0,
                    //   ),
                    // ),
                    _buildTextField(false, 'Enter Email Address...',
                        TextInputType.emailAddress, Icons.alternate_email),
                    //   ],
                    // ),
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
                                setState(() {
                                  _remember = value;
                                });
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
                    Container(
                      //padding: EdgeInsets.symmetric(vertical: 25.0),
                      width: double.infinity,
                      child: FlatButton(
                        onPressed: () {
                          print('Login Button pressed');
                        },
                        color: Colors.white,
                        child: Text('l o g i n',
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.amber,
                            )),
                      ),
                    ),
                    Column(children: <Widget>[
                      Text(
                        'OR',
                        style: TextStyle(fontSize: 17),
                      ),
                    ]),
                    _buildButton(_signInWithGoogle, 'Sign In With Google'),
                  ]),
            ),
          )
        ],
      ),
    );
  }

  _buildButton(Function function, String innerText) {
    return Container(
      //padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      height: 50,
      child: FlatButton(
        onPressed: function,
        color: Colors.white,
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
            Icon(Icons.arrow_forward_ios)
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
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
      ),
      height: 60.0,
      child: TextField(
        obscureText: obscure,
        keyboardType: textInput,
        style: TextStyle(
          //  color: Colors.,
          fontWeight: FontWeight.w600,
          fontSize: 17.0,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          //check, default value .none
          contentPadding: EdgeInsets.symmetric(
            vertical: 20.0,
          ),
          //check, different hint font, change in padding
          prefixIcon: Icon(icon),
          hintText: labelText,
          hintStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
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
            return FirstScreen();
          }),
        );
      }
    });
  }
}
