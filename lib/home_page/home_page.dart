import 'package:flutter/material.dart';
import 'package:gymsmith_web/home_page/home_page_slide_show_intro.dart';
import 'package:gymsmith_web/core/common_widgets/app_bar.dart';
import 'package:gymsmith_web/features/deals_of_the_day_list/presenation/pages/deals_of_the_day_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: CommonAppBar(),
          preferredSize: Size(MediaQuery.of(context).size.width, 70)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 38,
            ),

            HomePageSlideShowIntro(duration: Duration(seconds: 1), delay: Duration(seconds: 5),),

            SizedBox(
              height: 119,
            ),
            DealsOfTheDayWidget()
          ],
        ),
      ),
    );
  }
}
