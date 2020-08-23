import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gymsmith_web/core/usecase/no_params.dart';
import 'package:gymsmith_web/features/authentication/domain/usecase/sign_in_anonymously_usecase.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInAnonymouslyUseCase signInAnonymouslyUseCase;


  AuthBloc(AuthState initialState, {@required this.signInAnonymouslyUseCase}) : super(initialState);

  @override
  AuthState get initialState => InitialAuthState();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if(event is SignInAnonymouslyEvent){
      yield AuthenticatingState();
      var result = await signInAnonymouslyUseCase(NoParams());
      yield result.fold(
              (l) => AuthenticationFailedState(),
              (r) => AuthenticatedState()
      );
    }
  }
}
