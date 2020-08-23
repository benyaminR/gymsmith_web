import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:gymsmith_web/core/error/exception.dart';
import 'package:gymsmith_web/core/error/failure.dart';
import 'package:gymsmith_web/features/authentication/data/datasource/auth_remote_data_source.dart';
import 'package:gymsmith_web/features/authentication/domain/entity/auth_data.dart';
import 'package:gymsmith_web/features/authentication/domain/repository/auth_repo.dart';

class AuthRepoImpl implements AuthRepo{
  final AuthRemoteDataSource dataSource;

  AuthRepoImpl({@required this.dataSource});

  @override
  Future<Either<Failure, AuthData>> signInAnonymously() async {
    try {
      var authData = await dataSource.signInAnonymously();
      return Right(authData);
    } on ServerException{
      return Left(ServerFailure());
    }
  }

}