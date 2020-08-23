

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gymsmith_web/core/error/failure.dart';
import 'package:gymsmith_web/core/usecase/no_params.dart';
import 'package:gymsmith_web/features/authentication/domain/entity/auth_data.dart';
import 'package:gymsmith_web/features/authentication/domain/usecase/sign_in_anonymously_usecase.dart';
import 'package:gymsmith_web/features/authentication/presentation/auth/auth_bloc.dart';
import 'package:mockito/mockito.dart';

class MockSignInAnonymously extends Mock implements SignInAnonymouslyUseCase{}

void main() {
  final signInAnonymouslyUseCase = MockSignInAnonymously();
  final authBloc = AuthBloc(InitialAuthState(),signInAnonymouslyUseCase:signInAnonymouslyUseCase);

  test('should emit in order [AuthenticatingState, AuthenticatedState]', () async{

    //arrange
    when(signInAnonymouslyUseCase(NoParams())).thenAnswer((_) async => Right(AuthData()));
    var expected = [
      AuthenticatingState(),
      AuthenticatedState()
    ];

    //act
    authBloc.add(SignInAnonymouslyEvent());

    //assert
    expectLater(authBloc, emitsInOrder(expected));
  });


  test('should emit in order [AuthenticatingState, AuthenticationFailureState]', () async {
    //arrange
    when(signInAnonymouslyUseCase(NoParams())).thenAnswer((_) async => Left(ServerFailure()));
    var expected = [
      AuthenticatingState(),
      AuthenticationFailedState()
    ];
    //act
    authBloc.add(SignInAnonymouslyEvent());

    //assert
    expectLater(authBloc,emitsInOrder(expected));
  });

}