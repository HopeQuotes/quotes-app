import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quotes/resources/colors.dart';

import '../../core/widgets/translate_anim_widget.dart';
import '../entrance/input.dart';

class BodyInputPage extends StatefulWidget {
  @override
  State<BodyInputPage> createState() => _BodyInputPageState();
}

class _BodyInputPageState extends State<BodyInputPage> {
  final FocusNode bodyFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.backgroundColor,
      child: Column(
        children: [
          Container(
              margin: const EdgeInsets.only(top: 24),
              child: Hero(
                tag: 'body',
                child: Container(
                  margin: const EdgeInsets.only(top: 24),
                  child: Material(
                    color: AppColors.backgroundColor,
                    child: TransitionAnimWidget(
                      duration: 0,
                      startDirection: StartDirection.bottom,
                      child: Input(
                        spread: 0,
                        blur: 0,
                        focusNode: bodyFocusNode,
                        verticalPadding: 36,
                        multiLine: true,
                        hint: 'Quote body...',
                        margin: const EdgeInsets.only(left: 24, right: 24, top: 0),
                      ),
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
