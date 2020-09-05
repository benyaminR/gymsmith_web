part of 'products_bloc.dart';

@immutable
abstract class ProductsEvent extends Equatable{}


class GetDealsOfTheDayEvent extends ProductsEvent{
  @override
  List<Object> get props => [];
}

class GetProductEvent extends ProductsEvent{
  final String documentRef;
  GetProductEvent({@required this.documentRef});

  @override
  List<Object> get props =>[documentRef];
}