

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

    test('should add a new Item to Cart', () async{
      //act
      await datasource.add(carItemData);
      //assert
      var result = await firestore.collection('users').document(userUID).collection('cart').getDocuments();
      var expected = result.documents[0].data['databaseRef'] == documentRef;
      expect(true, expected);
    });

    test('should increment by one if Item already exits', () async{
      //act
      await datasource.add(carItemData);
      //assert
      var result = await firestore.collection('users').document(userUID).collection('cart').getDocuments();
      print(result.documents[0].data['amount']);
      var expected = result.documents[0].data['amount'] == 2;
      expect(true,expected);
    });


  });

}