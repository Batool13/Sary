import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sary_project/hiveModel/item.dart';

import '../boxes.dart';

class ItemProvider with ChangeNotifier {
  Future addItem(String name, String price, String sku, String description,
      String image) async {
    Boxes.getItems().listenable();

    final item = Item()
      ..name = name
      ..price = price
      ..sku = sku
      ..description = description
      ..image = image;

    final box = Boxes.getItems();
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

  void updateItem(Item item, String name, String price, String sku,
      String description, String image) {
    {
      item.name = name;
      item.price = price;
      item.sku = sku;
      item.description = description;
      item.image = image;

      final box = Boxes.getItems();
      box.put(item.key, item);

      // item.save();
    }
    ;

    @override
    void dispose() {
      Hive.close();
      super.dispose();
      notifyListeners();
    }
  }
}
