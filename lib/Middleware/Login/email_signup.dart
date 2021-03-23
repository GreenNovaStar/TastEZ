import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../home.dart';


class EmailSignUp extends StatefulWidget {
  @override
  _EmailSignUpState createState() => _EmailSignUpState();
}
class _EmailSignUpState extends State<EmailSignUp> {
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  DatabaseReference dbRef =
  FirebaseDatabase.instance.reference().child("Users");
  TextEditingController emailController = TextEditingController();
  //TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  //TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Sign Up")),

    );
  }

  void registerToFb() {
    firebaseAuth
        .createUserWithEmailAndPassword(
        email: emailController.text, password: passwordController.text)
        .then((result) {
      dbRef.child(result.user.uid).set({
        "email": emailController.text,
        // "age": ageController.text,
        // "name": nameController.text
      }).then((res) {
        isLoading = false;
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

  @override
  void dispose() {
    super.dispose();
    // nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    // ageController.dispose();
  }
}