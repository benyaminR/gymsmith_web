
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:gymsmith_web/features/cart/domain/entity/Cart.dart';

class CartModel extends Cart implements Equatable{
  final List<CartItemData> items;
  CartModel({@required this.items}) : super(items:items);

  factory CartModel.fromQuerySnapshot(QuerySnapshot snapshot){
    List<CartItemData> items = [];
    snapshot.documents.forEach((element) => items.add(CartItemData.fromSnapshot(element)));
    return CartModel(items: items);
  }
}