




import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gymsmith_web/features/authentication/data/datasource/auth_remote_data_source.dart';
import 'package:gymsmith_web/features/authentication/domain/entity/auth_data.dart';
import 'package:mockito/mockito.dart';

class MockFirebaseAuthMock extends Mock implements MockFirebaseAuth{}

void main() {
  final firebase = MockFirebaseAuthMock();
  final authSource = AuthRemoteDataSourceImpl(firebaseAuth: firebase);
  test('should return Future<AuthData>', () async{
    //act
    var result = await authSource.signInAnonymously();
    //assert
    expect(result, isA<AuthData>());
    verify(firebase.signInAnonymously());
    verifyNoMoreInteractions(firebase);
  });

}