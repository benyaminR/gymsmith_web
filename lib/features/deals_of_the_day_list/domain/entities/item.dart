import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Item extends Equatable{
  final String description;
  final String name;
  final List<String> images;
  final double price;
  final bool isNew;
  final bool isAvailable;
  final List<String> colors;
  final List<String> sizes;

  Item({
    @required this.description,
    @required this.name,
    @required this.images,
    @required this.price,
    @required this.isAvailable,
    @required this.isNew,
    @required this.colors,
    @required this.sizes
  });

  @override
  List<Object> get props => [description,name,price,isNew,colors,sizes];

}