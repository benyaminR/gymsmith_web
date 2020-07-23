import 'package:gymsmith_web/features/deals_of_the_day_list/data/models/items_model.dart';

abstract class ItemsRemoteDataSource {
  ///Gets a ItemsModel from the firebase cloud
  Future<ItemsModel> getItems();
}