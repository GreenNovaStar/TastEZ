import 'package:flutter/material.dart';
import 'package:tastez/GUI/Const.dart';

//https://www.youtube.com/watch?v=vyj8jVUQS6Q

class LoginPageV2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeColor,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            TextFieldWidget(
              hintText: 'Email',
              obscureText: false,
              prefixIconData: Icons.mail_outline,
            ),
            SizedBox(
              height: 10,
            ),
            TextFieldWidget(
              hintText: 'Password',
              obscureText: true,
              prefixIconData: Icons.lock_outline,
            ),
            SizedBox(
              height: 20.0,
            ),
            ButtonWidget(
              title: 'Login',
              hasBorder: false,
            ),
            ButtonWidget(
              title: 'Sign Up',
              hasBorder: true,
            )
          ],
        ),
      ),
    );
  }
}

class TextFieldWidget extends StatelessWidget {

  final String hintText;
  final IconData prefixIconData;
  final IconData suffixIconData;
  final bool obscureText;
  final Function onChanged;

  TextFieldWidget({this.hintText, this.prefixIconData, this.suffixIconData, this.obscureText, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      style: TextStyle(
        color: Colors.greenAccent,
        fontSize: 14
      ),
      cursorColor: Colors.greenAccent,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(
          prefixIconData,
          size: 18,
          color: Colors.greenAccent,
        ),
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.greenAccent),
        ),
        suffixIcon: Icon(
          suffixIconData,
          size: 18,
          color: Colors.greenAccent,
        ),
        labelStyle: TextStyle(color: Colors.greenAccent),
        focusColor: Colors.greenAccent,
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  final String title;
  final bool hasBorder;

  ButtonWidget({this.title, this.hasBorder});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: hasBorder? Colors.greenAccent : Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
    );
  }
}

