import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Item extends Equatable{
  final String description;
  final String delivery;
  final String name;
  final double price;
  final bool isNew;
  final List<String> colors;
  final List<String> sizes;

  Item({
    @required this.description,
    @required this.delivery,
    @required this.name,
    @required this.price,
    @required this.isNew,
    @required this.colors,
    @required this.sizes
  });

  @override
  List<Object> get props => [description,delivery,name,price,isNew,colors,sizes];


}