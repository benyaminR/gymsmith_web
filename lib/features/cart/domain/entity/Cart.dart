import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:gymsmith_web/features/products/domain/entities/product.dart';

class Cart extends Equatable{

  final List<CartItemData> items;

  Cart({@required this.items});

  @override
  List<Object> get props => items;
}


class CartItemData extends Equatable{
  final String databaseRef;
  final String size;
  final String color;
  final int amount;

  CartItemData({@required this.databaseRef,@required this.size,@required this.color,@required this.amount});

  @override
  List<Object> get props => [databaseRef,size,color,amount];

  factory CartItemData.fromSnapshot(DocumentSnapshot snapshot){
    return CartItemData(
      databaseRef : snapshot['databaseRef'] ,
      size : snapshot['size'],
      color :  snapshot['color'],
      amount : snapshot['amount']
    );
  }

  factory CartItemData.fromItem(Product item){
    return CartItemData(
      color: item.colors[0],
      amount: 1,
      databaseRef: item.databaseRef,
      size: item.sizes[0]
    );
  }
}