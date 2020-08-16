import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:gymsmith_web/core/error/failure.dart';
import 'package:gymsmith_web/core/usecase/usecase.dart';
import 'package:gymsmith_web/core/utils/translation/languages.dart';
import 'package:gymsmith_web/features/globalization/domain/entities/GlobalizedField.dart';
import 'package:gymsmith_web/features/globalization/domain/repositories/globalizationRepository.dart';

class TranslateFieldUseCase extends UseCase<GlobalizedField,TranslationRequest>{

  final GlobalizationRepository repository;

  TranslateFieldUseCase({@required this.repository});

  @override
  Future<Either<Failure, GlobalizedField>> call(TranslationRequest translationRequest) => repository.translateField(translationRequest.code,translationRequest.language);

}

class TranslationRequest{
  final String code;
  final Language language;

  TranslationRequest({@required this.code, @required this.language});
}