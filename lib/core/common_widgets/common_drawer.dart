import 'package:flutter/material.dart';
import 'package:gymsmith_web/core/utils/Colors/color_swatches.dart';
import 'package:gymsmith_web/core/utils/TextStyles/text_styles.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CommonDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
          width: 100,
          child: Drawer(
            child: Container(
              color: Black,
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  ListTile(
                      title: Text('Alle',style: roboto16WhiteBold,)),
                  ListTile(
                      title: Text('T-Shirts',style: roboto16WhiteBold)
                  ),
                  ListTile(
                      title: Text('Shorts',style: roboto16WhiteBold)
                  ),
                  ListTile(
                      title: Text('Hoodies',style: roboto16WhiteBold)
                  ),
                  ListTile(
                      title: Text('Stringers',style: roboto16WhiteBold)
                  ),
                ],
              ),
            ),
          ),
        );
  }
}
