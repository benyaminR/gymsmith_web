import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gymsmith_web/core/error/failure.dart';
import 'package:gymsmith_web/features/globalization/domain/entities/GlobalizedField.dart';
import 'package:gymsmith_web/features/globalization/domain/repositories/globalizationRepository.dart';
import 'package:gymsmith_web/features/globalization/presentation/globalization/globalization_bloc.dart';
import 'package:mockito/mockito.dart';

class MockGlobalizationRepository extends Mock implements GlobalizationRepository{}

void main() {
  final repo = MockGlobalizationRepository();
  final bloc = GlobalizationBloc(InitialGlobalizationState(),repository:repo);
  final code = 'HelloWorld';
  final language = bloc.language;
  final globalizedField = GlobalizedField(value: 'HelloWorld');
  group('GlobalizationBloc ', (){

    test('should change state in order [TranslatingState, TranslatedState]', () async{
      //arrange
      when(repo.translateField(code, language)).thenAnswer((_) async => Right(globalizedField));
      //act
      bloc.add(TranslateEvent(code: code));
      var expected = [
        TranslatingState(),
        TranslatedState(value: globalizedField.value)
      ];
      //assert
      await untilCalled(repo.translateField(code, language));
      expectLater(bloc, emitsInOrder(expected));
    });

  });

  test('should return GlobalizationFailureState', () async {
    //arrange
    bloc.emit(InitialGlobalizationState());
    when(repo.translateField(code, language)).thenAnswer((_) async => Left(ServerFailure()));
    //act
    bloc.add(TranslateEvent(code: code));
    //assert
    await Future.delayed(Duration(seconds: 1));
    expectLater(bloc.state, isA<GlobalizationFailedState>());
  });

}