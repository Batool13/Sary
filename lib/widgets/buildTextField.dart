import 'package:flutter/material.dart';

import '../utils/decoration.dart';
import '../utils/dimens.dart';

class BuildTextField extends StatelessWidget {
  const BuildTextField({
    Key? key,
    bool? readOnly,
    required this.myController,
    required this.hint,
  }) : super(key: key);

  final TextEditingController myController;
  final String hint;
  final bool readOnly = false;

  @override
  Widget build(BuildContext context) => TextFormField(
        readOnly: readOnly,
        controller: myController,
        decoration: ProjectDecorations.buildInputDecoration10radius(hint),
        validator: (name) =>
            name != null && name.isEmpty ? 'Enter a name' : null,
      );
}
