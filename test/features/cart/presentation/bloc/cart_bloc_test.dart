
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gymsmith_web/core/error/failure.dart';
import 'package:gymsmith_web/core/usecase/no_params.dart';
import 'package:gymsmith_web/core/usecase/params.dart';
import 'package:gymsmith_web/features/cart/domain/entity/Cart.dart';
import 'package:gymsmith_web/features/cart/domain/usecases/add_to_cart_usecase.dart';
import 'package:gymsmith_web/features/cart/domain/usecases/get_cart_usecase.dart';
import 'package:gymsmith_web/features/cart/domain/usecases/remove_from_the_cart_usecase.dart';
import 'package:gymsmith_web/features/cart/presentation/bloc/cart/cart_bloc.dart';
import 'package:mockito/mockito.dart';


class MockAddUseCase extends Mock implements AddToCartUseCase{}
class MockRemoveUseCase extends Mock implements RemoveFromCartUseCase{}
class MockGetUseCase extends Mock implements GetCartUseCase{}

void main() {
  final addUsecase = MockAddUseCase();
  final removeUsecase = MockRemoveUseCase();
  final getUseCase = MockGetUseCase();

  final cartBloc = CartBloc(initialState: InitialCartState(),addToCartUseCase: addUsecase,getCartUseCase: getUseCase,removeFromCartUseCase: removeUsecase);

  group('CartBloc',(){
    final item = CartItemData(
      size: 'M',
      databaseRef: 'ref',
      amount: 23,
      color: 'Red'
    );
    final cart = Cart();

    group('Remove',(){

      test('should return updated Cart back', () async {
        //arrange
        when(removeUsecase(WithParams(param: item))).thenAnswer((_) async => Right(cart));

        //act
        cartBloc.add(RemoveItemFromCartEvent(item: item));
        await untilCalled(removeUsecase(WithParams(param: item)));
        //assert
        verify(removeUsecase(WithParams(param: item)));
        expectLater(cartBloc, emits(CartRemoveState()));

      });

      test('Should handle Error', () async{
        //arrange
        when(removeUsecase(WithParams(param: item))).thenAnswer((_) async => Left(ServerFailure()));
        cartBloc.add(RemoveItemFromCartEvent(item: item));

        //act
        await untilCalled(removeUsecase(WithParams(param: item)));

        //assert
        expectLater(cartBloc, emits(CartFailureState()));
      });

      test('should emit [ CartRemoveState, CartUpdatedState ]',() async{

        //arrange
        when(removeUsecase(WithParams(param: item))).thenAnswer((_) async => Right(cart));

        //act
        cartBloc.add(RemoveItemFromCartEvent(item: item));
        await untilCalled(removeUsecase(WithParams(param: item)));
        final expected = [CartRemoveState(),CartUpdatedState(updatedCart: cart)];
        //assert
        verify(removeUsecase(WithParams(param: item)));
        expectLater(cartBloc,emitsInOrder(expected));

      });

    });

    group('Add',(){

      test('should return updated Cart back', () async {

        //arrange
        final item = CartItemData(
            size: 'M',
            databaseRef: 'ref',
            amount: 23,
            color: 'Red'
        );        when(addUsecase(WithParams(param: item))).thenAnswer((_) async => Right(cart));

        //act
        cartBloc.add(AddItemToCartEvent(item: item));
        await untilCalled(addUsecase(WithParams(param: item)));
        //assert
        verify(addUsecase(WithParams(param: item)));
        expectLater(cartBloc, emits(CartAddState()));

      });

      test('Should handle Error', () async {
        //arrange
        final item = CartItemData(
            size: 'M',
            databaseRef: 'ref',
            amount: 23,
            color: 'Red'
        );        when(addUsecase(WithParams(param: item))).thenAnswer((_) async => Left(ServerFailure()));
        cartBloc.add(AddItemToCartEvent(item: item));

        //act
        await untilCalled(addUsecase(WithParams(param: item)));

        //assert
        expectLater(cartBloc, emits(CartFailureState()));
      });

      test('should emit [CartAddState, CartUpdatedState]',() async{
        //arrange
        when(addUsecase(WithParams(param: item))).thenAnswer((_) async => Right(cart));

        //act
        cartBloc.add(AddItemToCartEvent(item: item));
        await untilCalled(addUsecase(WithParams(param: item)));
        final expected = [CartAddState(),CartUpdatedState(updatedCart: cart)];
        //assert
        verify(addUsecase(WithParams(param: item)));
        expectLater(cartBloc,emitsInOrder(expected));

      });

    });

    group('Get',(){

      test('should return updated cart back', () async {

        //arrange
        final cart = Cart();
        when(getUseCase(NoParams())).thenAnswer((_) async => Right(cart));

        //act
        cartBloc.add(GetCartEvent());
        await untilCalled(getUseCase(NoParams()));
        //assert
        verify(getUseCase(NoParams()));
        expectLater(cartBloc, emits(CartGetState()));

      });

      test('Should handle Error', () async {
        //arrange
        when(getUseCase(NoParams())).thenAnswer((_) async => Left(ServerFailure()));
        cartBloc.add(GetCartEvent());
        //act
        await untilCalled(getUseCase(NoParams()));
        //assert
        expectLater(cartBloc, emits(CartFailureState()));
      });

      test('should emit [CartGetState, CartUpdatedState]',() async{
        //arrange
        when(getUseCase(NoParams())).thenAnswer((_) async => Right(cart));

        //act
        cartBloc.add(GetCartEvent());
        await untilCalled(getUseCase(NoParams()));
        final expected = [CartGetState(),CartUpdatedState(updatedCart: cart)];
        //assert
        verify(getUseCase(NoParams()));
        expectLater(cartBloc,emitsInOrder(expected));

      });

    });

  });

}