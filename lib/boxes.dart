import 'package:hive/hive.dart';
import 'package:sary_project/hiveModel/item.dart';

class Boxes {
  static Box<Item> getItems() => Hive.box<Item>('item');
}
