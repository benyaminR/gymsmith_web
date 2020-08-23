

import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gymsmith_web/features/cart/data/datasources/cart_remote_data_source.dart';
import 'package:mockito/mockito.dart';

import '../../../products/data/models/products_model_test.dart';


class MockMockFirestore extends Mock implements MockFirestore{}
class MockMockFirebaseAuth extends Mock implements MockFirebaseAuth{}

void main(){
  final firestore = MockMockFirestore();
  final auth = MockMockFirebaseAuth();
  final datasource = CartRemoteDataSourceImpl(firestore:firestore,firebaseAuth: auth);
  
}