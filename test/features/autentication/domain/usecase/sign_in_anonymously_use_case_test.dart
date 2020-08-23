
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gymsmith_web/core/usecase/no_params.dart';
import 'package:gymsmith_web/features/authentication/domain/entity/auth_data.dart';
import 'package:gymsmith_web/features/authentication/domain/repository/auth_repo.dart';
import 'package:gymsmith_web/features/authentication/domain/usecase/sign_in_anonymously_usecase.dart';
import 'package:mockito/mockito.dart';

class MockAuthRepo extends Mock implements AuthRepo{}

void main() {

  final MockAuthRepo repo = MockAuthRepo();
  final SignInAnonymouslyUseCase signIn = SignInAnonymouslyUseCase(repo:repo);

  test('should redirect values from repo', () async {

    //arrange
    final expected = AuthData();
    when(repo.signInAnonymously()).thenAnswer((_) async => Right(expected));

    //act
    var actual = await signIn(NoParams());

    //assert
    expect(actual,Right(expected));
    verify(repo.signInAnonymously());
    verifyNoMoreInteractions(repo);

  });

}