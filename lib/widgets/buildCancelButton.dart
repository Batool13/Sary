import 'package:flutter/material.dart';

Widget buildCancelButton(BuildContext context) => TextButton(
      child: Text('Cancel'),
      onPressed: () => Navigator.of(context).pop(),
    );
