part of 'cart_bloc.dart';

@immutable
abstract class CartState extends Equatable{}

class InitialCartState extends CartState {
  @override
  List<Object> get props => [];
}

class CartFailureState extends CartState {
  @override
  List<Object> get props => [];
}

class CartGetState extends CartState {

  final Cart cart;

  CartGetState({@required this.cart});

  @override
  List<Object> get props => [cart];
}

class CartRemoveState extends CartState {

  final String target;

  CartRemoveState({@required this.target});

  @override
  List<Object> get props => [target];
}

class CartAddState extends CartState {

  final String target;

  CartAddState({@required this.target});

  @override
  List<Object> get props => [target];
}
