import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:gymsmith_web/core/error/failure.dart';
import 'package:gymsmith_web/core/usecase/no_params.dart';
import 'package:gymsmith_web/core/usecase/usecase.dart';
import 'package:gymsmith_web/features/products/domain/entities/products.dart';
import 'package:gymsmith_web/features/products/domain/repositories/products_repository.dart';

class GetDealsOfTheDayUsecase implements UseCase<Products,NoParams>{
  final ProductsRepository repository;

  GetDealsOfTheDayUsecase({
    @required this.repository
  });

  @override
  Future<Either<Failure,Products>> call(NoParams noParams) async{
    return await repository.getDealsOfTheDay();
  }

}