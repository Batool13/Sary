import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton(

      // this.function,
      {
    Key? key,
    required this.myIcon,
  }) : super(key: key);

  final IconData myIcon;
  // final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {}, icon: Icon(myIcon, color: Colors.black, size: 19.7));
  }
}
