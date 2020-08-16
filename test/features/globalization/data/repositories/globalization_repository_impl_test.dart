
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gymsmith_web/core/error/exception.dart';
import 'package:gymsmith_web/core/error/failure.dart';
import 'package:gymsmith_web/core/utils/translation/languages.dart';
import 'package:gymsmith_web/features/globalization/data/datasources/globalization_local_data_source.dart';
import 'package:gymsmith_web/features/globalization/data/model/GlobalizedFieldModel.dart';
import 'package:gymsmith_web/features/globalization/data/repositories/globalization_repository_impl.dart';
import 'package:mockito/mockito.dart';

class MockGlobalizationLocalSource extends Mock implements GlobalizationLocalDataSource{}



void main() {
  final localSource = MockGlobalizationLocalSource();
  final repo = GlobalizationRepositoryImp(dataSource : localSource);

  group('Globalization Repository ', (){

    final String code = "Code";
    final String value = "value";
    final Language language = Language.en;
    test('should return ', () async{

      //arrange
      
      final expected = Future.value(GlobalizedFieldModel(value: value));
      when(localSource.translateField(code,language)).thenAnswer((_) => expected);

      //act
      final actual = await repo.translateField(code,language);

      //assert
      expect(actual, Right(await expected));
      verify(localSource.translateField(code,language));
      verifyNoMoreInteractions(localSource);

    });

    test('should return ServerFailure', () async {
      when(localSource.translateField(code,language)).thenThrow(ServerException());

      //act
      final actual = await repo.translateField(code,language);

      //assert
      expect(actual, Left(ServerFailure()));
      verify(localSource.translateField(code,language));
      verifyNoMoreInteractions(localSource);

    });

  });
}