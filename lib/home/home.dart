import 'package:flutter/material.dart';
import 'package:gymsmith_web/cart_page/cart_page.dart';
import 'package:gymsmith_web/core/NonScrollBehavior.dart';
import 'package:gymsmith_web/core/common_widgets/app_bar.dart';
import 'package:gymsmith_web/core/common_widgets/bottom_nav_bar.dart';
import 'package:gymsmith_web/core/common_widgets/common_drawer.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: NonScrollBehavior(),
      child: ResponsiveBuilder(
        builder: (context, sizingInformation) => Scaffold(
            appBar: PreferredSize(
                child: CommonAppBar(),
                preferredSize: Size(MediaQuery.of(context).size.width, 70)),
            drawer : !sizingInformation.isDesktop ? CommonDrawer() : null,
            body:SingleChildScrollView(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CartPage(),
                    BottomNavBar()
                  ],
                ),
              ),
            )
        ),
      ),
    );
  }
}
