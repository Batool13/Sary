import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sary_project/hiveModel/item.dart';
import 'package:sary_project/provider/itemProvider.dart';
import 'package:sary_project/utils/convertHexToColor.dart';
import 'package:sary_project/widgets/actionButton.dart';
import 'package:sary_project/widgets/addButton.dart';
import 'package:sary_project/widgets/addItemDialog.dart';
import 'package:sary_project/widgets/addTransactionDialog.dart';
import 'package:sary_project/widgets/itemCard.dart';
import 'package:sary_project/widgets/transactionDetailCard.dart';

import 'boxes.dart';

class TransactionDetailsPage extends StatefulWidget {
  TransactionDetailsPage({this.transactionKey});
  final transactionKey;

  @override
  _TransactionDetailsPageState createState() => _TransactionDetailsPageState();
}

class _TransactionDetailsPageState extends State<TransactionDetailsPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: buildAppBar(context, "Transaction Details", leadingFunction: () {
        Navigator.pop(
          context,
        );
      }, leadingIcon: Icons.west),
      body: buildContent());

  Widget buildContent() {
    {
      {
        return Column(children: [
          Expanded(
              flex: 7,
              child: TransactionDetailCard(
                transactionKey: widget.transactionKey,
              ))
        ]);
      }
    }
  }
}
