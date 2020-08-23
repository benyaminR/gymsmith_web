import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gymsmith_web/core/error/failure.dart';
import 'package:gymsmith_web/core/usecase/no_params.dart';
import 'package:gymsmith_web/core/usecase/params.dart';
import 'package:gymsmith_web/features/products/domain/entities/product.dart';
import 'package:gymsmith_web/features/products/domain/entities/products.dart';
import 'package:gymsmith_web/features/products/domain/usecases/get_deals_of_the_day_usecase.dart';
import 'package:gymsmith_web/features/products/domain/usecases/get_product_usecase.dart';
import 'package:gymsmith_web/features/products/presenation/deals_of_the_day/products_bloc.dart';
import 'package:mockito/mockito.dart';

class MockGetDealsOfTheDayUseCase extends Mock implements GetDealsOfTheDayUsecase{}

class MockGetProductUseCase extends Mock implements GetProductUseCase{}

void main() {

  GetDealsOfTheDayUsecase getDealsOfTheDayUsecase;
  GetProductUseCase getProductUseCase;
  ProductsBloc bloc;

  setUp((){

    getDealsOfTheDayUsecase = MockGetDealsOfTheDayUseCase();
    getProductUseCase = MockGetProductUseCase();
    bloc = ProductsBloc(InitialDealsOfTheDayState(),getDealsOfTheDayUsecase: getDealsOfTheDayUsecase,getProductUseCase:getProductUseCase);
  });

  group('ProductsBloc ', () {
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
        bloc.emit(LoadedDealsOfTheDay());
        //assert
        expectLater(bloc.state, isA<LoadedDealsOfTheDay>());
      });
    });

    group('DealsOfTheDay ', (){
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
          LoadedDealsOfTheDay(products: items)
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
    });

    group('GetProduct ', (){
      test('should emit in order [Loading, LoadedProduct]', () async{

        //arrange
        var documentRef = 'ref';
        var product = Product();
        when(getProductUseCase(WithParams(param: documentRef))).thenAnswer((_) async => Right(product));
        var expected = [
          Loading(),
          LoadedProduct(product: product)
        ];
        //act
        bloc.add(GetProductEvent(documentRef: documentRef));
        //assert
        await expectLater(bloc, emitsInOrder(expected));
        verify(getProductUseCase(WithParams(param: documentRef)));
        verifyNoMoreInteractions(getProductUseCase);
      });
    });

    test('should emit in order [Loading,Error]', (){
      //arrange
      var serverFailure = ServerFailure();
      var documentRef = 'ref';
      when(getProductUseCase(WithParams(param: documentRef))).thenAnswer((_) async => Left(serverFailure));
      //act
      final expected = [
        Loading(),
        Error(msg: ProductsBloc.Server_Failure)
      ];
      //act
      bloc.add(GetProductEvent(documentRef: documentRef));
      //assert
      expectLater(bloc, emitsInOrder(expected));
    });

  });

}