import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:gymsmith_web/core/utils/translation/languages.dart';
import 'package:gymsmith_web/features/globalization/domain/repositories/globalizationRepository.dart';
import 'package:meta/meta.dart';

part 'globalization_event.dart';

part 'globalization_state.dart';

class GlobalizationBloc extends Bloc<GlobalizationEvent, GlobalizationState> {
  final GlobalizationRepository repository;

  Language language = Language.en;

  GlobalizationBloc(GlobalizationState initialState, {@required this.repository}) : super(initialState);

  @override
  GlobalizationState get initialState => InitialGlobalizationState();

  @override
  Stream<GlobalizationState> mapEventToState(GlobalizationEvent event) async* {
    if(event is TranslateEvent){
      var result = await repository.translateField(event.code, language);
      yield* result.fold(
              (l) async* {
                yield GlobalizationFailedState();
              },
              (r) async*  {
                yield TranslatingState();
                yield TranslatedState(value: r.value);
              }
      );

    }
  }
}
