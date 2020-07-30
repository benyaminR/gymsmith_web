import 'package:flutter/material.dart';
import 'package:gymsmith_web/app_bar.dart';
import 'package:gymsmith_web/features/deals_of_the_day_list/presenation/pages/deals_of_the_day_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(child: CommonAppBar(), preferredSize: Size(MediaQuery.of(context).size.width, 70)),
      body: DealsOfTheDayWidget(),
    );
  }
}
