
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gymsmith_web/core/utils/translation/languages.dart';
import 'package:gymsmith_web/features/globalization/domain/entities/GlobalizedField.dart';
import 'package:gymsmith_web/features/globalization/domain/repositories/globalizationRepository.dart';
import 'package:gymsmith_web/features/globalization/domain/usecases/translate_field_usecase.dart';
import 'package:mockito/mockito.dart';

class MockGlobalizationRepo extends Mock implements GlobalizationRepository{}

void main() {
  final MockGlobalizationRepo repo = MockGlobalizationRepo();
  final TranslateFieldUseCase translateFieldUseCase = TranslateFieldUseCase(repository:repo);


  test('should call GlobalizationRepository', () async{
    //arrange
    final code = "Code";
    final value = 'value';
    final expected = GlobalizedField(value: value);
    when(repo.translateField(code,Language.en)).thenAnswer((_) async => Right(expected));

    //act
    var actual = await translateFieldUseCase(TranslationRequest(code: code,language:Language.en));

    //assert
    expect(actual, Right(expected));
    verify(repo.translateField(code,Language.en));
    verifyNoMoreInteractions(repo);

  });
}