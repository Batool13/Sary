import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';

import 'package:sary_project/hiveModel/transaction.dart';

import '../boxes.dart';
import '../widgets/toast.dart';

class TransactionProvider with ChangeNotifier {
  final box = Boxes.getTransaction();

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
    box.add(transaction).then((value) => Toast("Added Successfully"));

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

    transaction.delete().then((value) => Toast("Transaction Deleted"));

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

      box
          .put(transaction.key, transaction)
          .then((value) => Toast("Updated Successfully"));

      // item.save();
    }
    // getTransactionById(transactionId) {
    //   box.containsKey(transactionId);

    //   int keyTransaction = int.parse(transactionId);
    //   Transaction? transaction = box.get(keyTransaction);
    //   return transaction;

    // late Item? item = box.get(itemId);
    // var name = item?.name;
    // print('Info retrieved from box: ($name) ');
    // }
    // getById(transactionId) {
    //   box.containsKey(transactionId);

    //   Transaction? transaction = box.get(transactionId);

    //   return transaction;
    //   // late Item? item = box.get(itemId);
    //   // var name = item?.name;
    //   // print('Info retrieved from box: ($name) ');
    // }

    @override
    void dispose() {
      Hive.close();
      super.dispose();
      notifyListeners();
    }
  }

  Transaction? getTransactionById(transactionId) {
    box.containsKey(transactionId);

    // int keyTransaction = int.parse(transactionId);
    Transaction? transaction = box.get(transactionId);
    return transaction;
  }

  List<Transaction>? getTransactions() {
    // int keyTransaction = int.parse(transactionId);
    List<Transaction>? transaction = box.values.toList();
    return transaction;
  }
}
