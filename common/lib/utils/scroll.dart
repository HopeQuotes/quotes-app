import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension ScrollControllerExt on ScrollController {
  void onBottomReached(Function() onReached) {
    addListener(() async {
      if (position.atEdge) {
        bool isTop = position.pixels == 0;
        if (isTop) {
          //
        } else {
          onReached.call();
        }
      }
    });
  }
}

extension TabController on String {
  int toScreenIndex() {
    if (this == "verified") return 0;
    return 1;
  }
}
