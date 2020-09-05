
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:gymsmith_web/features/products/domain/entities/product.dart';

class ProductModel extends Product{
  ProductModel({
    @required description,
    @required name,
    @required images,
    @required price,
    @required isAvailable,
    @required isNew,
    @required colors,
    @required sizes,
    @required databaseRef
  }) : super(
      description:description,
      name:name,
      images:images,
      price:price,
      isAvailable:isAvailable,
      isNew:isNew,
      colors:colors,
      sizes:sizes,
      databaseRef:databaseRef
  );

  factory ProductModel.fromSnapshot(DocumentSnapshot snapshot){
    print('creating Product Model named ${snapshot.data['name']} located at ${snapshot.reference.path}');
    return ProductModel(
        description:snapshot.data['description'],
        name       :snapshot.data['name'],
        images     :snapshot.data['images'],
        price      :snapshot.data['price'],
        isAvailable:snapshot.data['isAvailable'],
        isNew      :snapshot.data['isNew'],
        colors     :snapshot.data['colors'],
        sizes      :snapshot.data['sizes'],
        databaseRef:snapshot.reference.path
    );
  }


}