import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Cart extends Equatable{

  final List<String> items;

  Cart({@required this.items});

  @override
  List<Object> get props => items;


}