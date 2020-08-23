import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:gymsmith_web/core/utils/database_paths.dart';
import 'package:gymsmith_web/features/products/data/models/products_model.dart';

abstract class ProductsRemoteDataSource {
  Future<ProductsModel> getProducts();
}

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource{
  final Firestore firestore;

  ProductsRemoteDataSourceImpl({@required this.firestore});

  @override
  Future<ProductsModel> getProducts() async{
    return Future.value(ProductsModel.fromSnapshot( await firestore.collection(Products_Path).getDocuments()));
  }
}