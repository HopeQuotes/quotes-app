import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../resources/colors.dart';
import 'colors.dart';
import 'fonts.dart';

enum MessageStatus { success, fail, informative }

extension ContextExt on BuildContext {
  void showSnackBar(String? message,
      {MessageStatus status = MessageStatus.success}) {
    if (message != null) {
      Color backColor = AppColors.indigo;

      if (status == MessageStatus.fail) {
        backColor = primaryRedColor;
      }

      Flushbar(
        maxWidth: 400,
        flushbarPosition: FlushbarPosition.TOP,
        duration: const Duration(seconds: 2),
        messageSize: 16,
        messageText: Text(
          message,
          style: getTextStyle(),
        ),
        backgroundColor: backColor,
        borderRadius: BorderRadius.circular(16),
        margin: const EdgeInsets.all(12),
      ).show(this);
    }
  }
}

void printMessage(String? message) {
  if (kDebugMode) {
    print(message);
  }
}
