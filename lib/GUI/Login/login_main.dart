import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tastez/GUI/Const.dart';
import 'package:tastez/GUI/Login/temp_GoogleSignIn.dart';
import 'package:tastez/Middleware/Login/Flutter_Login_Package_Modified/flutter_login.dart';
import 'package:tastez/Middleware/Login/google_sign_in.dart';
import 'package:tastez/home.dart';
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
  bool testUI = false;
  bool debug = true;

  Future<String> _authUser(LoginData data) {
    print('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) async {
      if (debug) print("DEBUG #1 inside future.delayed");
      if (testUI) {
        if (!users.containsKey(data.name)) {
          return 'Username not exists';
        }
      }
      if (testUI) {
        if (users[data.name] != data.password) {
          return 'Password does not match';
        }
      }
      if (debug) print("DEBUG #2 before logIntoFb call");

      String signIn_err = await logIntoFb(data);
      if (debug) print("DEBUG #3 after signIn_err returns");
      // ignore: unrelated_type_equality_checks
      if (signIn_err != null) {
        if (debug) print("DEBUG #4 signIn_err not null (issue with login)");
        print("DEBUG #4.1 " + signIn_err);
        return signIn_err;
      } else {
        if (debug)  print("DEBUG #5 email login success");
        return null;
      }
    });
  }

  Future<String> _createUser(LoginData data) {
    if (debug) print("DEBUG #6 inside _createUser beginning");
    print('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) async {
      if (debug) print("DEBUG #7 inside Future.delayed(loginTime)");
      if (testUI) {
        if (users.containsKey(data.name)) {
        return 'Email in use';
        }
        print("pass doesn't not match");
        return 'Password does not match';
      }
      if (debug) print("DEBUG #7.1 before registerToFb call");

      String signUp_err = await registerToFb(data);

      if (debug) print("DEBUG #7.2 after signUp_err returns");
      if (signUp_err != null) {
        if (debug) print("DEBUG #7.3 signUp_err not null (issue with sign up)");
        print("DEBUG #7.4 " + signUp_err);
        return signUp_err;
      } else {
        if (debug) print("DEBUG #7.5 email sign up success");
        return null;
      }
      //return null; //create a firebase entry for the new login
    });
  }

  Future<String> logIntoFb(LoginData data) async {
    var error;
    await firebaseAuth
        .signInWithEmailAndPassword(email: data.name, password: data.password)
        .then((result) {
      if (debug) print('DEBUG #8 logged in using email');
      return error; //returning null
      //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()),);
    }
    ).catchError((err) {
      if (debug) print("DEBUG #9 catchError: " + err.message);
      error = err.message;
    });

    if (debug) print("DEBUG #10 on return: " + error.toString());
    return error;
  }


  Future<String> registerToFb(LoginData data) async {
    var error1;
    try {
     UserCredential user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: data.name, password: data.password);
    } on FirebaseAuthException catch (err) {
      if (err.code == 'weak-password') {
        print('the password is too weak');
      } else if (err.code == 'email-already-in-use') {
        print('email in use');
        return err.message;
      }
    } catch (err) {
      print(err);
      return err;
    }

    return null;
      //   .createUserWithEmailAndPassword(
      //   email: data.name, password: data.password)
      //   .then((result) {
      // dbRef.child(result.user.uid).set({
      //   "email": data.name
      // //   // "age": ageController.text,
      // //   // "name": nameController.text
      //   }).then((res) {
      //     if (debug) print("DEBUG #11 signed up using email");
      //     error1 = null;
      //     // "age": ageController.text,
      //     // "name": nameController.text
      //     // }).then((result) {
      //     //   if (debug) print("DEBUG #11 signed up using email");
      //     //   return error;
      //     //isLoading = false;
      //     // Navigator.pushReplacement(
      //     //     context,
      //     //MaterialPageRoute(builder: (context) => LoginSceen()),
      //     // MaterialPageRoute(builder: (context) => Home(),)//Home(uid: result.user.uid)),
      //     // );
      //   });
      // }).catchError((err) {
      //   if (debug) print("DEBUG #11.1 catchError: " + err.message);
      //   //return
      //  error1 = err.message;
      // });
      // if (debug) print("DEBUG #12 on return: " + error1.toString());
      // return error1;
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
          primaryColor: themeColor,

          // accentColor: themeColor,
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