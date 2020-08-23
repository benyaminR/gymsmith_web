
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:gymsmith_web/features/authentication/domain/entity/auth_data.dart';

abstract class AuthRemoteDataSource{
  Future<AuthData> signInAnonymously();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{

  final FirebaseAuth firebaseAuth;

  AuthRemoteDataSourceImpl({@required this.firebaseAuth});

  @override
  Future<AuthData> signInAnonymously() async {
    await firebaseAuth.signInAnonymously();
    return AuthData();
  }


}