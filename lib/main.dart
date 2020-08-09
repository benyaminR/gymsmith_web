import 'package:flutter/material.dart';
import 'package:gymsmith_web/core/debugging/data_pumper.dart';
import 'package:gymsmith_web/home/home.dart';
import 'core/utils/Colors/color_swatches.dart';
import 'package:gymsmith_web/injection_container.dart';

void main() async{
  await init();
  await pumpData();
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
        primaryColor: Colors.black,
        accentColor: Orange,
        scaffoldBackgroundColor: Color(0xFFF8F8F8),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {'/': (BuildContext buildContext)=>Home(),},
    );
  }
}
