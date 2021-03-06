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
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.yellow,
                      child: Image.network(
                        image,
                        fit: BoxFit.fill,
                      ),
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
                        name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: FontsTheme.mediumNorma,
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
              ],
            )),
      ),
    );
  }
}
