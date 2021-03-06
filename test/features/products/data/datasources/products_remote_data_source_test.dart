import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gymsmith_web/core/utils/database_paths.dart';
import 'package:gymsmith_web/features/products/data/datasources/products_remote_datasource.dart';
import 'package:gymsmith_web/features/products/data/models/product_model.dart';
import 'package:gymsmith_web/features/products/data/models/products_model.dart';



void main(){
  ProductsRemoteDataSourceImpl dataSourceImpl;
  var firestore = MockFirestoreInstance();

  setUp((){
    dataSourceImpl = ProductsRemoteDataSourceImpl(firestore: firestore);
    firestore.collection(Products_Path).add({
      'name':'T-Shirt',
      'price':'29.99€',
      'isNew':false,
      'isAvailable':false,
      'description':'Das beste T-Shirt, das man heutzutage finden kann!',
      'colors':Map<String,dynamic>(),
      'images':Map<String,dynamic>(),
      'previewColor':'red'
    });
  });


  test('should return ItemsModel', () async{
    //arrange
    var expected = ProductsModel.fromSnapshot( await firestore.collection(Products_Path).getDocuments());
    //act
    final result = dataSourceImpl.getDealsOfTheDay();
    //assert
    expect(result,isA<Future<ProductsModel>>());
    expect(await result, expected);

  });

  test('should return ', () async{

    //arrange
    final documentRef = 'collection/ref';
    await firestore.document(documentRef).setData({
      'name': 'T-Shirt',
      'price': '29.99',
      'isNew': false,
      'isAvailable': false,
      'description':'Das beste T-Shirt, das man heutzutage finden kann!',
      'colors': Map<String,dynamic>(),
      'images': Map<String,dynamic>(),
      'previewColor':'red'
    });
    final productModel = ProductModel.fromSnapshot(await firestore.document(documentRef).get());
    //act
    final result = await dataSourceImpl.getProduct(documentRef);
    //assert
    expect(result, productModel);
  });
}