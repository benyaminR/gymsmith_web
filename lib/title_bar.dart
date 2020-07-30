import 'package:flutter/material.dart';
import 'package:gymsmith_web/TextStyles/text_styles.dart';

class TitleBar extends StatelessWidget {
  final String title;

  const TitleBar({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 64),
        child: Container(
          alignment: Alignment.center,
          color: Colors.black,
          width: 364,
          height: 69,
          child: Text(title,
          style: roboto28BlackWhite,
          ),
        ),
      ),
    );
  }
}
