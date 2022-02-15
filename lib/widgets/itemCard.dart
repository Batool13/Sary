import 'package:flutter/material.dart';

import '../hiveModel/item.dart';
import '../provider/itemProvider.dart';
import '../utils/dimens.dart';
import '../utils/fontsTheme.dart';
import 'addItemDialog.dart';

class ItemCard extends StatelessWidget {
  //   "id": 2,
  //   "name": "Afia Corn Oil",
  //   "price": "12.13",
  //   "sku": "PRO-SA2",
  //   "description": "6 x 320 ml",
  //   "image": ""
  // }

  const ItemCard({
    required this.name,
    required this.price,
    required this.sku,
    required this.description,
    required this.image,
    required this.item,
    Key? key,
  }) : super(key: key);
  final String name, price, sku, description, image;
  final Item item;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: 500,
      child: Card(
        child: Padding(
            padding: Dimens.paddding15all,
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        width: 100,
                        height: 100,
                        color: Colors.yellow,
                        child: Image.network(
                          image,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
                const Flexible(
                  flex: 0,
                  child: SizedBox(
                    width: 15,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 0,
                      child: SizedBox(
                        height: 5,
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Text(
                        name,
                        style: FontsTheme.mediumNorma,
                      ),
                    ),
                    Flexible(
                      flex: 0,
                      child: SizedBox(
                        height: 5,
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Text(
                        sku,
                        style: FontsTheme.smallNormal,
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Text(
                        description,
                        style: FontsTheme.smallNormal,
                      ),
                    ),
                    Flexible(
                      flex: 0,
                      child: SizedBox(
                        height: 15,
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Text(
                        price + " SR",
                        style: FontsTheme.smallBold,
                      ),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
