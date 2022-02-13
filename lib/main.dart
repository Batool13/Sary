import 'package:provider/provider.dart';
import 'package:sary_project/itemsPage.dart';

import 'package:flutter/material.dart';

import 'package:hive/hive.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:sary_project/provider/itemProvider.dart';
import 'package:sary_project/widgets/addButton.dart';
import 'package:sary_project/widgets/appBar.dart';

import 'hiveModel/transaction.dart';
import 'utils/dimens.dart';
import 'utils/themeData.dart';

import 'widgets/inputTextField.dart';
import 'widgets/transactionCard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(TransactionAdapter());
  await Hive.openBox<Transaction>('transaction');
  MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ItemProvider())]);
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
                flex: 7,
                child: Padding(
                  padding: Dimens.paddding10trl,
                  child: InputTextField(
                      addPrefixIcon: Icons.search, addHint: 'Search'),
                ),
              ),
              Flexible(
                flex: 2,
                child: Padding(
                  padding: Dimens.paddding10trl,
                  child: FloatingActionButton(
                    elevation: 1,
                    mini: true,
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white, width: 0),
                      borderRadius: Dimens.borderRadius50all,
                    ),
                    onPressed: () {},
                    child: Icon(
                      Icons.filter_alt_outlined,
                    ),
                  ),
                ),
              ),
            ],
          ),
          TransactionCard(),
          Expanded(
            child: Row(
              children: [
                AddButton(
                  addText: "On pound",
                  function: () {},
                ),
                AddButton(
                  addText: "Out pound",
                  function: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
