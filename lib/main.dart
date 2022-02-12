import 'Widgets/titleWidget.dart';
import 'package:flutter/material.dart';

import 'package:hive/hive.dart';

import 'package:hive_flutter/hive_flutter.dart';

import 'hiveModel/transaction.dart';
import 'utils/dimens.dart';
import 'utils/themeData.dart';
import 'widgets/actionButton.dart';
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
      home: const MyHomePage(title: 'Transactions'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TitleWidget(widget: widget),
        actions: <Widget>[
          const ActionButton(
            myIcon: Icons.local_offer,
          )
        ],
        backgroundColor: Colors.white,
      ),
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
