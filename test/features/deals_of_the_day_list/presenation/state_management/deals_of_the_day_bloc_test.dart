import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gymsmith_web/core/error/failure.dart';
import 'package:gymsmith_web/core/usecase/no_params.dart';
import 'package:gymsmith_web/features/deals_of_the_day_list/domain/entities/items.dart';
import 'package:gymsmith_web/features/deals_of_the_day_list/domain/usecases/get_deals_of_the_day_usecase.dart';
import 'package:gymsmith_web/features/deals_of_the_day_list/presenation/deals_of_the_day/deals_of_the_day_bloc.dart';
import 'package:mockito/mockito.dart';

class MockGetDealsOfTheDayUseCase extends Mock implements GetDealsOfTheDayUsecase{}


void main() {

  GetDealsOfTheDayUsecase getDealsOfTheDayUsecase;
  DealsOfTheDayBloc bloc;
  setUp((){

    getDealsOfTheDayUsecase = MockGetDealsOfTheDayUseCase();
    bloc = DealsOfTheDayBloc(InitialDealsOfTheDayState(),getDealsOfTheDayUsecase: getDealsOfTheDayUsecase);
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
    var items = Items();
    when(getDealsOfTheDayUsecase(NoParams())).thenAnswer((_) async => Right(items));
    //act
    bloc.add(GetDealsOfTheDay());
    await untilCalled(getDealsOfTheDayUsecase(NoParams()));
    //assert
    verify(getDealsOfTheDayUsecase(NoParams()));

  });

  test('should emit [Empty, Loading, Loaded]', () async{
    //arrange
    var items = Items();
    when(getDealsOfTheDayUsecase(NoParams())).thenAnswer((_) async => Right(items));
    //act
    final expected = [
      Loading(),
      Loaded()
    ];

    //act
    bloc.add(GetDealsOfTheDay());
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
      Error(msg: DealsOfTheDayBloc.Server_Failure)
    ];
    //act
    bloc.add(GetDealsOfTheDay());
    //assert
    expectLater(bloc, emitsInOrder(expected));


  });

}