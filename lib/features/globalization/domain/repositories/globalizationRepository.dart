import 'package:dartz/dartz.dart';
import 'package:gymsmith_web/core/error/failure.dart';
import 'package:gymsmith_web/core/utils/translation/languages.dart';
import 'package:gymsmith_web/features/globalization/domain/entities/GlobalizedField.dart';

abstract class GlobalizationRepository {
  Future<Either<Failure,GlobalizedField>> translateField(String code, Language language);
}