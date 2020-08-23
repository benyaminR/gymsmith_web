
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:gymsmith_web/features/cart/data/model/cart_model.dart';
import 'package:gymsmith_web/features/cart/domain/entity/Cart.dart';
import 'package:mockito/mockito.dart';

abstract class CartRemoteDataSource{
  Future<CartModel> get();
  Future<CartModel> add(CartItemData item);
  Future<CartModel> remove(CartItemData item);
}
class CartRemoteDataSourceImpl implements CartRemoteDataSource{
  final Firestore firestore;
  final FirebaseAuth firebaseAuth;
  CartRemoteDataSourceImpl({@required this.firebaseAuth,@required this.firestore});

  @override
  Future<CartModel> add(CartItemData item) async {
    //current user
    var user = (await firebaseAuth.currentUser()).uid;
    print(user);
    //add an auto generate item document to cart
    var currentItem = (await firestore.
        collection('users')
        .document(user)
        .collection('cart')
        .where('databaseRef',isEqualTo: item.databaseRef)
        .where('size',isEqualTo: item.size)
        .where('amount',isEqualTo: item.amount)
        .where('color',isEqualTo: item.color)
        .getDocuments());
    var exists = currentItem.documents.length >= 1;

    if(!exists) {
      await firestore.
      collection('users')
          .document(user)
          .collection('cart')
          .add({
        'databaseRef': item.databaseRef,
        'size': item.size,
        'amount': item.amount,
        'color': item.color
      });
    }else{
      int currentAmount = currentItem.documents[0].data['amount'];
      currentAmount++;
      await firestore.document(currentItem.documents[0].reference.path).updateData({
        'databaseRef': item.databaseRef,
        'size': item.size,
        'amount': currentAmount,
        'color': item.color
      });
    }
    return get();
  }

  @override
  Future<CartModel> get() async{
    var user = (await firebaseAuth.currentUser()).uid;
    var snapshot = await firestore.
    collection('users')
        .document(user)
        .collection('cart')
        .getDocuments();
    return CartModel.fromQuerySnapshot(snapshot);
  }

  @override
  Future<CartModel> remove(CartItemData item) async {
    var user = (await firebaseAuth.currentUser()).uid;

    var snapshot = await firestore
        .collection('users')
        .document(user)
        .collection('cart')
        .getDocuments();

    for(var snapshot in snapshot.documents){
      if(snapshot.data['item'] == item)
      {
        await firestore
            .collection('users')
            .document(user)
            .collection('cart')
            .document(snapshot.documentID)
            .delete();
        break;
      }
    }

  }

}