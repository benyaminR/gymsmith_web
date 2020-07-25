


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gymsmith_web/database_paths.dart';
import 'package:gymsmith_web/features/deals_of_the_day_list/data/datasources/items_remote_datasource.dart';
import 'package:mockito/mockito.dart';

class MockDocumentReference extends Mock implements DocumentReference {}

class MockFirestore extends Mock implements Firestore {}

class MockCollectionReference extends Mock implements CollectionReference {}

class MockQuerySnapshot extends Mock implements QuerySnapshot {}

class MockDocumentSnapshot extends Mock implements DocumentSnapshot {}

class MockQuery extends Mock implements Query {}

void main(){
  ItemsRemoteDataSourceImpl dataSourceImpl;
  final Firestore mockFirestore = MockFirestore();
  final CollectionReference mockCollectionReference = MockCollectionReference();
  final QuerySnapshot mockQuerySnapshot = MockQuerySnapshot();
  final DocumentSnapshot mockDocumentSnapshot = MockDocumentSnapshot();
  final DocumentReference _mockDocumentRef = MockDocumentReference();

  setUp((){
    dataSourceImpl = ItemsRemoteDataSourceImpl(collectionReference: mockCollectionReference);
  });


  test('should return ItemsModel', ()async{
    //arrange
    when(mockCollectionReference.snapshots())
        .thenAnswer((_) => Stream.fromIterable([mockQuerySnapshot]));
    //act
    final result = dataSourceImpl.getItems();
    //assert
    verify(mockCollectionReference.snapshots());

  });
}