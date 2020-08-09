import 'package:flutter/material.dart';
import 'package:gymsmith_web/core/common_widgets/bottom_nav_bar.dart';
import 'package:gymsmith_web/core/common_widgets/divider.dart';
import 'package:gymsmith_web/home_page/home_page_slide_show_intro.dart';
import 'package:gymsmith_web/features/deals_of_the_day_list/presenation/pages/deals_of_the_day_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'home_page_bottom_slide_show.dart';

class HomePage extends StatelessWidget {
  final SizingInformation sizingInformation;

  const HomePage({Key key, @required this.sizingInformation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: sizingInformation.isDesktop ? 38 : 19,
        ),

        HomePageSlideShowIntro(
          duration: Duration(seconds: 1),
          delay: Duration(seconds: 5),
          sizingInformation: sizingInformation,
        ),
        SizedBox(
          height: sizingInformation.isDesktop ? 120 : 60,
        ),
        DealsOfTheDayWidget(),
        SizedBox(
          height: sizingInformation.isDesktop ? 46 : 23,
        ),

        CommonDivider(),

        SizedBox(
          height: sizingInformation.isDesktop ? 21.5 : 11,
        ),
        HomePageBottomSlideShow(
          duration: Duration(seconds: 1),
          delay: Duration(seconds: 5),
        ),

        SizedBox(
          height: sizingInformation.isDesktop ? 29.5 : 15,
        ),

        CommonDivider(),

        SizedBox(
          height: sizingInformation.isDesktop ? 235.5 : 118,
        ),

      ],
    );
  }
}
