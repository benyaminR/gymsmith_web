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
class LoadedDealsOfTheDay extends ProductsState{
  final Products products;

  const LoadedDealsOfTheDay({@required this.products});

  @override
  List<Object> get props => [products];

}
class LoadedProduct extends ProductsState{
  final Product product;

  const LoadedProduct({@required this.product});

  @override
  List<Object> get props => [product];
}

class Error extends ProductsState{
  final String msg;

  const Error({@required this.msg});
  @override
  List<Object> get props => [msg];
}

