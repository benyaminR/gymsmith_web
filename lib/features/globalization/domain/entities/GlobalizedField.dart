import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class GlobalizedField extends Equatable{

  final String value;

  GlobalizedField({@required this.value});

  @override
  List<Object> get props => [value];

}