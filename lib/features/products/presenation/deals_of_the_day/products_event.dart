part of 'products_bloc.dart';

@immutable
abstract class ProductsEvent{}


class GetDealsOfTheDayEvent extends ProductsEvent{}

class GetProductEvent extends ProductsEvent{
  final String documentRef;

  GetProductEvent({@required this.documentRef});
}