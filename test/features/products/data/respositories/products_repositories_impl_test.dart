

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gymsmith_web/core/error/exception.dart';
import 'package:gymsmith_web/core/error/failure.dart';
import 'package:gymsmith_web/core/networking/network_info.dart';
import 'package:gymsmith_web/features/products/data/datasources/products_remote_datasource.dart';
import 'package:gymsmith_web/features/products/data/models/product_model.dart';
import 'package:gymsmith_web/features/products/data/models/products_model.dart';
import 'package:gymsmith_web/features/products/data/respositories/products_repository_implementation.dart';
import 'package:mockito/mockito.dart';

class MockItemsRemoteDataSource extends Mock implements ProductsRemoteDataSource{}

class MockNetworkInfo extends Mock implements NetworkInfo{}

void main(){
  ProductsRepositoryImplementation itemsRepositoryImplementation;
  MockItemsRemoteDataSource mockItemsRemoteDataSource;
  MockNetworkInfo mockNetworkInfo;

  setUp((){
    mockItemsRemoteDataSource = MockItemsRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    itemsRepositoryImplementation = ProductsRepositoryImplementation(
        datasource:mockItemsRemoteDataSource,
        networkInfo:mockNetworkInfo
    );
  });

  group('getItems', (){
    final ProductsModel itemsModel = ProductsModel();

    test('should check for connectivity', () async {

      //arrange
      when(mockNetworkInfo.isConnected()).thenAnswer((_) async => true);

      //act
      itemsRepositoryImplementation.getDealsOfTheDay();

      //assert
      verify(mockNetworkInfo.isConnected());
    });

    group('user is online ', (){
      setUp((){
        when(mockNetworkInfo.isConnected()).thenAnswer((_) async => true);
      });
      test('should return a valid Items entity when the call to itemsRepositoryImplementation is success', () async {

        //arrange
        when(mockItemsRemoteDataSource.getDealsOfTheDay()).thenAnswer((_) async => itemsModel);
        //act
        final result = await itemsRepositoryImplementation.getDealsOfTheDay();

        //assert
        verify(mockItemsRemoteDataSource.getDealsOfTheDay());
        expect(result, Right(itemsModel));

      });

      test('should return Failure when the call to itemsRepositoryImplementation is unsucceseful', () async {

        //arrange
        when(mockItemsRemoteDataSource.getDealsOfTheDay()).thenThrow(ServerException());
        //act
        final result = await itemsRepositoryImplementation.getDealsOfTheDay();

        //assert
        verify(mockItemsRemoteDataSource.getDealsOfTheDay());
        expect(result, Left(ServerFailure()));

      });
    });

    group('user is offline', (){
      setUp((){
        when(mockNetworkInfo.isConnected()).thenAnswer((_) async => false);
      });

      test('should return OfflineFailure when the call to Repository is a success', () async{
        //act
        final result = await itemsRepositoryImplementation.getDealsOfTheDay();
        //assert
        expect(result, Left(OfflineFailure()));
      });

    });

  });


  group('GetProduct ', (){
    final documentRef = 'path';
    final productModel = ProductModel();
    test('should return Product', () async{
      //arrange
      when(mockItemsRemoteDataSource.getProduct(documentRef)).thenAnswer((_) async => productModel);
      //act
      var actual = await itemsRepositoryImplementation.getProduct(documentRef);
      //assert
      expect(actual, Right(productModel));
      verify(mockItemsRemoteDataSource.getProduct(documentRef));
      verifyNoMoreInteractions(mockItemsRemoteDataSource);
    });

    test('should deal with serverException', () async {
      //arrange
      when(mockItemsRemoteDataSource.getProduct(documentRef)).thenThrow(ServerException());
      //act
      final result = await itemsRepositoryImplementation.getProduct(documentRef);
      //assert
      expect(result, Left(ServerFailure()));
      verify(mockItemsRemoteDataSource.getProduct(documentRef));
      verifyNoMoreInteractions(mockItemsRemoteDataSource);
    });

  });
}