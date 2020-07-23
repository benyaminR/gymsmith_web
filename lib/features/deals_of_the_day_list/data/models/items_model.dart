import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:gymsmith_web/features/deals_of_the_day_list/domain/entities/item.dart';
import 'package:gymsmith_web/features/deals_of_the_day_list/domain/entities/items.dart';

class ItemsModel extends Items implements Equatable{
  ItemsModel({
    @required items,}) : super(
      items:items,
  );
}