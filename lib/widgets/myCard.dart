import 'package:flutter/material.dart';

import '../utils/dimens.dart';
import '../utils/fontsTheme.dart';

class MyCard extends StatelessWidget {
  const MyCard({
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
                const Flexible(
                  flex: 0,
                  child: SizedBox(
                    width: 15,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                const Flexible(
                  flex: 1,
                  child: SizedBox(
                    width: 230,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Flexible(
                      flex: 1,
                      child: SizedBox(
                        height: 50,
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Icon(
                        false ? Icons.south : Icons.north,
                        color: false ? Colors.green : Colors.red,
                        size: 40,
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: SizedBox(
                        height: 50,
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Text(
                        "09/9/1999",
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
