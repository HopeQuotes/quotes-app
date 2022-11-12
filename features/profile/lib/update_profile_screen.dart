import 'package:common/core/widgets/button_widget.dart';
import 'package:common/core/widgets/input_widget.dart';
import 'package:common/core/widgets/login_text_widget.dart';
import 'package:common/core/widgets/translate_anim_widget.dart';
import 'package:common/navigation/exp.dart';
import 'package:common/resources/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UpdateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: AppColors.backgroundColor,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8),
            ),
            TransitionAnimWidget(
              duration: 500,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      context.goBack();
                    },
                    icon: const Icon(
                      Icons.keyboard_arrow_left_outlined,
                      size: 42,
                    ),
                  ),
                  const Spacer()
                ],
              ),
            ),
            TransitionAnimWidget(
              duration: 600,
              child: Container(
                margin: const EdgeInsets.only(bottom: 32),
                child: const TitleText(
                  text: 'Update your profile',
                ),
              ),
            ),
            TransitionAnimWidget(
              startDirection: StartDirection.end,
              duration: 700,
              child: Input(
                hint: 'Nickname',
                margin: const EdgeInsets.only(left: 24, right: 24, top: 0),
              ),
            ),
            const Spacer(),
            TransitionAnimWidget(
              duration: 900,
              startDirection: StartDirection.bottom,
              child: Button(title: 'Save', onClick: () {}),
            ),
          ],
        ),
      ),
    );
  }
}
