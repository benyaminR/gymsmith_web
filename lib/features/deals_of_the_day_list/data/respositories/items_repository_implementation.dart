import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:gymsmith_web/core/error/exception.dart';
import 'package:gymsmith_web/core/error/failure.dart';
import 'package:gymsmith_web/core/network_info.dart';
import 'package:gymsmith_web/features/deals_of_the_day_list/data/datasources/items_remote_datasource.dart';
import 'package:gymsmith_web/features/deals_of_the_day_list/domain/entities/items.dart';
import 'package:gymsmith_web/features/deals_of_the_day_list/domain/repositories/items_repository.dart';

class ItemsRepositoryImplementation implements ItemsRepository{
  final ItemsRemoteDataSource itemsRemoteDataSource;
  final NetworkInfo networkInfo;

  ItemsRepositoryImplementation({@required this.networkInfo, @required this.itemsRemoteDataSource});


  @override
  Future<Either<Failure, Items>> getItems() async{
    if( await networkInfo.isConnected()){
      try {
        return Right(await itemsRemoteDataSource.getItems());
      } on ServerException{
        return Left(ServerFailure());
      }
    }else {
      return Left(OfflineFailure());
    }

  }
}