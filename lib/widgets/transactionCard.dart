import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:sary_project/hiveModel/item.dart';
import 'package:sary_project/provider/itemProvider.dart';

import '../boxes.dart';
import '../hiveModel/transaction.dart';
import '../utils/dimens.dart';
import '../utils/fontsTheme.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({
    Key? key,
    required this.itemId,
    required this.quantity,
    required this.inboundAt,
    required this.outboundAt,
    required this.type,
  }) : super(key: key);
  final String type;
  final String inboundAt;
  final String outboundAt;
  final String itemId;
  final String quantity;
  @override
  Widget build(BuildContext context) {
    Item? item = ItemProvider().getItemById(itemId);
    String name = "";
    String sku = "";
    String description = "";
    String price = "";
    if (item != null) {
      name = item.name;
      sku = item.sku;
      description = item.description;
      price = item.price; // Safe }

    }

    return Container(
      height: 160,
      width: 500,
      child: Card(
        child: Padding(
            padding: Dimens.paddding15all,
            child: Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Expanded(
                      flex: 6,
                      child: Container(
                        width: 150,
                        child: Text(
                          name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      sku,
                      style: FontsTheme.smallNormal,
                    ),
                    Text(
                      description,
                      style: FontsTheme.smallNormal,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      price + " SR",
                      style: FontsTheme.smallBold,
                    ),
                  ],
                ),
                Flexible(
                    child: SizedBox(
                  width: 300,
                )),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      type == "inbound" ? Icons.south : Icons.north,
                      color: type == "inbound" ? Colors.green : Colors.red,
                      size: 40,
                    ),
                    Flexible(
                      child: SizedBox(
                        height: 30,
                      ),
                    ),
                    Text(
                      type == "inbound" ? inboundAt : outboundAt,
                      style: FontsTheme.smallBold,
                    ),
                  ],
                ),
                SizedBox(
                  width: 15,
                ),
              ],
            )),
      ),
    );
  }
}
