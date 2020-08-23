import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:gymsmith_web/features/products/domain/entities/product.dart';
import 'package:gymsmith_web/features/products/domain/entities/products.dart';

class ProductsModel extends Products implements Equatable{
  ProductsModel({
    @required items,}) : super(
      items:items,
  );

   factory ProductsModel.fromSnapshot(QuerySnapshot snapshot){
     List<Product> items = List<Product>();
     snapshot.documents.forEach((element) {items.add(Product(
       colors: element.data['colors'],
       description:element.data['description'] ,
       images: element.data['images'],
       isAvailable:element.data['isAvailable'],
       isNew: element.data['isNew'],
       name: element.data['name'],
       price: element.data['price'],
       sizes:element.data['sizes'] ,
       databaseRef: element.reference.path
      ));
     });
     return ProductsModel(items: items);
   }
}