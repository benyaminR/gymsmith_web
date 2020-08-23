part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}


class SignInAnonymouslyEvent extends AuthEvent{}