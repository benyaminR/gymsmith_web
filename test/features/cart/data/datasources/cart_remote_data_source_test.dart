

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gymsmith_web/features/cart/data/datasources/cart_remote_data_source.dart';
import 'package:gymsmith_web/features/cart/domain/entity/Cart.dart';
import 'package:mockito/mockito.dart';

import '../../../products/data/models/products_model_test.dart';


class MockMockFirestore extends Mock implements MockFirestore{}
class MockMockFirebaseAuth extends Mock implements MockFirebaseAuth{}
class MockFirebaseUser extends Mock implements FirebaseUser{}


void main() {
  final firestore = MockFirestoreInstance();
  final auth = MockMockFirebaseAuth();
  final user = MockFirebaseUser();
  final datasource = CartRemoteDataSourceImpl(firestore:firestore,firebaseAuth: auth);
  final userUID = 'user';


  group('CartRemoteDataSource ', (){

    setUp(() async{
      when(auth.currentUser()).thenAnswer((_) async => user);
      when(user.uid).thenAnswer((realInvocation) => userUID);
    });


    var documentRef = 'cart/item';
    final carItemData = CartItemData(
      databaseRef: documentRef,
      size: 'M',
      amount: 1,
      color: 'Red'
    );

    group('add',(){
      test('should add a new Item to Cart', () async{
        //act
        await CleanUp(firestore,userUID);
        await datasource.add(carItemData);
        //assert
        var result = await firestore.collection('users').document(userUID).collection('cart').getDocuments();
        var expected = result.documents[0].data['databaseRef'] == documentRef;
        expect(true, expected);
      });

      test('should increment by one if Item already exits', () async{
        //act
        await CleanUp(firestore,userUID);
        await datasource.add(carItemData);
        await datasource.add(carItemData);
        //assert
        var result = await firestore.collection('users').document(userUID).collection('cart').getDocuments();
        print(result.documents[0].data['amount']);
        var expected = result.documents[0].data['amount'] == 2;
        expect(true,expected);
      });
    });


    group('remove', (){
      test('should remove the item if amount is less or equal to 1 ',() async{
        //arrange
        await CleanUp(firestore,userUID);
        await datasource.add(carItemData);
        //act
        await datasource.remove(carItemData);
        var documents = await firestore.collection('users').document(userUID).collection('cart').where('databaseRef',isEqualTo: documentRef).getDocuments();
        //assert
        expect(true, documents.documents.length == 0);
      });
    });

    test('should decrease amount if amount is greater than 1', () async{
      //arrange
      await CleanUp(firestore,userUID);
      await datasource.add(carItemData);
      await datasource.add(carItemData);
      //act
      await datasource.remove(carItemData);
      var documents = await firestore.collection('users').document(userUID).collection('cart').where('databaseRef',isEqualTo: documentRef).getDocuments();
      print(documents.documents[0]['amount']);
      //assert
      expect(true, documents.documents[0]['amount'] == 1);
    });

  });


}

void CleanUp(Firestore firestore, String userUID) async {
  var docs = await firestore.collection('users').document(userUID).collection('cart').getDocuments();
  for(var doc in docs.documents)
    await doc.reference.delete();
}

