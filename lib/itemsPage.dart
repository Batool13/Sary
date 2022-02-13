import 'package:flutter/material.dart';
import 'package:sary_project/utils/dimens.dart';
import 'package:sary_project/widgets/addButton.dart';
import 'package:sary_project/widgets/appBar.dart';
import 'package:sary_project/widgets/itemCard.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({Key? key}) : super(key: key);

  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, "Item",
          leadingFunction: () => Navigator.pop(context),
          leadingIcon: Icons.west),
      body: Column(
        children: [
          ItemCard(),
          AddButton(
            addText: "Add Item",
            function: () {},
          ),
        ],
      ),
    );
  }
}
