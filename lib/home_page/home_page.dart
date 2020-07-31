import 'package:flutter/material.dart';
import 'package:gymsmith_web/home_page/home_page_slide_show_intro.dart';
import 'package:gymsmith_web/core/common_widgets/app_bar.dart';
import 'package:gymsmith_web/features/deals_of_the_day_list/presenation/pages/deals_of_the_day_widget.dart';

import 'home_page_bottom_slide_show.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: CommonAppBar(),
          preferredSize: Size(MediaQuery.of(context).size.width, 70)),
      body: SingleChildScrollView(
        child: Container(
          height: 3979,
          child: Column(
            children: [
              SizedBox(
                height: 38,
              ),

              HomePageSlideShowIntro(duration: Duration(seconds: 1), delay: Duration(seconds: 5),),

              SizedBox(
                height: 119,
              ),
              DealsOfTheDayWidget(),

              SizedBox(height: 45.5,),

              Container(
                height: 0.5,
                width: 834,
                color: Colors.grey[600],
              ),

              SizedBox(height: 21.5,),

              HomePageBottomSlideShow(duration: Duration(seconds: 1), delay: Duration(seconds: 5),),

              SizedBox(height: 29.5,),

              Container(
                height: 0.5,
                width: 834,
                color: Colors.grey[600],
              ),

              SizedBox(height:235.5,)

            ],
          ),
        ),
      ),
    );
  }
}
