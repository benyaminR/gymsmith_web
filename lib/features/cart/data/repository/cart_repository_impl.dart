import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:gymsmith_web/core/error/exception.dart';
import 'package:gymsmith_web/core/error/failure.dart';
import 'package:gymsmith_web/features/cart/data/datasources/cart_local_data_source.dart';
import 'package:gymsmith_web/features/cart/data/datasources/cart_remote_data_source.dart';
import 'package:gymsmith_web/features/cart/domain/entity/Cart.dart';
import 'package:gymsmith_web/features/cart/domain/repository/cart_repository.dart';

class CartRepositoryImpl implements CartRepository{

  final CartRemoteDataSource dataSource;

  CartRepositoryImpl({@required this.dataSource});

  @override
  Future<Either<Failure, Cart>> add(String cartItem) async {
    try{
      return Right(await dataSource.add(cartItem));
    }on ServerException{
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Cart>> get() async {
    try{
      return Right(await dataSource.get());
    }on ServerException{
    return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Cart>> remove(String cartItem) async {
    try{
      return Right(await dataSource.remove(cartItem));
    }on ServerException{
      return Left(ServerFailure());
    }
  }

}