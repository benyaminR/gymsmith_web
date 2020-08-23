part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable{}

class GetCartEvent extends CartEvent{
  @override
  List<Object> get props => [];
}

class RemoveItemFromCartEvent extends CartEvent{
  final CartItemData item;

  RemoveItemFromCartEvent({@required this.item});
  @override
  List<Object> get props => [item];
}

class AddItemToCartEvent extends CartEvent{
  final CartItemData item;

  AddItemToCartEvent({@required this.item});

  @override
  List<Object> get props => [item];
}
