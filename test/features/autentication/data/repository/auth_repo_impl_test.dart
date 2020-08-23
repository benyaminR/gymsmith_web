

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gymsmith_web/core/error/exception.dart';
import 'package:gymsmith_web/core/error/failure.dart';
import 'package:gymsmith_web/features/authentication/data/datasource/auth_remote_data_source.dart';
import 'package:gymsmith_web/features/authentication/data/repository/auth_repo_impl.dart';
import 'package:gymsmith_web/features/authentication/domain/entity/auth_data.dart';
import 'package:mockito/mockito.dart';

class MockAuthRemoteDataSource extends Mock implements AuthRemoteDataSource{}

void main() {
  final MockAuthRemoteDataSource mockAuthRemoteDataSource = MockAuthRemoteDataSource();
  final AuthRepoImpl repoImpl = AuthRepoImpl(dataSource: mockAuthRemoteDataSource);
  final authData = AuthData();

  test('should return AuthData ', () async {
    //arrange
    when(mockAuthRemoteDataSource.signInAnonymously()).thenAnswer((_) async => authData);

    //act
    var actual = await repoImpl.signInAnonymously();

    //assert
    expect(actual, Right(authData));
    verify(mockAuthRemoteDataSource.signInAnonymously());
    verifyNoMoreInteractions(mockAuthRemoteDataSource);

  });

  test('should return ServerFailure', () async {
    //arrange
    when(mockAuthRemoteDataSource.signInAnonymously()).thenThrow(ServerException());

    //act
    var actual = await repoImpl.signInAnonymously();

    //assert
    expect(actual, Left(ServerFailure()));
    verify(mockAuthRemoteDataSource.signInAnonymously());
    verifyNoMoreInteractions(mockAuthRemoteDataSource);
  });

}