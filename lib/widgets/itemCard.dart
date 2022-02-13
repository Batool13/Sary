import 'package:flutter/material.dart';

import '../utils/dimens.dart';
import '../utils/fontsTheme.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key? key,
  }) : super(key: key);

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
                          "http://www.othaimmarkets.com/media/catalog/product/cache/4/image/9df78eab33525d08d6e5fb8d27136e95/5/6/561955_0.jpg",
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
                  children: const [
                    Flexible(
                      flex: 0,
                      child: SizedBox(
                        height: 5,
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Text(
                        "Afia oilhjgjhfj",
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
                        "990",
                        style: FontsTheme.smallNormal,
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Text(
                        "990",
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
                        "990",
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
