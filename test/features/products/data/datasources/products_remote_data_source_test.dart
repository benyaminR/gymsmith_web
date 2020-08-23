import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gymsmith_web/core/utils/database_paths.dart';
import 'package:gymsmith_web/features/products/data/datasources/products_remote_datasource.dart';
import 'package:gymsmith_web/features/products/data/models/products_model.dart';

void main(){
  ProductsRemoteDataSourceImpl dataSourceImpl;
  Firestore firestore = MockFirestoreInstance();

  setUp((){
    dataSourceImpl = ProductsRemoteDataSourceImpl(firestore: firestore);
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
    var expected = ProductsModel.fromSnapshot( await firestore.collection(Products_Path).getDocuments());
    //act
    final result = dataSourceImpl.getProducts();
    //assert
    expect(result,isA<Future<ProductsModel>>());
    expect(await result, expected);

  });
}