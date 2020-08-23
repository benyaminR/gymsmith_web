import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:gymsmith_web/core/error/failure.dart';
import 'package:gymsmith_web/core/usecase/params.dart';
import 'package:gymsmith_web/core/usecase/usecase.dart';
import 'package:gymsmith_web/features/products/domain/entities/product.dart';
import 'package:gymsmith_web/features/products/domain/repositories/products_repository.dart';

class GetProductUseCase extends UseCase<Product,WithParams>{
  final ProductsRepository repo;

  GetProductUseCase({@required this.repo});

  @override
  Future<Either<Failure, Product>> call(WithParams params) => repo.getProduct(params.param);

}