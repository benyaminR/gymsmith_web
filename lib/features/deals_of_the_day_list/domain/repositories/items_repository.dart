import 'package:dartz/dartz.dart';
import 'package:gymsmith_web/core/failure.dart';
import 'package:gymsmith_web/features/deals_of_the_day_list/domain/entities/items.dart';

abstract class ItemsRepository{
  Future<Either<Failure,Items>> getItems();
}