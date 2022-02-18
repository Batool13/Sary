import 'package:flutter/material.dart';

import 'dimens.dart';

class ProjectDecorations {
  static InputDecoration buildInputDecoration10radius(String hint) {
    return InputDecoration(
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
    );
  }
}
