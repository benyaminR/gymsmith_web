import 'package:flutter/material.dart';
import 'package:gymsmith_web/app_bar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(child: CommonAppBar(), preferredSize: Size(MediaQuery.of(context).size.width, 70)),
      body: Center(child: Text("Hello Motherfucker!"),)
    );
  }
}
