import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:sary_project/hiveModel/item.dart';

class ItemProvider with ChangeNotifier {
  Future addItem(String id, String name, String price, String sku,
      String description, String image) async {
    final item = Item(id, name, price, sku, description, image)
      ..id = id
      ..name = name
      ..price = price
      ..sku = sku
      ..description = description
      ..image = image;

    // final box = Boxes.getItems();
    // box.add(item);
    //box.put('mykey', transaction);

    // final mybox = Boxes.getTransactions();
    // final myTransaction = mybox.get('key');
    // mybox.values;
    // mybox.keys;
  }

  void deleteItem() {
    notifyListeners();
  }

  void updateItem() {
    notifyListeners();
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
    notifyListeners();
  }
}
