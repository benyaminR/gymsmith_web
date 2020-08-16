part of 'globalization_bloc.dart';

@immutable
abstract class GlobalizationState extends Equatable{}

class InitialGlobalizationState extends GlobalizationState {
  @override
  List<Object> get props => [];
}

class TranslatingState extends GlobalizationState{

  @override
  List<Object> get props => [];

}

class TranslatedState extends GlobalizationState{
  final String value;

  TranslatedState({@required this.value});
  @override
  List<Object> get props => [value];
}

class ChangingLanguageState extends GlobalizationState{
  @override
  List<Object> get props => [];
}

class ChangedLanguageState extends GlobalizationState{

  @override
  List<Object> get props => [];

}

class GlobalizationFailedState extends GlobalizationState{
  @override
  List<Object> get props => [];

}