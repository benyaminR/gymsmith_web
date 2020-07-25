import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:gymsmith_web/features/deals_of_the_day_list/domain/entities/item.dart';
import 'package:gymsmith_web/features/deals_of_the_day_list/domain/entities/items.dart';

class ItemsModel extends Items implements Equatable{
  ItemsModel({
    @required items,}) : super(
      items:items,
  );

   factory ItemsModel.fromSnapshot(QuerySnapshot snapshot){
     List<Item> items = List<Item>();
     snapshot.documents.forEach((element) {items.add(Item(
       colors: element.data['colors'],
       description:element.data['description'] ,
       images: element.data['images'],
       isAvailable:element.data['isAvailable'],
       isNew: element.data['isNew'],
       name: element.data['name'],
       price: element.data['price'],
       sizes:element.data['sizes'] ,
      ));
     });
     return ItemsModel(items: items);
   }
}