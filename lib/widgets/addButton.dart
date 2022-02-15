import 'package:flutter/material.dart';
import 'package:sary_project/utils/dimens.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    required this.addText,
    required this.function,
    required this.heroTag,
    Key? key,
  }) : super(key: key);
  final String addText;
  final VoidCallback function;
  final String heroTag;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: Padding(
          padding: Dimens.paddding10all,
          child: Container(
            width: 350,
            height: 45,
            child: FloatingActionButton(
              heroTag: heroTag,
              onPressed: function,
              child: Text(addText),
              elevation: 5,
            ),
          ),
        ),
      ),
    );
  }
}
