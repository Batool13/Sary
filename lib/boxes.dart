import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:sary_project/hiveModel/item.dart';
import 'package:sary_project/hiveModel/transaction.dart';

class Boxes {
  static Box<Item> getItems() => Hive.box<Item>('item');

  static Box<Transaction> getTransaction() =>
      Hive.box<Transaction>('transaction');
}
