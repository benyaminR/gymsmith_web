
import 'package:flutter/cupertino.dart';

class NonScrollBehavior extends ScrollBehavior{
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}