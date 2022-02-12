import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  const InputTextField(
      {Key? key, required this.addPrefixIcon, required this.addHint})
      : super(
          key: key,
        );

  final IconData addPrefixIcon;
  final String addHint;
  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.start,
      decoration: InputDecoration(
        hintText: addHint,
        prefixIcon: Icon(
          addPrefixIcon,
          color: Colors.grey,
        ),
      ),
    );
  }
}
