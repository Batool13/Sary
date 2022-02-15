import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sary_project/hiveModel/item.dart';
import 'package:sary_project/provider/itemProvider.dart';
import 'package:sary_project/utils/convertHexToColor.dart';
import 'package:sary_project/widgets/actionButton.dart';
import 'package:sary_project/widgets/addButton.dart';
import 'package:sary_project/widgets/addItemDialog.dart';
import 'package:sary_project/widgets/itemCard.dart';

import 'boxes.dart';

class ItemPage extends StatefulWidget {
  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: buildAppBar(context, "Items", leadingFunction: () {
          Navigator.pop(
            context,
          );
        }, leadingIcon: Icons.west),
        body: ValueListenableBuilder<Box<Item>>(
          valueListenable: Boxes.getItems().listenable(),
          builder: (context, box, _) {
            final items = box.values.toList().cast<Item>();

            return buildContent(items);
          },
        ),
      );

  Widget buildContent(List<Item> items) {
    if (items.isEmpty) {
      return Column(
        children: [
          Expanded(
            flex: 5,
            child: Center(
              child: Text(
                'No items yet!',
              ),
            ),
          ),
          AddButton(
              heroTag: "add",
              addText: "Add Item",
              function: () => showDialog(
                  context: context,
                  builder: (context) => ItemDialog(
                        onClickedDone: ItemProvider().addItem,
                      )))
        ],
      );
    } else {
      return Column(
        children: [
          Expanded(
            flex: 7,
            child: ListView.builder(
              padding: EdgeInsets.all(8),
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                final item = items[index];

                return Dismissible(
                  background: slideRightBackground(),
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
                        builder: (context) => ItemDialog(
                          item: item,
                          onClickedDone: (name, price, sku, description,
                                  image) =>
                              ItemProvider().updateItem(
                                  item, name, price, sku, description, image),
                        ),
                      ));
                    }
                  },
                  key: ObjectKey(item),
                  child: buildItem(context, item),
                  onDismissed: (direction) {
                    ItemProvider().deleteItem(item);
                  },
                );
              },
            ),
          ),
          AddButton(
              heroTag: "add",
              addText: "Add Item",
              function: () => showDialog(
                  context: context,
                  builder: (context) => ItemDialog(
                        onClickedDone: ItemProvider().addItem,
                      )))
        ],
      );
    }
  }

  Widget buildItem(
    BuildContext context,
    Item item,
  ) {
    final name = item.name;
    final sku = item.sku;
    final description = item.description;
    final price = item.price;
    final image = item.image;

    return ItemCard(
      name: name,
      sku: sku,
      description: description,
      price: price,
      image: image,
      item: item,
    );
  }

  // Widget buildButtons(BuildContext context, Item item) => Row(
  //       children: [
  //         Expanded(
  //           child: TextButton.icon(
  //             label: Text('Edit'),
  //             icon: Icon(Icons.edit),
  //             onPressed: () => Navigator.of(context).push(
  //               MaterialPageRoute(
  //                 builder: (context) => ItemDialog(
  //                   item: item,
  //                   onClickedDone: (name, price, sku, description, image) =>
  //                       ItemProvider().updateItem(
  //                           item, name, price, sku, description, image),
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ),
  //         Expanded(
  //           child: TextButton.icon(
  //             label: Text('Delete'),
  //             icon: Icon(Icons.delete),
  //             onPressed: () => ItemProvider().deleteItem(item),
  //           ),
  //         )
  //       ],
  //     );

}

Widget slideLeftBackground() {
  return Container(
    color: Colors.red,
    child: Align(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Icon(
            Icons.delete,
            color: Colors.white,
          ),
          Text(
            " Delete",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.right,
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      alignment: Alignment.centerRight,
    ),
  );
}

Widget slideRightBackground() {
  return Container(
    color: Colors.green,
    child: Align(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.edit,
            color: Colors.white,
          ),
          Text(
            " Edit",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
      alignment: Alignment.centerLeft,
    ),
  );
}
