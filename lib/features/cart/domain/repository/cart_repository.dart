
import 'package:dartz/dartz.dart';
import 'package:gymsmith_web/core/error/failure.dart';
import 'package:gymsmith_web/features/cart/domain/entity/Cart.dart';

abstract class CartRepository{
  ///
  Future<Either<Failure,String>> add(String cartItem);
  ///
  Future<Either<Failure,Cart>> get();
  ///
  Future<Either<Failure,String>> remove(String cartItem);

} 