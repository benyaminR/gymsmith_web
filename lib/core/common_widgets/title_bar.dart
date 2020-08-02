import 'package:flutter/material.dart';
import 'package:gymsmith_web/core/utils/TextStyles/text_styles.dart';
import 'package:responsive_builder/responsive_builder.dart';

class TitleBar extends StatelessWidget {
  final String title;

  const TitleBar({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding:  EdgeInsets.only(bottom: sizingInformation.isDesktop ? 64.0 : 32.0),
          child: Container(
            alignment: Alignment.center,
            color: Colors.black,
            width: sizingInformation.isDesktop ? 364 : 180,
            height: sizingInformation.isDesktop ? 69 : 35,
            child: Text(title,
              style: sizingInformation.isDesktop ? roboto28BoldWhite : roboto16WhiteBold,
            ),
          ),
        ),
      ),
    );
  }
}
