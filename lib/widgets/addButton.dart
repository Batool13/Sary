import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sary_project/utils/dimens.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    required this.addText,
    required this.function,
    required this.heroTag,
    required this.addIcon,
    Key? key,
  }) : super(key: key);
  final String addText;
  final VoidCallback function;
  final String heroTag;
  final IconData addIcon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Dimens.paddding15all,
      child: Container(
        width: 400,
        height: 45,
        child: FloatingActionButton(
          heroTag: heroTag,
          onPressed: function,
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  addIcon,
                ),
                Text(addText),
              ],
            ),
          ),

          // Text(addText),
          elevation: 5,
        ),
      ),
    );
  }
}
