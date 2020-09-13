
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:gymsmith_web/features/products/domain/entities/product.dart';

class ProductModel extends Product{
  ProductModel({
    @required description,
    @required name,
    @required images,
    @required price,
    @required isNew,
    @required colors,
    @required databaseRef,
    @required previewColor
  }) : super(
      description:description,
      name:name,
      images:images,
      price:price,
      isNew:isNew,
      colors:colors,
      databaseRef:databaseRef,
      previewColor:previewColor
  );

  factory ProductModel.fromSnapshot(DocumentSnapshot snapshot){
    return ProductModel(
        description:snapshot.data['description'],
        name       :snapshot.data['name'],
        images     :snapshot.data['images'],
        price      :snapshot.data['price'],
        isNew      :snapshot.data['isNew'],
        colors     :snapshot.data['colors'],
        databaseRef:snapshot.reference.path,
        previewColor:snapshot.data['previewColor']
    );
  }


}