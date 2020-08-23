import 'package:dartz/dartz.dart';
import 'package:gymsmith_web/core/error/failure.dart';
import 'package:gymsmith_web/features/authentication/domain/entity/auth_data.dart';

abstract class AuthRepo{

  Future<Either<Failure,AuthData>> signInAnonymously();
  
}