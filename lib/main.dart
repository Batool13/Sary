import 'package:sary_project/itemsPage.dart';

import 'package:flutter/material.dart';

import 'package:hive/hive.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:sary_project/widgets/appBar.dart';

import 'hiveModel/transaction.dart';
import 'utils/dimens.dart';
import 'utils/themeData.dart';

import 'widgets/inputTextField.dart';
import 'widgets/myCard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(TransactionAdapter());
  await Hive.openBox<Transaction>('transaction');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transaction ',
      theme: MyThemeData.myThemeData,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, "Transaction",
          actionFunction: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ItemPage())),
          actionIcon: Icons.sell_outlined),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              const Flexible(
                flex: 6,
                child: Padding(
                  padding: Dimens.paddding10trl,
                  child: InputTextField(
                      addPrefixIcon: Icons.search, addHint: 'Search'),
                ),
              ),
              Flexible(
                flex: 1,
                child: Padding(
                  padding: Dimens.paddding10trl,
                  child: FloatingActionButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.filter_alt_outlined,
                    ),
                  ),
                ),
              ),
            ],
          ),
          MyCard(),
        ],
      ),
    );
  }
}
