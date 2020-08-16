part of 'globalization_bloc.dart';

@immutable
abstract class GlobalizationEvent {}

class ChangeLanguageEvent extends GlobalizationEvent {}
class TranslateEvent extends GlobalizationEvent {
  final String code;

  TranslateEvent({@required this.code});
}