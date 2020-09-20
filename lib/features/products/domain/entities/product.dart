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

  String getARandomAvailableSize() {
    var sizes = (colors[previewColor] as Map<String,dynamic>);
    for(var pair in sizes.entries){
      if(pair.value)
        return pair.key;
    }
    return null;
  }

  @override
  List<Object> get props => [description,name,price,isNew,colors,databaseRef,previewColor];

  bool isPreviewColorAvailable() {
    var sizes = colors[previewColor] as Map<String,dynamic>;
    for(var size in sizes.entries)
      if(size.value)
        return true;
    return false;
  }

  String getAnAvailableColorForPreviewColor() {
    var sizes = colors[previewColor] as Map<String,dynamic>;
    for(var size in sizes.entries)
      if(size.value)
        return size.key;
    throw Exception('Impossible Error!');
  }

}