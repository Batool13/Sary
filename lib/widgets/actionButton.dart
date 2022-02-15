import 'package:flutter/material.dart';

import '../itemsPage.dart';

AppBar buildAppBar(BuildContext context, String title,
    {VoidCallback? actionFunction,
    IconData? actionIcon,
    IconData? leadingIcon,
    VoidCallback? leadingFunction}) {
  return AppBar(
    title: Text(title),
    actions: <Widget>[
      IconButton(onPressed: actionFunction, icon: Icon(actionIcon)),
    ],
    leading: IconButton(
      onPressed: leadingFunction,
      icon: Icon(leadingIcon),
    ),
  );
}

// class ActionButton extends StatelessWidget {
//   const ActionButton(

//       // this.function,
//       {Key? key,
//       required this.myIcon,
//       required this.function})
//       : super(key: key);

//   final IconData myIcon;
//   final VoidCallback function;
//   // final VoidCallback function;

//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//         onPressed: function,
//         icon: Icon(myIcon, color: Colors.black, size: 19.7));
//   }
// }
