import 'package:dartz/dartz.dart';
import 'package:gymsmith_web/core/error/failure.dart';
import 'package:gymsmith_web/core/usecase/no_params.dart';
import 'package:gymsmith_web/core/usecase/usecase.dart';
import 'package:gymsmith_web/features/cart/domain/entity/Cart.dart';
import 'package:gymsmith_web/features/cart/domain/repository/cart_repository.dart';

class GetCartUseCase extends UseCase<Cart,NoParams>{
  final CartRepository repository;

  GetCartUseCase({this.repository});

  @override
  Future<Either<Failure, Cart>> call(NoParams params) => repository.get();

}