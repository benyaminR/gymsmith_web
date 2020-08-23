import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:gymsmith_web/core/utils/database_paths.dart';
import 'package:gymsmith_web/features/products/data/models/product_model.dart';
import 'package:gymsmith_web/features/products/data/models/products_model.dart';

abstract class ProductsRemoteDataSource {
  Future<ProductsModel> getDealsOfTheDay();
  Future<ProductModel> getProduct(String documentRef);
}

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource{
  final Firestore firestore;

  ProductsRemoteDataSourceImpl({@required this.firestore});

  @override
  Future<ProductsModel> getDealsOfTheDay() async => ProductsModel.fromSnapshot( await firestore.collection(Products_Path).getDocuments());


  @override
  Future<ProductModel> getProduct(String documentRef) async => ProductModel.fromSnapshot( await firestore.document(documentRef).get() );
}