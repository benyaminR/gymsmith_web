
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:gymsmith_web/features/cart/domain/entity/Cart.dart';

class CartModel extends Cart implements Equatable{
  final List<String> items;
  CartModel({@required this.items}) : super(items:items);

  factory CartModel.fromSnapshot(List<String> snapshot){
    return CartModel(items: snapshot);
  }

  factory CartModel.fromQuerySnapshot(QuerySnapshot snapshot){
    List<String> items = [];
    snapshot.documents.forEach((element) => items.add(element['item'].toString()));
    return CartModel(items: items);
  }
}