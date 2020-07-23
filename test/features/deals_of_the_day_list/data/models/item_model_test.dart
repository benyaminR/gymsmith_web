



import 'package:flutter_test/flutter_test.dart';
import 'package:gymsmith_web/features/deals_of_the_day_list/data/models/item_model.dart';
import 'package:gymsmith_web/features/deals_of_the_day_list/domain/entities/item.dart';

void main(){
  ItemModel model = ItemModel();

  test('is this model a subclass of Item entity ', () async{
    expect(model, isA<Item>());
  }
  );
}