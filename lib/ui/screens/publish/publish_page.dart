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
  double? bodyHeight = 120.0;

  var list = ["", "", ''];

  @override
  void initState() {
    observeFocusChanges();
    super.initState();
  }

  void observeFocusChanges() {
    authorFocusNode.addListener(() {
      if (authorFocusNode.hasFocus) {
        setState(() {
          authorInputVisible = VisibilityState.visible;
          titleVisible = VisibilityState.invisible;
          backButtonVisible = VisibilityState.invisible;
          bodyInputVisible = VisibilityState.invisible;
        });
      }
    });

    bodyFocusNode.addListener(() {
      setState(() {
        if (bodyFocusNode.hasFocus) {
          authorInputVisible = VisibilityState.invisible;
          titleVisible = VisibilityState.invisible;
          backButtonVisible = VisibilityState.invisible;
        }
      });
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
              AnimatedContainer(
                height: 42,
                duration: const Duration(milliseconds: 200),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        if (titleVisible == VisibilityState.invisible) {
                          setState(() {
                            bodyHeight = 120;
                            authorInputVisible = VisibilityState.visible;
                            titleVisible = VisibilityState.visible;
                            backButtonVisible = VisibilityState.visible;
                            bodyInputVisible = VisibilityState.visible;
                          });
                        } else {
                          context.goBack();
                        }
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
              AnimatedContainer(
                height: titleVisible == VisibilityState.visible ? 100 : 0,
                duration: Duration(milliseconds: 250),
                child: const TitleText(
                  paddingTop: 32,
                  text: 'Publish your quotes',
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 32),
              ),
              AnimatedContainer(
                height: authorInputVisible == VisibilityState.visible ? 88 : 0,
                duration: Duration(milliseconds: 300),
                child: Container(
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
              ),
              AnimatedContainer(
                onEnd: () {
                  bodyHeight = null;
                },
                height: bodyInputVisible == VisibilityState.visible ? bodyHeight : 0,
                duration: const Duration(milliseconds: 300),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
