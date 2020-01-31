import 'package:flutter/material.dart';
import 'package:resto_review/UI/Home/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        canvasColor: Colors.white,
        primaryColor: Color(0xFFffe8d6),
        primaryColorDark: Color(0xFFff971d)
      ),
      home: Home(),
    );
  }
}


