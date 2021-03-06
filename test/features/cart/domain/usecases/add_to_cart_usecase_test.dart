

import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gymsmith_web/core/error/failure.dart';
import 'package:gymsmith_web/core/usecase/params.dart';
import 'package:gymsmith_web/features/cart/domain/entity/Cart.dart';
import 'package:gymsmith_web/features/cart/domain/repository/cart_repository.dart';
import 'package:gymsmith_web/features/cart/domain/usecases/add_to_cart_usecase.dart';
import 'package:mockito/mockito.dart';

class MockCartRepository extends Mock implements CartRepository{}

void main(){

  final cartRepository  = MockCartRepository();
  final addToCartUseCase = AddToCartUseCase(repository:cartRepository);
  final item = CartItemData(
    size: 'M',
    databaseRef: 'ref',
    amount: 20,
    color: 'red',
  );
  final cart = Cart();

  test('should add an item successfully to the cart', () async {
    //arrange
    when(cartRepository.add(item)).thenAnswer((_) async => Right(cart));
    //act
    var result = await addToCartUseCase(WithParams(param: item));
    //assert
    verify(cartRepository.add(item));
    expect(result, Right(cart));
    verifyNoMoreInteractions(cartRepository);
  });

  //TODO should increase amount not create a new item
  //TODO should create a new item not increase amount
}