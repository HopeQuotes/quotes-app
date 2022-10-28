import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quotes/resources/colors.dart';
import 'package:quotes/ui/core/widgets/add_chip_item.dart';
import 'package:quotes/ui/core/widgets/chip_item.dart';
import 'package:quotes/ui/navigation/navigator.dart';
import 'package:quotes/ui/screens/entrance/button.dart';
import 'package:quotes/utils/array.dart';

import '../../core/widgets/translate_anim_widget.dart';
import '../entrance/input.dart';
import '../entrance/login_text.dart';

enum VisibilityState { invisible, gone, visible }

class PublishPage extends StatefulWidget {
  @override
  State<PublishPage> createState() => _PublishPageState();
}

class _PublishPageState extends State<PublishPage> {
  final FocusNode authorFocusNode = FocusNode();
  final FocusNode bodyFocusNode = FocusNode();
  final FocusNode hashTagFocusNode = FocusNode();
  var backButtonVisible = VisibilityState.visible;
  var titleVisible = VisibilityState.visible;
  var authorInputVisible = VisibilityState.visible;
  var hashTagInputVisible = VisibilityState.invisible;
  var bodyInputVisible = VisibilityState.visible;
  var publishButtonInputVisible = VisibilityState.visible;
  var hashTagsVisible = VisibilityState.visible;

  TextEditingController bodyController = TextEditingController();

  List<String> hashTags = ["quote", "happiness", "family", "hi"];

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
          publishButtonInputVisible = VisibilityState.invisible;
          hashTagInputVisible = VisibilityState.invisible;
          hashTagsVisible = VisibilityState.invisible;
        });
      }
    });

    bodyFocusNode.addListener(() {
      setState(() {
        if (bodyFocusNode.hasFocus) {
          authorInputVisible = VisibilityState.invisible;
          titleVisible = VisibilityState.invisible;
          backButtonVisible = VisibilityState.invisible;
          publishButtonInputVisible = VisibilityState.invisible;
          hashTagInputVisible = VisibilityState.invisible;
          hashTagsVisible = VisibilityState.invisible;
        }
      });
    });
  }

  void showOnlyHashTagInput() {
    setState(() {
      authorInputVisible = VisibilityState.invisible;
      titleVisible = VisibilityState.invisible;
      backButtonVisible = VisibilityState.invisible;
      publishButtonInputVisible = VisibilityState.invisible;
      bodyInputVisible = VisibilityState.invisible;
      hashTagsVisible = VisibilityState.invisible;

      hashTagInputVisible = VisibilityState.visible;
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
                padding: EdgeInsets.only(top: 36),
              ),
              TransitionAnimWidget(
                duration: 1000,
                startDirection: StartDirection.start,
                child: AnimatedContainer(
                  curve: Curves.fastOutSlowIn,
                  height: 42,
                  duration: const Duration(milliseconds: 100),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          showAll();
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
              ),
              TransitionAnimWidget(
                duration: 1200,
                startDirection: StartDirection.start,
                child: AnimatedContainer(
                  curve: Curves.fastOutSlowIn,
                  height: titleVisible == VisibilityState.visible ? 152 : 0,
                  width: titleVisible == VisibilityState.visible ? 600 : 0,
                  duration: const Duration(milliseconds: 250),
                  child: const TitleText(
                    paddingTop: 32,
                    text: 'Publish your quotes',
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 32),
              ),
              AnimatedContainer(
                curve: Curves.fastOutSlowIn,
                height: authorInputVisible == VisibilityState.visible ? 62 : 0,
                width: authorInputVisible == VisibilityState.visible ? 600 : 0,
                duration: const Duration(milliseconds: 300),
                child: TransitionAnimWidget(
                  duration: 1300,
                  startDirection: StartDirection.start,
                  child: Input(
                    spread: 0,
                    blur: 0,
                    focusNode: authorFocusNode,
                    hint: 'Author name',
                    margin: const EdgeInsets.only(left: 24, right: 24, top: 0),
                  ),
                ),
              ),
              if (hashTagInputVisible == VisibilityState.visible)
                const Padding(
                  padding: EdgeInsets.only(top: 32),
                ),
              AnimatedContainer(
                curve: Curves.fastOutSlowIn,
                height: hashTagInputVisible == VisibilityState.visible ? 62 : 0,
                width: hashTagInputVisible == VisibilityState.visible ? 600 : 0,
                duration: const Duration(milliseconds: 300),
                child: TransitionAnimWidget(
                  duration: 600,
                  startDirection: StartDirection.start,
                  child: Input(
                    onSubmit: (str) {
                      hashTags.add(str);
                      showAll();
                    },
                    spread: 0,
                    blur: 0,
                    focusNode: hashTagFocusNode,
                    hint: 'HashTag...',
                    margin: const EdgeInsets.only(left: 24, right: 24, top: 0),
                  ),
                ),
              ),
              if (hashTagInputVisible == VisibilityState.visible)
                const Padding(
                  padding: EdgeInsets.only(top: 32),
                ),
              AnimatedOpacity(
                opacity: bodyInputVisible == VisibilityState.visible ? 1.0 : 0,
                duration: const Duration(milliseconds: 100),
                child: AnimatedContainer(
                  curve: Curves.fastOutSlowIn,
                  duration: const Duration(milliseconds: 300),
                  child: Container(
                    margin: const EdgeInsets.only(top: 24),
                    child: TransitionAnimWidget(
                      duration: 1400,
                      startDirection: StartDirection.end,
                      child: Input(
                        controller: bodyController,
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
              ),
              Visibility(
                visible: hashTagsVisible == VisibilityState.visible,
                child: Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.all(16),
                  child: RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      children: [
                        ...hashTags.mapIndexed(
                          (index, e) => WidgetSpan(
                            child: ChipItem(
                              key: ObjectKey(index.toString()),
                              text: e,
                              onDelete: (index) {
                                setState(() {
                                  hashTags.removeAt(index);
                                });
                              },
                              index: index,
                            ),
                          ),
                        ),
                        WidgetSpan(
                          child: ChipItemAdd(onClick: () {
                            showOnlyHashTagInput();
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 24),
              ),
              Visibility(
                visible: publishButtonInputVisible == VisibilityState.visible,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: TransitionAnimWidget(
                    duration: 1000,
                    startDirection: StartDirection.bottom,
                    child: Button(
                      title: 'Pubish',
                      onClick: () {
                        //
                      },
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

  void showAll() {
    if (titleVisible == VisibilityState.invisible) {
      setState(() {
        authorInputVisible = VisibilityState.visible;
        titleVisible = VisibilityState.visible;
        backButtonVisible = VisibilityState.visible;
        bodyInputVisible = VisibilityState.visible;
        publishButtonInputVisible = VisibilityState.visible;
        hashTagInputVisible = VisibilityState.invisible;
        hashTagsVisible = VisibilityState.visible;
      });
    } else {
      context.goBack();
    }
  }
}
