part of 'auth_bloc.dart';

@immutable
abstract class AuthState extends Equatable{}

class InitialAuthState extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthenticatingState extends AuthState{
  @override
  List<Object> get props => [];
}

class AuthenticatedState extends AuthState{
  @override
  List<Object> get props => [];
}

class AuthenticationFailedState extends AuthState{
  @override
  List<Object> get props => [];
}