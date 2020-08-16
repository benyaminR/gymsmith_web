


import 'package:flutter_test/flutter_test.dart';
import 'package:gymsmith_web/core/utils/translation/languages.dart';
import 'package:gymsmith_web/core/utils/translation/translator.dart';
import 'package:gymsmith_web/features/globalization/data/datasources/globalization_local_data_source.dart';
import 'package:mockito/mockito.dart';

class MockTranslator extends Mock implements Translator{}

void main() {
  final translator = MockTranslator();
  final dataSource = GlobalizationLocalDataSourceImpl(translator:translator);
  final code = "code";
  final language = Language.en;
  final translation = Future.value('HelloWorld');
  group('GlobalizationLocalDataSource ', (){

    test('should return a valid String', () async{
      //arrange
      when(translator.translate(code, language)).thenAnswer((_)  => translation);
      //act
      var actual = await dataSource.translateField(code,Language.en);
      //assert
      expect(actual.value, await translation);
      verify(translator.translate(code, language));
      verifyNoMoreInteractions(translator);

    });
  });
}