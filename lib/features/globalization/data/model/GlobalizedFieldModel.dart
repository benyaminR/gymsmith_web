import 'package:flutter/cupertino.dart';
import 'package:gymsmith_web/features/globalization/domain/entities/GlobalizedField.dart';

class GlobalizedFieldModel extends GlobalizedField{

  final String value;

  GlobalizedFieldModel({@required this.value}) : super(value:value);

}