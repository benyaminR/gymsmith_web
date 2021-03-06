import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:gymsmith_web/features/products/domain/entities/product.dart';
import 'package:gymsmith_web/pdp/PdpData.dart';

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
  final String price;
  CartItemData({@required this.databaseRef,@required this.size,@required this.color,@required this.amount,@required this.price});

  @override
  List<Object> get props => [databaseRef,size,color,amount];

  factory CartItemData.fromSnapshot(DocumentSnapshot snapshot){
    return CartItemData(
        databaseRef : snapshot['databaseRef'] ,
        size : snapshot['size'],
        color :  snapshot['color'],
        amount : snapshot['amount'],
        price: snapshot['price']
    );
  }

  factory CartItemData.fromItem(Product item){
    return CartItemData(
      color: item.previewColor,
      amount: 1,
      databaseRef: item.databaseRef,
      size: item.getAnAvailableColorForPreviewColor(),
      price: item.price
    );
  }

  factory CartItemData.fromPdpData(PdpData pdpData){
    return CartItemData(
        databaseRef: pdpData.databaseRef,
        size: pdpData.size,
        color: pdpData.color,
        amount: 1,
        price: pdpData.price
    );
  }
}