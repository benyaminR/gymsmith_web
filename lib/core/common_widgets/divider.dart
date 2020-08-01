import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CommonDivider extends StatelessWidget {
  const CommonDivider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Container(
        decoration: BoxDecoration(color: Colors.grey[600], boxShadow: [
          BoxShadow(offset: Offset(0, 1), blurRadius: 2, color: Colors.black26)
        ]),
        height:sizingInformation.isDesktop ? 0.5 : 0.25,
        width: sizingInformation.screenSize.width/2.25,
      ),
    );
  }
}
