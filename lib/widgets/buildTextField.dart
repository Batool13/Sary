import 'package:flutter/material.dart';

import '../utils/dimens.dart';

class BuildTextField extends StatelessWidget {
  const BuildTextField({
    Key? key,
    required this.myController,
    required this.hint,
  }) : super(key: key);

  final TextEditingController myController;
  final String hint;

  @override
  Widget build(BuildContext context) => TextFormField(
        controller: myController,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: Dimens.borderRadius10all,
            borderSide: BorderSide(
              style: BorderStyle.solid,
              color: Colors.purple,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: Dimens.borderRadius10all,
            borderSide: BorderSide(
              color: Colors.grey,
              style: BorderStyle.solid,
            ),
          ),
          contentPadding: Dimens.paddding10all,
          isDense: false,
          hintText: hint,
        ),
        validator: (name) =>
            name != null && name.isEmpty ? 'Enter a name' : null,
      );
}
