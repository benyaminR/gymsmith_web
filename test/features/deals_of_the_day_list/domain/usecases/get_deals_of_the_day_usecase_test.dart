import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gymsmith_web/features/deals_of_the_day_list/domain/entities/items.dart';
import 'package:gymsmith_web/features/deals_of_the_day_list/domain/repositories/items_repository.dart';
import 'package:gymsmith_web/features/deals_of_the_day_list/domain/usecases/get_deals_of_the_day_usecase.dart';
import 'package:mockito/mockito.dart';

class MockItemsRepository extends Mock implements ItemsRepository{}

void main(){

  MockItemsRepository repository;
  GetDealsOfTheDayUsecase getDealsOfTheDayUsecase;

  setUp((){
    repository = MockItemsRepository();
    getDealsOfTheDayUsecase = GetDealsOfTheDayUsecase(repository : repository);
  });

  Items items = Items(items: []);

  test('It should get a list of items from the ItemsRepository',
      () async{

        //arrange
        when(repository.getItems()).thenAnswer((_) async => Right(items));

        //act
        final result = await getDealsOfTheDayUsecase.execute();

        //assert
        expect(result, Right(items));
        verify(repository.getItems());
        verifyNoMoreInteractions(repository);
    }
  );
}
