
import 'package:flutter/cupertino.dart';
import 'package:gymsmith_web/features/cart/data/model/cart_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CartLocalDataSource{
  final SharedPreferences sharedPreferences;

  CartLocalDataSource({@required this.sharedPreferences});

  Future<CartModel> get();
  Future<String> add(String item);
  Future<String> remove(String item);
}

class CartLocalDataSourceImpl extends CartLocalDataSource{

  final SharedPreferences sharedPreferences;

  CartLocalDataSourceImpl({@required this.sharedPreferences});

  @override
  Future<String> add(String item) async {
    var items = sharedPreferences.getStringList('cart');
    items.add(item);
    await sharedPreferences.setStringList('cart', items);
    return Future.value(item);
  }


  @override
  Future<CartModel> get() {
    return Future.value(CartModel.fromSnapshot(sharedPreferences.getStringList('cart')));
  }


  @override
  Future<String> remove(String item) async {
    List<String> items = sharedPreferences.getStringList('cart');
    items.remove(item);
    await sharedPreferences.setStringList('cart', items);
    return Future.value(item);
  }

}