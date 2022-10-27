import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension NavigatorCustom<T> on BuildContext {
  void navigateTo(Widget widget) {
    Navigator.of(this).push(CustomPageRoute(widget));
  }

  void goBack() {
    Navigator.pop(this);
  }
}

class CustomPageRoute<T> extends PageRoute<T> {
  CustomPageRoute(this.child);

  @override
  // TODO: implement barrierColor
  Color get barrierColor => Colors.black;

  @override
  String? get barrierLabel => null;

  final Widget child;

  @override
  Widget buildPage(
      BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => Duration(milliseconds: 500);
}
