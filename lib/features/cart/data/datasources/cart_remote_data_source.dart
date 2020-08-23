
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:gymsmith_web/features/cart/data/model/cart_model.dart';

abstract class CartRemoteDataSource{
  Future<CartModel> get();
  Future<CartModel> add(String item);
  Future<CartModel> remove(String item);
}
class CartRemoteDataSourceImpl implements CartRemoteDataSource{
  final Firestore firestore;
  final FirebaseAuth firebaseAuth;
  CartRemoteDataSourceImpl({@required this.firebaseAuth,@required this.firestore});

  //TODO Check whether the user is SignedIn and
  @override
  Future<CartModel> add(String item) async {
    //current user
    var user = (await firebaseAuth.currentUser()).uid;
    //add an auto generate item document to cart
    await firestore.
    collection('users')
        .document(user)
        .collection('cart')
        .add({
      'item' : item
    });
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
  Future<CartModel> remove(String item) async {
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