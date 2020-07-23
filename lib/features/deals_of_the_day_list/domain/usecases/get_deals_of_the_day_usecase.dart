import 'dart:ffi';
import 'dart:wasm';

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:gymsmith_web/core/failure.dart';
import 'package:gymsmith_web/core/usecase/no_params.dart';
import 'package:gymsmith_web/core/usecase/usecase.dart';
import 'package:gymsmith_web/features/deals_of_the_day_list/domain/entities/items.dart';
import 'package:gymsmith_web/features/deals_of_the_day_list/domain/repositories/items_repository.dart';

class GetDealsOfTheDayUsecase implements UseCase<Items,NoParams>{
  final ItemsRepository repository;

  GetDealsOfTheDayUsecase({
    @required this.repository
  });

  @override
  Future<Either<Failure,Items>> call(NoParams noParams) async{
    return await repository.getItems();
  }

}