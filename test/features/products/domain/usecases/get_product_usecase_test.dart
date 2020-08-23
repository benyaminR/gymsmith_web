

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gymsmith_web/core/usecase/params.dart';
import 'package:gymsmith_web/features/products/domain/entities/product.dart';
import 'package:gymsmith_web/features/products/domain/repositories/products_repository.dart';
import 'package:gymsmith_web/features/products/domain/usecases/get_product_usecase.dart';
import 'package:mockito/mockito.dart';

class MockItemsRepository extends Mock implements ProductsRepository{}

void main() {
  MockItemsRepository repository;
  GetProductUseCase getProductUseCase;

  setUp((){
    repository = MockItemsRepository();
    getProductUseCase = GetProductUseCase(repo : repository);
  });

  group('GetProductUseCase ', (){
    final Product product = Product();
    final productPath = 'product';
    test('should get Product', () async {
      //arrange
      when(repository.getProduct(productPath)).thenAnswer((_) async => Right(product));
      //act
      var actual = await getProductUseCase(WithParams(param: productPath));
      //assert
      expect(actual, Right(product));
      verify(repository.getProduct(productPath));
      verifyNoMoreInteractions(repository);
    });

  });


}