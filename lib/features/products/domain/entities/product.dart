import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Product extends Equatable{
  final String description;
  final String name;
  final Map<String,dynamic> images;
  final String price;
  final bool isNew;
  final Map<String,dynamic> colors;
  final String databaseRef;
  final String previewColor;

  Product({
    @required this.description,
    @required this.name,
    @required this.images,
    @required this.price,
    @required this.isNew,
    @required this.colors,
    @required this.databaseRef,
    @required this.previewColor
  });

  @override
  List<Object> get props => [description,name,price,isNew,colors,databaseRef,previewColor];

}