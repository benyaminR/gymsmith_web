import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import 'product.dart';

class Products extends Equatable{
  final List<Product> items;
  Products({
    @required this.items
  });

  @override
  List<Object> get props => [items];
}