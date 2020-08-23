
import 'package:flutter/cupertino.dart';
import 'package:gymsmith_web/features/cart/data/model/cart_model.dart';
import 'package:gymsmith_web/features/cart/domain/entity/Cart.dart';
import 'package:shared_preferences/shared_preferences.dart';

@deprecated
abstract class CartLocalDataSource{
  final SharedPreferences sharedPreferences;

  CartLocalDataSource({@required this.sharedPreferences});

  Future<CartModel> get();
  Future<Cart> add(String item);
  Future<Cart> remove(String item);
}

@deprecated
class CartLocalDataSourceImpl extends CartLocalDataSource{

  final SharedPreferences sharedPreferences;

  CartLocalDataSourceImpl({@required this.sharedPreferences});

  @override
  Future<Cart> add(String item) async {
    var items = sharedPreferences.getStringList('cart') == null ? List<String>() : sharedPreferences.getStringList('cart');
    items.add(item);
    await sharedPreferences.setStringList('cart', items);
    return get();
  }


  @override
  Future<CartModel> get() {
    return Future.value(CartModel.fromSnapshot(sharedPreferences.getStringList('cart')));
  }


  @override
  Future<Cart> remove(String item) async {
    List<String> items = sharedPreferences.getStringList('cart');
    items.remove(item);
    await sharedPreferences.setStringList('cart', items);
    return get();
  }

}