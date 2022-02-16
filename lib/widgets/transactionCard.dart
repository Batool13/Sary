import 'package:flutter/material.dart';

import '../utils/dimens.dart';
import '../utils/fontsTheme.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({
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
                          "Afiaoilhjgjhfjkmkkkkkkkkkkkkkllllllllllllll",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "990",
                      style: FontsTheme.smallNormal,
                    ),
                    Text(
                      "990",
                      style: FontsTheme.smallNormal,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "990",
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
                  children: const [
                    Icon(
                      false ? Icons.south : Icons.north,
                      color: false ? Colors.green : Colors.red,
                      size: 40,
                    ),
                    Flexible(
                      child: SizedBox(
                        height: 30,
                      ),
                    ),
                    Text(
                      "09/9/1999",
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
