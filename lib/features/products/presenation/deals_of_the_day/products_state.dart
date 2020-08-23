part of 'products_bloc.dart';

@immutable
abstract class ProductsState extends Equatable{
  const ProductsState();
}

class InitialDealsOfTheDayState extends ProductsState {
  const InitialDealsOfTheDayState();
  @override
  List<Object> get props => [];
}

class Loading extends ProductsState{
  const Loading();
  @override
  List<Object> get props => [];
}
class Loaded extends ProductsState{
  final Products items;

  const Loaded({@required this.items});

  @override
  List<Object> get props => [items];

}
class Error extends ProductsState{
  final String msg;

  const Error({@required this.msg});
  @override
  List<Object> get props => [msg];

}