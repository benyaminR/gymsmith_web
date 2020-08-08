


import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gymsmith_web/core/usecase/params.dart';
import 'package:gymsmith_web/features/cart/domain/entity/Cart.dart';
import 'package:gymsmith_web/features/cart/domain/repository/cart_repository.dart';
import 'package:gymsmith_web/features/cart/domain/usecases/remove_from_the_cart_usecase.dart';
import 'package:mockito/mockito.dart';

class MockCartRepository extends Mock implements CartRepository{}

void main(){

  final cartRepository  = MockCartRepository();
  final removeFromCart = RemoveFromCartUseCase(repository:cartRepository);
  final item = 'itemDatabasePath';

  final cart = Cart();

  test('should remove an item successfully from the cart', () async {
    //arrange
    when(cartRepository.remove(item)).thenAnswer((_) async => Right(cart));
    //act
    var result = await removeFromCart(WithParams(param: item));
    //assert
    verify(cartRepository.remove(item));
    expect(result, Right(cart));
    verifyNoMoreInteractions(cartRepository);
  });

}
