// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:tastez/login/const_login.dart';
// import 'package:tastez/home.dart';
// import 'package:tastez/login/login_page.dart';
//
// class EmailSignUp extends StatefulWidget {
//   @override
//   _EmailSignUpState createState() => _EmailSignUpState();
// }
//
// class _EmailSignUpState extends State<EmailSignUp> {
//   bool isLoading = false;
//   final _formKey = GlobalKey<FormState>();
//   FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//   DatabaseReference dbRef =
//       FirebaseDatabase.instance.reference().child("Users");
//   TextEditingController emailController = TextEditingController();
//   TextEditingController nameController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController ageController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(title: Text("Sign Up")),
//       body: Stack(
//         children: <Widget>[
//           Container(
//             height: double.infinity,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               //color: Colors.amber,
//               gradient: LinearGradient(
//                 begin: Alignment.topLeft,
//                 end: Alignment(
//                     1, 0), // 10% of the width, so there are ten blinds.
//                 colors: [
//                   Colors.amber,
//                   Colors.amber[800],
//                 ],
//                 tileMode: TileMode.repeated,
//               ),
//             ),
//           ),
//           Form(
//             key: _formKey,
//             child: SingleChildScrollView(
//              physics: AlwaysScrollableScrollPhysics(), //check
//               padding: EdgeInsets.all(
//                 40.0,
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//
//                   Container(
//                     alignment: Alignment.center,
//                       decoration: kBoxDecorationStyle,
//                       height: 50.0,
//                       //padding: EdgeInsets.all(20.0),
//                       child: TextFormField(
//                         controller: nameController,
//                         style: TextStyle(
//                           fontWeight: FontWeight.normal,
//                           fontSize: 17.0,
//                           color: Colors.black54,
//                         ),
//                         decoration: InputDecoration(
//                           hintText: "Enter Username",
//                           hintStyle: TextStyle(
//                             fontWeight: FontWeight.normal,
//                             fontSize: 17.0,
//                           ),
//                           errorStyle: TextStyle(
//                               fontWeight: FontWeight.normal,
//                               fontSize: 17.0
//                           ),
//                           border: InputBorder.none,
//                           prefixIcon: Icon(Icons.alternate_email),
//                           // enabledBorder: OutlineInputBorder(
//                           //   borderRadius: BorderRadius.circular(10),
//                           // ),
//                         ),
//                         validator: (value) {
//                           if (value.isEmpty) {
//                             return 'Enter User Name';
//                           }
//                           return null;
//                         },
//                       ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.all(20.0),
//                     child: TextFormField(
//                       controller: emailController,
//                       decoration: InputDecoration(
//                         labelText: "Enter Email",
//                         labelStyle: TextStyle(
//                           fontSize: 20.0,
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                       ),
//                       // The validator receives the text that the user has entered.
//                       validator: (value) {
//                         if (value.isEmpty) {
//                           return 'Enter an Email Address';
//                         } else if (!value.contains('@')) {
//                           return 'Please enter a valid email address';
//                         }
//                         return null;
//                       },
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.all(20.0),
//                     child: TextFormField(
//                       obscureText: true,
//                       controller: passwordController,
//                       decoration: InputDecoration(
//                         labelText: "Enter Password",
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                       ),
//                       // The validator receives the text that the user has entered.
//                       validator: (value) {
//                         if (value.isEmpty) {
//                           return 'Enter Password';
//                         } else if (value.length < 6) {
//                           return 'Password must be atleast 6 characters!';
//                         }
//                         return null;
//                       },
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.all(20.0),
//                     child: isLoading
//                         ? CircularProgressIndicator()
//                         : RaisedButton(
//                             color: Colors.lightBlue,
//                             onPressed: () {
//                               if (_formKey.currentState.validate()) {
//                                 setState(() {
//                                   isLoading = true;
//                                 });
//                                 registerToFb();
//                               }
//                             },
//                             child: Text('Submit'),
//                           ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void registerToFb() {
//     firebaseAuth
//         .createUserWithEmailAndPassword(
//             email: emailController.text, password: passwordController.text)
//         .then((result) {
//       dbRef.child(result.user.uid).set({
//         "email": emailController.text,
//         "age": ageController.text,
//         "name": nameController.text
//       }).then((res) {
//         isLoading = false;
//         Navigator.pushReplacement(
//           context,
//           //MaterialPageRoute(builder: (context) => LoginSceen()),
//           MaterialPageRoute(builder: (context) => Home(uid: result.user.uid)),
//         );
//       });
//     }).catchError((err) {
//       showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               title: Text("Error"),
//               content: Text(err.message),
//               actions: [
//                 FlatButton(
//                   child: Text("Ok"),
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                 )
//               ],
//             );
//           });
//     });
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     nameController.dispose();
//     emailController.dispose();
//     passwordController.dispose();
//     ageController.dispose();
//   }
// }
