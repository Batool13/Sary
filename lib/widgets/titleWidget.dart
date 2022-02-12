import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../main.dart';
import '../utils/convertHexToColor.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final MyHomePage widget;

  @override
  Widget build(BuildContext context) {
    return Text(widget.title,
        style: TextStyle(
          fontSize: 22,
          color: ConvertHexToColor.hexStringToColor("#404040"),
        ));
  }
}
