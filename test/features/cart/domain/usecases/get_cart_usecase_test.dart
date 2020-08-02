import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gymsmith_web/core/usecase/no_params.dart';
import 'package:gymsmith_web/features/cart/domain/entity/Cart.dart';
import 'package:gymsmith_web/features/cart/domain/repository/cart_repository.dart';
import 'package:gymsmith_web/features/cart/domain/usecases/get_cart_usecase.dart';
import 'package:mockito/mockito.dart';

class MockCartRepository extends Mock implements CartRepository{}

void main(){

  final cartRepository  = MockCartRepository();
  final getCartUseCase = GetCartUseCase(repository:cartRepository);
  final cart = Cart();
  test('should return a cart', () async {

    //arrange
    when(cartRepository.get()).thenAnswer((_) async => Right(cart));
    //act
    var result = await getCartUseCase(NoParams());
    //assert
    verify(cartRepository.get());
    expect(result, Right(cart));
    verifyNoMoreInteractions(cartRepository);
  });

}