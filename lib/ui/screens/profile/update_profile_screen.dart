import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quotes/ui/navigation/navigator.dart';
import 'package:quotes/ui/screens/entrance/button_widget.dart';
import 'package:quotes/ui/screens/my_quotes/pending_quotes_screen.dart';
import 'package:quotes/ui/screens/my_quotes/quote_filter_tabs_widget.dart';

import '../../../resources/colors.dart';
import '../../core/widgets/translate_anim_widget.dart';
import '../entrance/input_widget.dart';
import '../entrance/login_text_widget.dart';
import '../home/quotes_list_item_widget.dart';

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
