import 'package:flutter/cupertino.dart';

void unfocus() {
  FocusManager.instance.primaryFocus?.unfocus();
}
