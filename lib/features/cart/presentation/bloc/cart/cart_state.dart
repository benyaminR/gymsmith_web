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
  @override
  List<Object> get props => [];
}

class CartRemoveState extends CartState {
  @override
  List<Object> get props => [];
}

class CartAddState extends CartState {
  @override
  List<Object> get props => [];
}

class CartUpdatedState extends CartState{

  final Cart updatedCart;
  CartUpdatedState({@required this.updatedCart});

  @override
  List<Object> get props => [updatedCart];
}
