import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gymsmith_web/core/usecase/no_params.dart';
import 'package:gymsmith_web/features/products/domain/entities/products.dart';
import 'package:gymsmith_web/features/products/domain/repositories/products_repository.dart';
import 'package:gymsmith_web/features/products/domain/usecases/get_deals_of_the_day_usecase.dart';
import 'package:mockito/mockito.dart';

class MockItemsRepository extends Mock implements ProductsRepository{}

void main(){

  MockItemsRepository repository;
  GetDealsOfTheDayUsecase getDealsOfTheDayUsecase;

  setUp((){
    repository = MockItemsRepository();
    getDealsOfTheDayUsecase = GetDealsOfTheDayUsecase(repository : repository);
  });

  Products items = Products(items: []);

  test('It should get a list of items from the ItemsRepository',
      () async{

        //arrange
        when(repository.getItems()).thenAnswer((_) async => Right(items));

        //act
        final result = await getDealsOfTheDayUsecase(NoParams());

        //assert
        expect(result, Right(items));
        verify(repository.getItems());
        verifyNoMoreInteractions(repository);
    }
  );
}
