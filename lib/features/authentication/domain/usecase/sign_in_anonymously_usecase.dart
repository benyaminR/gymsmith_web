import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:gymsmith_web/core/error/failure.dart';
import 'package:gymsmith_web/core/usecase/no_params.dart';
import 'package:gymsmith_web/core/usecase/usecase.dart';
import 'package:gymsmith_web/features/authentication/domain/entity/auth_data.dart';
import 'package:gymsmith_web/features/authentication/domain/repository/auth_repo.dart';

class SignInAnonymouslyUseCase implements UseCase<AuthData,NoParams>{

  final AuthRepo repo;

  SignInAnonymouslyUseCase({@required this.repo});

  @override
  Future<Either<Failure, AuthData>> call(NoParams params) => repo.signInAnonymously();

}