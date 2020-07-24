


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gymsmith_web/database_paths.dart';
import 'package:gymsmith_web/features/deals_of_the_day_list/data/datasources/items_remote_datasource.dart';
import 'package:mockito/mockito.dart';

class MockFirestore extends Mock implements Firestore{}

void main(){
  ItemsRemoteDataSourceImpl dataSourceImpl;
  MockFirestore mockFirestore;

  setUp((){
    mockFirestore = MockFirestore();
    dataSourceImpl = ItemsRemoteDataSourceImpl(firestore : mockFirestore);
  });

  test('should return ItemsModel', ()async{
    //arrange
    //when(mockFirestore.collection(Products_Path).snapshots()).thenAnswer((realInvocation) => );
    //act
    //final result = dataSourceImpl.getItems();
    //assert
    verify(mockFirestore.collection(Products_Path).snapshots());

  });
}