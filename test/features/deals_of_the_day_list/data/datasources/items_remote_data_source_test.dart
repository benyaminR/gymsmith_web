
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gymsmith_web/features/deals_of_the_day_list/data/datasources/items_remote_datasource.dart';
import 'package:gymsmith_web/features/deals_of_the_day_list/data/models/items_model.dart';
import 'package:gymsmith_web/utils/database_paths.dart';

void main(){
  ItemsRemoteDataSourceImpl dataSourceImpl;
  Firestore firestore = MockFirestoreInstance();

  setUp((){
    dataSourceImpl = ItemsRemoteDataSourceImpl(firestore: firestore);
    firestore.collection(Products_Path).add({
      'name':'T-Shirt',
      'price':'29.99€',
      'isNew':false,
      'isAvailable':false,
      'description':'Das beste T-Shirt, das man heutzutage finden kann!',
      'colors':[],
      'images':[],
      'sizes':['S','M','L','XL']
    });
  });


  test('should return ItemsModel', () async{
    //arrange
    var expected = ItemsModel.fromSnapshot( await firestore.collection(Products_Path).getDocuments());
    //act
    final result = dataSourceImpl.getItems();
    //assert
    expect(result,isA<Future<ItemsModel>>());
    expect(await result, expected);

  });
}