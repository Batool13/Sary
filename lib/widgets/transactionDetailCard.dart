import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import '../boxes.dart';
import '../hiveModel/item.dart';
import '../hiveModel/transaction.dart';
import '../provider/itemProvider.dart';
import '../utils/decoration.dart';
import '../utils/dimens.dart';
import '../utils/fontsTheme.dart';
import 'addItemDialog.dart';

class TransactionDetailCard extends StatelessWidget {
  //   "id": 2,
  //   "name": "Afia Corn Oil",
  //   "price": "12.13",
  //   "sku": "PRO-SA2",
  //   "description": "6 x 320 ml",
  //   "image": ""
  // }

  const TransactionDetailCard({
    required this.transactionKey,
    Key? key,
  }) : super(key: key);
  final transactionKey;

  @override
  Widget build(BuildContext context) {
    Boxes.getItems().listenable();
    final transactionbox = Boxes.getTransaction();

    Transaction? transaction = transactionbox.get(transactionKey);

    print("kmbjhfhf");
    print(transaction?.itemId);

    Boxes.getItems().listenable();
    final box = Boxes.getItems();
    box.containsKey(transaction?.itemId);

    int keyItem = int.parse(transaction!.itemId);
    Item? item = box.get(keyItem);
    print("kmbjhfhf");
    print(item?.name);

    return Container(
      width: 500,
      child: Card(
        child: Padding(
          padding: Dimens.paddding15all,
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            color: Colors.yellow,
                            child: Image.network(
                              item!.image,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: 150,
                        child: Text(
                          item.name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: FontsTheme.mediumNorma,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        item.sku,
                        style: FontsTheme.smallNormal,
                      ),
                      Text(
                        item.description,
                        style: FontsTheme.smallNormal,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: Dimens.paddding15all,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWithLable(
                      text: transaction.quantity,
                      lable: "Quantity",
                      title: "",
                    ),
                    TextWithLable(
                      text: item.price,
                      lable: "Price",
                      title: "",
                    ),
                    Flexible(
                      child: Container(
                        width: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              transaction.type == "inbound"
                                  ? Icons.south
                                  : Icons.north,
                              color: transaction.type == "inbound"
                                  ? Colors.green
                                  : Colors.red,
                              size: 40,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: Dimens.paddding15all,
                child: Row(
                  children: [
                    TextWithLable(
                      text: transaction.inboundAt,
                      lable: "Date",
                      title: "Inbound",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: Dimens.paddding15all,
                child: Row(
                  children: [
                    TextWithLable(
                      text: transaction.outboundAt,
                      lable: "Date",
                      title: "Outbound",
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TextWithLable extends StatelessWidget {
  const TextWithLable({
    Key? key,
    required this.title,
    required this.text,
    required this.lable,
  }) : super(key: key);

  final String text, lable;

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          Text(
            text,
            style: FontsTheme.mediumBold,
          ),
          Text(
            lable,
            style: FontsTheme.XsmallGray,
          ),
        ],
      ),

      // child: TextField(
      //   readOnly: true,
      //   maxLines: 2,
      //   style: FontsTheme.mediumBold,
      //   decoration: InputDecoration(
      //       border: InputBorder.none,
      //       label: Center(
      //         child: Text(
      //           transaction.quantity,
      //           style: FontsTheme.mediumBold,
      //         ),
      //       ),
      //       labelStyle: FontsTheme.mediumBold,
      //       counter: Center(
      //         child: Text(
      //           "Quantity",
      //           style: FontsTheme.XsmallGray,
      //         ),
      //       )),
      // ),
    );
  }
}
