import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension NavigatorCustom<T> on BuildContext {
  void navigateTo(Widget widget) {
    Navigator.push(
      this,
      MaterialPageRoute(builder: (context) => widget),
    );
  }

  void goBack() {
    Navigator.pop(this);
  }
}

abstract class NavigationModuleController {
  void navigate(Module module) {}
}

enum Module { home, fullScreenQuotes, publish, myQuotes, profile }
