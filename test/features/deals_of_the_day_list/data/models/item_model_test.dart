import 'package:flutter_test/flutter_test.dart';
import 'package:gymsmith_web/features/deals_of_the_day_list/data/models/items_model.dart';
import 'package:gymsmith_web/features/deals_of_the_day_list/domain/entities/items.dart';

void main(){
  ItemsModel model = ItemsModel();

  test('is this model a subclass of Item entity ', () async{
    expect(model, isA<Items>());
  }
  );
}