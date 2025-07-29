import 'package:flutter/material.dart';
import 'package:login_proj/Login_page.dart';
import 'package:login_proj/first_page.dart';


class Mybutton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  Mybutton({super.key,required this.text,required this.onPressed});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onPressed,
        color: Theme.of(context).primaryColor,
        child: Text(text),
    );
  }
}
