import 'package:flutter/material.dart';
import 'package:gymsmith_web/Colors/color_swatches.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Black,
        backgroundColor: Grey_Background,
        accentColor: Orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      )
    );
  }
}
