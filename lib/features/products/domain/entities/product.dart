import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Product extends Equatable{
  final String description;
  final String name;
  final Map<String,dynamic> images;
  final String price;
  final bool isNew;
  final bool isAvailable;
  final List<dynamic> colors;
  final List<dynamic> sizes;
  final String databaseRef;

  Product({
    @required this.description,
    @required this.name,
    @required this.images,
    @required this.price,
    @required this.isAvailable,
    @required this.isNew,
    @required this.colors,
    @required this.sizes,
    @required this.databaseRef
  });

  @override
  List<Object> get props => [description,name,price,isNew,colors,sizes,databaseRef];

}