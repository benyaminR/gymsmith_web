
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:gymsmith_web/core/error/failure.dart';
import 'package:gymsmith_web/core/usecase/params.dart';
import 'package:gymsmith_web/core/usecase/usecase.dart';
import 'package:gymsmith_web/features/cart/domain/entity/Cart.dart';
import 'package:gymsmith_web/features/cart/domain/repository/cart_repository.dart';

class AddToCartUseCase extends UseCase<Cart,WithParams>{
  final CartRepository repository;

  AddToCartUseCase({@required this.repository});

  @override
  Future<Either<Failure, Cart>> call(WithParams params) {
    return repository.add(params.param);
  }
}
