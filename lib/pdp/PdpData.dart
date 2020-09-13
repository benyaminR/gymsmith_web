import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:gymsmith_web/features/products/domain/entities/product.dart';

class PdpData extends Equatable{

  final String size;
  final String color;
  final String price;
  final Map<String,dynamic> colors;
  final Map<String,dynamic> images;
  final String description;
  final String name;
  final String databaseRef;

  PdpData({
    @required this.size,
    @required this.color,
    @required this.price,
    @required this.colors,
    @required this.images,
    @required this.description,
    @required this.name,
    @required this.databaseRef
  });

  factory PdpData.fromProduct(Product product){
    return PdpData(
      size: product.colors[product.previewColor][0],
      color: product.previewColor,
      price: product.price,
      colors: product.colors,
      images: product.images,
      description: product.description,
      name: product.name,
      databaseRef: product.databaseRef
    );
  }

  @override
  List<Object> get props => [size,color,price,colors,images,description,name,databaseRef];

}