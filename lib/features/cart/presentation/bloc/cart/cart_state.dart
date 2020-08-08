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

  final Cart updatedCart;

  CartRemoveState({this.updatedCart});

  @override
  List<Object> get props => [updatedCart];
}

class CartAddState extends CartState {

  final Cart updatedCart;

  CartAddState({@required this.updatedCart});

  @override
  List<Object> get props => [];
}
