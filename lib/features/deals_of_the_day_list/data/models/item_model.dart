import 'package:flutter/cupertino.dart';
import 'package:gymsmith_web/features/deals_of_the_day_list/domain/entities/item.dart';

class ItemModel extends Item{
  ItemModel({
    @required description,
    @required name,
    @required images,
    @required price,
    @required isNew,
    @required isAvailable,
    @required colors,
    @required sizes}) : super(
      description:description,
      name:name,
      images:images,
      price:price,
      isNew:isNew,
      isAvailable:isAvailable,
      colors:colors,
      sizes:sizes);

}