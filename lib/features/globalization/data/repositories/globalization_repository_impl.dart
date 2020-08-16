import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:gymsmith_web/core/error/exception.dart';
import 'package:gymsmith_web/core/error/failure.dart';
import 'package:gymsmith_web/core/utils/translation/languages.dart';
import 'package:gymsmith_web/features/globalization/data/datasources/globalization_local_data_source.dart';
import 'package:gymsmith_web/features/globalization/domain/entities/GlobalizedField.dart';
import 'package:gymsmith_web/features/globalization/domain/repositories/globalizationRepository.dart';

class GlobalizationRepositoryImp implements GlobalizationRepository{

  final GlobalizationLocalDataSource dataSource;

  GlobalizationRepositoryImp({@required this.dataSource});

  @override
  Future<Either<Failure, GlobalizedField>> translateField(String code,Language language) async {
    try{
      return Right(await dataSource.translateField(code,language));
    } on ServerException{
      return Left(ServerFailure());
    }
  }


}