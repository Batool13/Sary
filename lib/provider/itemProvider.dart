import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sary_project/hiveModel/item.dart';
import 'package:sary_project/widgets/toast.dart';

import '../boxes.dart';
import '../widgets/toastDecorator.dart';

class ItemProvider with ChangeNotifier {
  final box = Boxes.getItems();

  Future addItem(String name, String price, String sku, String description,
      String image) async {
    Boxes.getItems().listenable();

    final item = Item()
      ..name = name
      ..price = price
      ..sku = sku
      ..description = description
      ..image = image;

    box.add(item);
    // box.put("", item);

    // final mybox = Boxes.getTransactions();
    // final myTransaction = mybox.get('key');
    // mybox.values;
    // mybox.keys;
  }

  void deleteItem(Item item) {
    // final box = Boxes.getTransactions();
    // box.delete(transaction.key);

    item.delete();

    //setState(() => transactions.remove(transaction));
    notifyListeners();
  }

  getItemById(itemId) {
    box.containsKey(itemId);

    int keyItem = int.parse(itemId);
    Item? item = box.get(keyItem);
    return item;

    // late Item? item = box.get(itemId);
    // var name = item?.name;
    // print('Info retrieved from box: ($name) ');
  }

  void updateItem(Item item, String name, String price, String sku,
      String description, String image) {
    {
      item.name = name;
      item.price = price;
      item.sku = sku;
      item.description = description;
      item.image = image;

      box.put(item.key, item);

      // item.save();
    }

    @override
    void dispose() {
      Hive.close();
      super.dispose();
      notifyListeners();
    }
  }
}
