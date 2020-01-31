import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resto_review/UI/Home/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          canvasColor: Color(0xFFf9f6f7),
          primaryColor: Color(0xFFffe8d6),
          primaryColorDark: Color(0xFFff971d)),
      home: Home(),
    );
  }
}
