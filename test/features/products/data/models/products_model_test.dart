import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gymsmith_web/core/utils/database_paths.dart';
import 'package:gymsmith_web/features/products/data/models/products_model.dart';
import 'package:gymsmith_web/features/products/domain/entities/products.dart';
import 'package:mockito/mockito.dart';


class MockFirestore extends Mock implements MockFirestoreInstance{}

void main(){
  final Firestore firestore = MockFirestoreInstance();
  setUp((){
    firestore.collection(Products_Path).add({
      'name':'T-Shirt',
      'price':'29.99€',
      'isNew':false,
      'isAvailable':false,
      'description':'Das beste T-Shirt, das man heutzutage finden kann!',
      'colors':[],
      'images':Map<String,dynamic>(),
      'sizes':['S','M','L','XL']
    });
  });

  ProductsModel model = ProductsModel();

  test('is this model a subclass of Item entity ', () async{
    expect(model, isA<Products>());
  }
  );


  test('should convert snapshot to a ItemsModel',()async{
    //arrange
    final QuerySnapshot snapshot = await firestore.collection(Products_Path).getDocuments();
    //act
    var convertedModel = ProductsModel.fromSnapshot(snapshot);
    //assert
    expect(convertedModel.items.length,snapshot.documents.length);

  });

}