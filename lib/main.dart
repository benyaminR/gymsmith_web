import 'package:flutter/material.dart';
import 'package:gymsmith_web/home_page.dart';
import 'package:gymsmith_web/injection.dart';
import 'package:gymsmith_web/injection_container.dart';
import 'package:gymsmith_web/utils/Colors/color_swatches.dart';
import 'package:injectable/injectable.dart';

void main(){
  configureInjection();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: Grey_Background,
        accentColor: Orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {'/': (BuildContext buildContext)=>HomePage(),},
    );
  }
}
