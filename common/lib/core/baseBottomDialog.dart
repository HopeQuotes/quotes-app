import 'package:flutter/material.dart';

void baseBottomDialog(
    {required BuildContext context, required Widget content}) async {
  await showModalBottomSheet(
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24.0),
    ),    context: context,
    builder: (context) {
      return content;
    },
  );
}
