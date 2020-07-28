

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gymsmith_web/core/error/exception.dart';
import 'package:gymsmith_web/core/error/failure.dart';
import 'package:gymsmith_web/core/networking/network_info.dart';
import 'package:gymsmith_web/features/deals_of_the_day_list/data/datasources/items_remote_datasource.dart';
import 'package:gymsmith_web/features/deals_of_the_day_list/data/models/items_model.dart';
import 'package:gymsmith_web/features/deals_of_the_day_list/data/respositories/items_repository_implementation.dart';
import 'package:mockito/mockito.dart';

class MockItemsRemoteDataSource extends Mock implements ItemsRemoteDataSource{}

class MockNetworkInfo extends Mock implements NetworkInfo{}

void main(){
  ItemsRepositoryImplementation itemsRepositoryImplementation;
  MockItemsRemoteDataSource mockItemsRemoteDataSource;
  MockNetworkInfo mockNetworkInfo;

  setUp((){
    mockItemsRemoteDataSource = MockItemsRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    itemsRepositoryImplementation = ItemsRepositoryImplementation(
        itemsRemoteDataSource:mockItemsRemoteDataSource,
        networkInfo:mockNetworkInfo
    );
  });

  group('getItems', (){
    final ItemsModel itemsModel = ItemsModel();

    test('should check for connectivity', () async {

      //arrange
      when(mockNetworkInfo.isConnected()).thenAnswer((_) async => true);

      //act
      itemsRepositoryImplementation.getItems();

      //assert
      verify(mockNetworkInfo.isConnected());
    });

    group('user is online ', (){
      setUp((){
        when(mockNetworkInfo.isConnected()).thenAnswer((_) async => true);
      });
      test('should return a valid Items entity when the call to itemsRepositoryImplementation is success', () async {

        //arrange
        when(mockItemsRemoteDataSource.getItems()).thenAnswer((_) async => itemsModel);
        //act
        final result = await itemsRepositoryImplementation.getItems();

        //assert
        verify(mockItemsRemoteDataSource.getItems());
        expect(result, Right(itemsModel));

      });

      test('should return Failure when the call to itemsRepositoryImplementation is unsucceseful', () async {

        //arrange
        when(mockItemsRemoteDataSource.getItems()).thenThrow(ServerException());
        //act
        final result = await itemsRepositoryImplementation.getItems();

        //assert
        verify(mockItemsRemoteDataSource.getItems());
        expect(result, Left(ServerFailure()));

      });
    });

    group('user is offline', (){
      setUp((){
        when(mockNetworkInfo.isConnected()).thenAnswer((_) async => false);
      });

      test('should return OfflineFailure when the call to Repository is a success', () async{
        //act
        final result = await itemsRepositoryImplementation.getItems();
        //assert
        expect(result, Left(OfflineFailure()));
      });

    });

  });
}