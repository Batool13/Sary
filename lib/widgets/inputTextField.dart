import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// void Function(dynamic value)dynamic value)
// void Function(dynamic value)value) addFunction})value) addFunction}
class InputTextField extends StatelessWidget {
  const InputTextField(
      {Key? key,
      required this.addPrefixIcon,
      required this.addHint,
      required this.function})
      : super(
          key: key,
        );

  final IconData addPrefixIcon;
  final String addHint;
  final void Function(dynamic value) function;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: function,
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
