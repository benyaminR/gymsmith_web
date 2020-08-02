
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:gymsmith_web/core/error/failure.dart';
import 'package:gymsmith_web/core/usecase/params.dart';
import 'package:gymsmith_web/core/usecase/usecase.dart';
import 'package:gymsmith_web/features/cart/domain/repository/cart_repository.dart';

class AddToCartUseCase extends UseCase<String,WithParams>{
  final CartRepository repository;

  AddToCartUseCase({@required this.repository});

  @override
  Future<Either<Failure, String>> call(WithParams params) => repository.add(params.param);
}