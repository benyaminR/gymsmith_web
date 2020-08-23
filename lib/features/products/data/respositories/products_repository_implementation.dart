import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:gymsmith_web/core/error/exception.dart';
import 'package:gymsmith_web/core/error/failure.dart';
import 'package:gymsmith_web/core/networking/network_info.dart';
import 'package:gymsmith_web/features/products/data/datasources/products_remote_datasource.dart';
import 'package:gymsmith_web/features/products/domain/entities/products.dart';
import 'package:gymsmith_web/features/products/domain/repositories/products_repository.dart';

class ProductsRepositoryImplementation implements ProductsRepository{
  final ProductsRemoteDataSource itemsRemoteDataSource;
  final NetworkInfo networkInfo;

  ProductsRepositoryImplementation({@required this.networkInfo, @required this.itemsRemoteDataSource});

  @override
  Future<Either<Failure, Products>> getItems() async{
    if(await networkInfo.isConnected()){
      try {
        return Right(await itemsRemoteDataSource.getProducts());
      } on ServerException{
        return Left(ServerFailure());
      }
    }else {
      return Left(OfflineFailure());
    }

  }
}