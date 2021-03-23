import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tastez/GUI/Const.dart';

import 'package:tastez/Middleware/Login/Flutter_Login_Package_Modified/flutter_login.dart';
import 'package:tastez/Middleware/Login/google_sign_in.dart';
import 'package:tastez/home.dart';
import 'package:tastez/login/temp_GoogleSignIn.dart';
import 'package:firebase_database/firebase_database.dart';


class LoginPageMain extends StatefulWidget {
  @override
  _LoginPageMainState createState() => _LoginPageMainState();
  final FirebaseAuth _auth = FirebaseAuth.instance;
}

class _LoginPageMainState extends State<LoginPageMain> {

  Duration get loginTime => Duration(milliseconds: 2250);

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  DatabaseReference dbRef =
  FirebaseDatabase.instance.reference().child("Users");

  static const users = const {
    'dribbble@gmail.com': '12345',
    'hunter@gmail.com': 'hunter',
    'tastez@gmail.com': '123456',
  };
  bool test = false;

  Future<String> _authUser(LoginData data) {
    print('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (test) {
        //if (!users.containsKey(data.name)) {
        return 'Username not exists';
      }
      if (test) {
        //if (users[data.name] != data.password) {
        return 'Password does not match';
      }
      logIntoFb(data);
      return null; //search firebase entry for login
    });
  }

  Future<String> _createUser(LoginData data) {
    print('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (users.containsKey(data.name)) {
        return 'Email in use';
      }
      if (test) {
        print("pass doesnt not match");
        return 'Password does not match';
      }
      print("registering to fb");
      registerToFb(data);
      return null; //create a firebase entry for the new login
    });
  }

  void logIntoFb(LoginData data) {
    firebaseAuth
        .signInWithEmailAndPassword(email: data.name, password: data.password)
        .then((result) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()),);
    }
    ).catchError((err) {
      print(err.message);

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text(err.message),
              actions: [
                FlatButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    });
  }
  void registerToFb(LoginData data) {
    firebaseAuth
        .createUserWithEmailAndPassword(
        email: data.name, password: data.password)
        .then((result) {
      dbRef.child(result.user.uid).set({
        "email": data.name,
        // "age": ageController.text,
        // "name": nameController.text
      }).then((res) {
        //isLoading = false;
        Navigator.pushReplacement(
            context,
            //MaterialPageRoute(builder: (context) => LoginSceen()),
            MaterialPageRoute(builder: (context) => Home(),)//Home(uid: result.user.uid)),
        );
      });
    }).catchError((err) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text(err.message),
              actions: [
                FlatButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    });
  }
  Future<String> _recoverPassword(String name) {
    print('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'Username not exists';
      }
      return null;
    });
  }


  @override
  Widget build(BuildContext context) {

    return Center(
      child: FlutterLogin(
        title: 'Login',
        logo: 'assets/TastEZ_logo.png',
        onSignup: _createUser,
        onLogin: _authUser,
        onRecoverPassword: _recoverPassword,
        theme: LoginTheme(

        ),
        messages: LoginMessages(
          usernameHint: 'Email',
          passwordHint: 'Password',
          confirmPasswordHint: 'Confirm Password',
          loginButton: 'Login',
          signupButton: 'Register',
          forgotPasswordButton: 'Forgot Password',
          recoverPasswordButton: 'HELP ME',
          goBackButton: 'Back',
          confirmPasswordError: 'Passwords do not match!',
          //recoverPasswordDescription: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
          recoverPasswordSuccess: 'Password rescued successfully',
        ),
        onSubmitAnimationCompleted: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => Home(),
          ));
        },

        loginProvidersList: <LoginProvider>[
          LoginProvider(
            icon: FontAwesomeIcons.google,
            callback: () async {
              print('start google sign in');
              // signInWithGoogle();
              signInWithGoogle().then((result) {
                if (result != null) {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {

                      return Home();
                    }),
                  );
                }
                return "google unsuccess";
              });
              await Future.delayed(loginTime);
              print('stop google sign in');
              final provider =
              Provider.of<GoogleSignInProvider>(context, listen: false);
              return provider.login();
              return null;
            },
          ),
        ],
      ),
    );
  }
}

Widget TempWidget(){
  return StreamBuilder(
    stream: FirebaseAuth.instance.authStateChanges(),
    builder: (context, snapshot) {
      final provider = Provider.of<GoogleSignInProvider>(context);

      if (provider.isSigningIn) {
        return Text("Logging In");
      } else if (snapshot.hasData) {
        return Text("Logged In");
      } else {
        return Text("Press to sign up");
      }
    },
  );
}