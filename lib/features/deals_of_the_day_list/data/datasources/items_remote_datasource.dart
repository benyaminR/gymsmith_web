import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:gymsmith_web/features/deals_of_the_day_list/data/models/items_model.dart';
import 'package:gymsmith_web/utils/database_paths.dart';

abstract class ItemsRemoteDataSource {
  Future<ItemsModel> getItems();
}

class ItemsRemoteDataSourceImpl implements ItemsRemoteDataSource{
  final Firestore firestore;

  ItemsRemoteDataSourceImpl({@required this.firestore});

  @override
  Future<ItemsModel> getItems() async{
    return Future.value(ItemsModel.fromSnapshot( await firestore.collection(Products_Path).getDocuments()));
  }
}