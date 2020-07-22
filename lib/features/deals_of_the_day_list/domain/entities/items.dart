import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import 'item.dart';

class Items extends Equatable{
  final List<Item> items;
  Items({
    @required this.items
  });

  @override
  List<Object> get props => [items];
}