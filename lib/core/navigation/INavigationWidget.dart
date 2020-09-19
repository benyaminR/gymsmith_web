import 'package:responsive_builder/responsive_builder.dart';

abstract class INavigationWidget{
  /* get called before build to initialize sizingInformation
  * inside widget that is implementing this interface*/
  void onResponsiveness(SizingInformation sizingInformation);
}