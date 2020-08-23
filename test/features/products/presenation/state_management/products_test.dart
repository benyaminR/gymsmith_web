import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gymsmith_web/core/error/failure.dart';
import 'package:gymsmith_web/core/usecase/no_params.dart';
import 'package:gymsmith_web/features/products/domain/entities/products.dart';
import 'package:gymsmith_web/features/products/domain/usecases/get_deals_of_the_day_usecase.dart';
import 'package:gymsmith_web/features/products/presenation/deals_of_the_day/products_bloc.dart';
import 'package:mockito/mockito.dart';

class MockGetDealsOfTheDayUseCase extends Mock implements GetDealsOfTheDayUsecase{}


void main() {

  GetDealsOfTheDayUsecase getDealsOfTheDayUsecase;
  ProductsBloc bloc;

  setUp((){

    getDealsOfTheDayUsecase = MockGetDealsOfTheDayUseCase();
    bloc = ProductsBloc(InitialDealsOfTheDayState(),getDealsOfTheDayUsecase: getDealsOfTheDayUsecase);
  });

  group('should changes states', (){
    test('should return Empty state', () async{
      expect(bloc.initialState, isA<InitialDealsOfTheDayState>());
    });

    test('should change state when loading', () async{
      //act
      bloc.emit(Loading());
      //assert
      expectLater(bloc.state, isA<Loading>());

    });

    test('should change state when loaded', () async{
      //act
      bloc.emit(Loaded());
      //assert
      expectLater(bloc.state, isA<Loaded>());
    });
  });

  test('should get data from GetDealsOfTheDay', () async{
    //arrange
    var items = Products();
    when(getDealsOfTheDayUsecase(NoParams())).thenAnswer((_) async => Right(items));
    //act
    bloc.add(GetDealsOfTheDayEvent());
    await untilCalled(getDealsOfTheDayUsecase(NoParams()));
    //assert
    verify(getDealsOfTheDayUsecase(NoParams()));

  });

  test('should emit [Empty, Loading, Loaded]', () async{
    //arrange
    var items = Products();
    when(getDealsOfTheDayUsecase(NoParams())).thenAnswer((_) async => Right(items));
    //act
    final expected = [
      Loading(),
      Loaded(items: items)
    ];

    //act
    bloc.add(GetDealsOfTheDayEvent());

    //assert
    expectLater(bloc, emitsInOrder(expected));

  });

  test('should emit [Loading, Error] and show the right error message', () async{
    //arrange
    var serverFailure = ServerFailure();
    when(getDealsOfTheDayUsecase(NoParams())).thenAnswer((_) async => Left(serverFailure));
    //act
    final expected = [
      Loading(),
      Error(msg: ProductsBloc.Server_Failure)
    ];
    //act
    bloc.add(GetDealsOfTheDayEvent());
    //assert
    expectLater(bloc, emitsInOrder(expected));


  });

}