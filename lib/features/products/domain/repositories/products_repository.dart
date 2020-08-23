import 'package:dartz/dartz.dart';
import 'package:gymsmith_web/core/error/failure.dart';
import 'package:gymsmith_web/features/products/domain/entities/product.dart';
import 'package:gymsmith_web/features/products/domain/entities/products.dart';

abstract class ProductsRepository{
  Future<Either<Failure,Products>> getDealsOfTheDay();
  Future<Either<Failure,Product>> getProduct(String documentRef);
}