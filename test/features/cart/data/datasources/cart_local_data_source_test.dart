

import 'package:flutter_test/flutter_test.dart';
import 'package:gymsmith_web/features/cart/data/datasources/cart_local_data_source.dart';
import 'package:gymsmith_web/features/cart/data/model/cart_model.dart';
import 'package:gymsmith_web/features/cart/domain/entity/Cart.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockSharedPreferences extends Mock implements SharedPreferences{}
void main() {
  final sharedPreferences = MockSharedPreferences();
  final dataSource = CartLocalDataSourceImpl(sharedPreferences: sharedPreferences);

  group('test CartLocalDatSource', (){
    final items = ['item1', 'item2', 'item3'];
    final newCart = ['item1', 'item2', 'items3','items4'];
    final removedCart = ['item1', 'item2'];

    setUp(() async {
      when(sharedPreferences.getStringList('cart')).thenAnswer((_) => items);
    });

    test('should add an item', () async{
      //arrange
      when(sharedPreferences.setStringList('cart', newCart)).thenAnswer((_) async => true);
      when(sharedPreferences.getStringList('cart')).thenAnswer((_) => items);
      //act
      var res = await dataSource.add(newCart[3]);
      //assert
      verify(sharedPreferences.getStringList('cart'));
      expect(res,isA<CartModel>());
    });

    test('should remove an item', () async{
      //arrange
      var removeTarget = 'item3';
      when(sharedPreferences.setStringList('cart', removedCart)).thenAnswer((_) async => true);
      //act
      var result = await dataSource.remove(removeTarget);
      //assert
      verify(sharedPreferences.getStringList('cart'));
      expect(result,isA<CartModel>());
    });

    test('should get a CartModel', () async{
      //act
      var result = await dataSource.get();
      //assert
      verify(sharedPreferences.getStringList('cart'));
      expect(result,isA<CartModel>());
    });

  });

}