
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gymsmith_web/core/error/exception.dart';
import 'package:gymsmith_web/core/error/failure.dart';
import 'package:gymsmith_web/features/cart/data/datasources/cart_local_data_source.dart';
import 'package:gymsmith_web/features/cart/data/model/cart_model.dart';
import 'package:gymsmith_web/features/cart/data/repository/cart_repository_impl.dart';
import 'package:gymsmith_web/features/cart/domain/entity/Cart.dart';
import 'package:mockito/mockito.dart';

class MockCartLocalDataSource extends Mock implements CartLocalDataSource{}

void main() {
  final dataSource = MockCartLocalDataSource();
  final repo = CartRepositoryImpl(dataSource: dataSource);

  final cartItem = 'itemPath';
  final cart = Cart();

  group('Repository ', () {

    group('Add ', () {

      test('should handle Failure', () async{
        //arrange
        when(dataSource.add(cartItem)).thenThrow(ServerException());
        //act
        var res = await repo.add(cartItem);
        //assert
        expect(res, Left(ServerFailure()));
      });

      test('should add successfully', () async{
        //arrange
        when(dataSource.add(cartItem)).thenAnswer((_) async => cart);
        var expected = await dataSource.add(cartItem);
        //act
        var res = await repo.add(cartItem);
        //assert
        verify(dataSource.add(cartItem));
        expect(res, Right(expected));

      });

    });

    group('Get ', () {
      test('should handle Failure', () async{
        //arrange
        when(dataSource.get()).thenThrow(ServerException());
        //act
        var res = await repo.get();
        //assert
        expect(res, Left(ServerFailure()));
      });

      test('should get successfully', () async{
        //arrange
        final itemsList = ['item1','items2'];
        final cartModel = CartModel.fromSnapshot(itemsList);
        when(dataSource.get()).thenAnswer((_) async => cartModel);
        var expected = await dataSource.get();
        //act
        var res = await repo.get();
        //assert
        verify(dataSource.get());
        expect(res, Right(expected));
      });
    });

  });

  group('Remove ', () {

    test('should handle Failure', () async{

      //arrange
      when(dataSource.remove(cartItem)).thenThrow(ServerException());
      //act
      var res = await repo.remove(cartItem);
      //assert
      expect(res, Left(ServerFailure()));

    });

    test('should remove successfully', () async{
      //arrange
      when(dataSource.remove(cartItem)).thenAnswer((_) async => cart);
      var expected =  await dataSource.remove(cartItem);
      //act
      var res =  await repo.remove(cartItem);
      //assert
      verify(dataSource.remove(cartItem));
      expect(res, Right(expected));
    });
  });
}
