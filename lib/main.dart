import 'package:flutter/material.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:sary_project/hiveModel/transaction.dart';
import 'package:sary_project/provider/itemProvider.dart';
import 'package:sary_project/provider/transactionsProvider.dart';
import 'package:sary_project/transactionDetailsPage.dart';
import 'package:sary_project/utils/dimens.dart';
import 'package:sary_project/utils/themeData.dart';

import 'package:sary_project/widgets/actionButton.dart';
import 'package:sary_project/widgets/addButton.dart';

import 'package:sary_project/widgets/addTransactionDialog.dart';
import 'package:sary_project/widgets/inputTextField.dart';
import 'package:sary_project/widgets/slideLeft.dart';
import 'package:sary_project/widgets/slideRight.dart';
import 'package:sary_project/widgets/transactionCard.dart';

import 'boxes.dart';
import 'hiveModel/item.dart';
import 'itemsPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(ItemAdapter());
  Hive.registerAdapter(TransactionAdapter());
  await Hive.openBox<Item>('item');
  await Hive.openBox<Transaction>('transaction');
  MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ItemProvider()),
    ChangeNotifierProvider(create: (_) => TransactionProvider())
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transactions',
      theme: MyThemeData.myThemeData,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Transaction>? transactions;
  List<Transaction>? foundedTransactions;
  @override
  void initState() {
    // TODO: implement initState
    foundedTransactions = TransactionProvider().getTransactions();
    print(foundedTransactions!.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Row(
          children: [
            Flexible(
                child: AddButton(
                    addIcon: Icons.arrow_upward,
                    heroTag: "outbound",
                    addText: "Send",
                    function: () {
                      if (Boxes.getItems().isNotEmpty)
                        showDialog(
                          context: context,
                          builder: (context) => TransactionDialog(
                            name: Boxes.getItems().values.first.name.toString(),
                            typeFromButton: "outbound",
                            onClickedDone: TransactionProvider().addTransaction,
                          ),
                        );
                      else {
                        showDialogNoItems(context);
                      }
                    })),
            Flexible(
                child: AddButton(
                    addIcon: Icons.arrow_downward,
                    heroTag: "innbound",
                    addText: "Recive",
                    function: () {
                      if (Boxes.getItems().isNotEmpty) {
                        showDialog(
                          context: context,
                          builder: (context) => TransactionDialog(
                            name: Boxes.getItems().values.first.name.toString(),
                            typeFromButton: "inbound",
                            onClickedDone: TransactionProvider().addTransaction,
                          ),
                        );
                      } else {
                        showDialogNoItems(context);
                      }
                    })),
          ],
        ),
        appBar: buildAppBar(context, "Transactions",
            actionFunction: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => ItemPage())),
            actionIcon: Icons.sell_outlined),
        body: ValueListenableBuilder<Box<Transaction>>(
          valueListenable: Boxes.getTransaction().listenable(),
          builder: (context, box, _) {
            transactions = box.values.toList().cast<Transaction>();

            // setState(() {
            //           foundTransaction = transaction;
            //         });

            // This list holds the data for the list view

            return buildContent();
          },
        ),
      );

  Future<dynamic> showDialogNoItems(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Form(
                  child: Container(
                child: Text("No items found"),
              )),
            ));
  }

  Widget buildContent() {
    // if (foundTransaction.isEmpty) {
    //   return Column(
    //     children: [
    //       Expanded(
    //         flex: 5,
    //         child: Center(
    //           child: Text(
    //             'No Transactions yet!',
    //           ),
    //         ),
    //       ),
    //     ],
    //   );
    // } else {
    return Column(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Flexible(
                  flex: 7,
                  child: Padding(
                    padding: Dimens.paddding10trl,
                    child: InputTextField(
                        function: (value) => runFilter(value),
                        addPrefixIcon: Icons.search,
                        addHint: 'Search'),
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
            )
          ],
        ),
        if (transactions!.isEmpty)
          Expanded(
            flex: 5,
            child: Center(
              child: Text(
                'No Transactions yet!',
              ),
            ),
          )
        else
          Expanded(
            flex: 7,
            child: ListView.builder(
              padding: EdgeInsets.all(8),
              itemCount: foundedTransactions!.length,
              itemBuilder: (BuildContext context, int index) {
                final transaction = foundedTransactions![index];

                return Dismissible(
                  background: slideRightBackground("Details"),
                  secondaryBackground: slideLeftBackground(),
                  confirmDismiss: (DismissDirection direction) async {
                    if (direction == DismissDirection.endToStart) {
                      return await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            actions: <Widget>[
                              TextButton.icon(
                                onPressed: () =>
                                    Navigator.of(context).pop(true),
                                label: const Text("DELETE",
                                    style: TextStyle(color: Colors.red)),
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                              TextButton.icon(
                                onPressed: () =>
                                    Navigator.of(context).pop(false),
                                label: const Text(
                                  "CANCEL",
                                  style: TextStyle(color: Colors.green),
                                ),
                                icon: Icon(
                                  Icons.cancel,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => TransactionDetailsPage(
                              transactionKey: transaction.key)));
                    }
                  },
                  key: ObjectKey(transaction),
                  child: buildtransaction(context, transaction),
                  onDismissed: (direction) {
                    TransactionProvider().deleteTransaction(transaction);
                  },
                );
              },
            ),
          ),
      ],
    );
  }

  // This function is called whenever the text field changes
  void runFilter(String enteredKeyword) {
    List<Transaction> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = transactions!;
    } else {
      results = transactions!
          //inboundAt outboundAt type
          .where((name) =>
              name.quantity.contains(enteredKeyword) ||
              name.inboundAt.contains(enteredKeyword) ||
              name.outboundAt.contains(enteredKeyword) ||
              name.type.contains(enteredKeyword))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      print('results.length');
      print(results.length);

      foundedTransactions = results;
      print('transactions.length');
      print(foundedTransactions!.length);
      print(transactions!.length);
    });
  }
}

Widget buildtransaction(
  BuildContext context,
  Transaction transaction,
) {
  return TransactionCard(
    type: transaction.type,
    itemId: transaction.itemId,
    quantity: transaction.quantity,
    inboundAt: transaction.inboundAt,
    outboundAt: transaction.outboundAt,
  );
}
