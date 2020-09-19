import 'package:flutter/material.dart';
import 'package:gymsmith_web/core/utils/TextStyles/text_styles.dart';
import 'package:responsive_builder/responsive_builder.dart';

class TitleBar extends StatelessWidget {
  final String title;
  final double desktopWidth;
  final double mobileWidth;
  final double desktopPadding;
  final double mobilePadding;
  const TitleBar({Key key, this.title, this.desktopWidth=364, this.mobileWidth=180, this.desktopPadding=64, this.mobilePadding=32}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(bottom: sizingInformation.isDesktop ? desktopPadding : mobilePadding),
          child: Container(
            alignment: Alignment.center,
            color: Colors.black,
            width: sizingInformation.isDesktop ? desktopWidth : mobileWidth,
            height: sizingInformation.isDesktop ? 69 : 35,
            child: Text(title,
              style: sizingInformation.isDesktop ? roboto28BoldWhite : roboto12White
            ),
          ),
        ),
      ),
    );
  }
}
