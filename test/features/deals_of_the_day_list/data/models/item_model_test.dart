import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gymsmith_web/core/utils/database_paths.dart';
import 'package:gymsmith_web/features/deals_of_the_day_list/data/models/items_model.dart';
import 'package:gymsmith_web/features/deals_of_the_day_list/domain/entities/items.dart';
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
      'images':[],
      'sizes':['S','M','L','XL']
    });
  });

  ItemsModel model = ItemsModel();

  test('is this model a subclass of Item entity ', () async{
    expect(model, isA<Items>());
  }
  );


  test('should convert snapshot to a ItemsModel',()async{
    //arrange
    final QuerySnapshot snapshot = await firestore.collection(Products_Path).getDocuments();
    //act
    var convertedModel = ItemsModel.fromSnapshot(snapshot);
    //assert
    expect(convertedModel.items.length,snapshot.documents.length);

  });

}