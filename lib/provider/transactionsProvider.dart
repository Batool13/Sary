import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';

import 'package:sary_project/hiveModel/transaction.dart';

import '../boxes.dart';

class TransactionProvider with ChangeNotifier {
  get get => null;

  //  {
  //     "id": 1,
  //     "type": "inbound",
  //     "itemId": 2,
  //     "quantity": 45,
  //     "inbound_at": "2012-02-27 11:00:00",
  //     "outbound_at": "2012-02-27 13:27:00"
  //   }
  Future addTransaction(String type, String itemId, String quantity,
      String inboundAt, String outboundAt) async {
    Boxes.getTransaction().listenable();

    final transaction = Transaction()
      ..type = type
      ..itemId = itemId
      ..quantity = quantity
      ..inboundAt = inboundAt
      ..outboundAt = outboundAt;

    final box = Boxes.getTransaction();
    box.add(transaction);
    print("from add transaction");
    print(transaction.type);
    // box.put("", item);

    // final mybox = Boxes.getTransactions();
    // final myTransaction = mybox.get('key');
    // mybox.values;
    // mybox.keys;
  }

  void deleteTransaction(Transaction transaction) {
    // final box = Boxes.getTransactions();
    // box.delete(transaction.key);

    transaction.delete();
    //setState(() => transactions.remove(transaction));
    notifyListeners();
  }

  void updateTransaction(Transaction transaction, String type, String itemId,
      String quantity, String inboundAt, String outboundAt) {
    {
      transaction.type = type;
      transaction.itemId = itemId;
      transaction.quantity = quantity;
      transaction.inboundAt = inboundAt;
      transaction.outboundAt = outboundAt;

      final box = Boxes.getTransaction();
      box.put(transaction.key, transaction);

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
