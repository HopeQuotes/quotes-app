import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quotes/resources/colors.dart';
import 'package:quotes/ui/navigation/navigator.dart';

import '../../core/widgets/translate_anim_widget.dart';
import '../entrance/input.dart';
import '../entrance/login_text.dart';
import 'body_input_page.dart';

enum VisibilityState { invisible, gone, visible }

class PublishPage extends StatefulWidget {
  @override
  State<PublishPage> createState() => _PublishPageState();
}

class _PublishPageState extends State<PublishPage> {
  final FocusNode authorFocusNode = FocusNode();
  final FocusNode bodyFocusNode = FocusNode();
  var backButtonVisible = VisibilityState.visible;
  var titleVisible = VisibilityState.visible;
  var authorInputVisible = VisibilityState.visible;
  var bodyInputVisible = VisibilityState.visible;
  var visibilityAnimDurationMillis = 1000;

  @override
  void initState() {
    observeFocusChanges();
    super.initState();
  }

  void observeFocusChanges() {
    authorFocusNode.addListener(() {
      //
    });

    bodyFocusNode.addListener(() {
      if (bodyFocusNode.hasFocus) {
        context.navigateTo(BodyInputPage());
        bodyFocusNode.unfocus();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: AppColors.backgroundColor,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 24),
              ),
              Row(
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
              const TitleText(
                paddingTop: 32,
                text: 'Publish your quotes',
              ),
              const Padding(
                padding: EdgeInsets.only(top: 32),
              ),
              Container(
                margin: const EdgeInsets.only(top: 24),
                child: TransitionAnimWidget(
                  duration: 1000,
                  startDirection: StartDirection.bottom,
                  child: Input(
                    spread: 0,
                    blur: 0,
                    focusNode: authorFocusNode,
                    hint: 'Author name',
                    margin: const EdgeInsets.only(left: 24, right: 24, top: 0),
                  ),
                ),
              ),
              Hero(
                tag: 'body',
                child: Container(
                  margin: const EdgeInsets.only(top: 24),
                  child: TransitionAnimWidget(
                    duration: 1000,
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
            ],
          ),
        ),
      ),
    );
  }
}
