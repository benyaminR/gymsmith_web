import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:gymsmith_web/database_paths.dart';
import 'package:gymsmith_web/features/deals_of_the_day_list/data/models/items_model.dart';

abstract class ItemsRemoteDataSource {
  ///Gets a ItemsModel from the firebase cloud
  Future<ItemsModel> getItems();
}

class ItemsRemoteDataSourceImpl implements ItemsRemoteDataSource{
  final Firestore firestore;

  ItemsRemoteDataSourceImpl({@required this.firestore});

  @override
  Future<ItemsModel> getItems() {
    firestore.collection(Products_Path).getDocuments();
    return null;
  }

}