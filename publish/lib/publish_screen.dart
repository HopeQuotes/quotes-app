import 'package:common/core/widgets/add_chip_item_widget.dart';
import 'package:common/core/widgets/button_widget.dart';
import 'package:common/core/widgets/chip_item_widget.dart';
import 'package:common/core/widgets/input_widget.dart';
import 'package:common/core/widgets/login_text_widget.dart';
import 'package:common/core/widgets/translate_anim_widget.dart';
import 'package:common/navigation/exp.dart';
import 'package:common/resources/colors.dart';
import 'package:common/utils/array.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum VisibilityState { invisible, gone, visible }

class PublishScreen extends StatefulWidget {
  @override
  State<PublishScreen> createState() => _PublishScreenState();
}

class _PublishScreenState extends State<PublishScreen> {
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
  var switchButtonVisible = VisibilityState.visible;
  var quotesAnimated = false;
  var publishButtonAnimated = false;
  var switchButtonAnimated = false;

  TextEditingController bodyController = TextEditingController();

  List<String> hashTags = ["quote", "happiness", "family", "hi"];

  var publicQuote = true;

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
          switchButtonVisible = VisibilityState.invisible;
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
          switchButtonVisible = VisibilityState.invisible;
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
      switchButtonVisible = VisibilityState.invisible;

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
                    onSubmit: (str) {
                      showAll();
                    },
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
                  duration: 400,
                  startDirection: StartDirection.bottom,
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
                        onSubmit: (str) {
                          showAll();
                        },
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
                child: TransitionAnimWidget(
                    animate: !quotesAnimated,
                    onEnd: () {
                      quotesAnimated = true;
                    },
                    duration: 1500,
                    startDirection: StartDirection.bottom,
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
                    )),
              ),
              Visibility(
                visible: switchButtonVisible == VisibilityState.visible,
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 24),
                      child: TransitionAnimWidget(
                        animate: !switchButtonAnimated,
                        duration: 1600,
                        startDirection: StartDirection.start,
                        child: Text(
                          'Public',
                          style: GoogleFonts.nunito(
                              fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 12),
                      child: TransitionAnimWidget(
                        onEnd: () {
                          switchButtonAnimated = true;
                        },
                        animate: !switchButtonAnimated,
                        duration: 1600,
                        startDirection: StartDirection.start,
                        child: CupertinoSwitch(
                          value: publicQuote,
                          onChanged: (value) {
                            setState(() {
                              publicQuote = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 12),
              ),
              Visibility(
                visible: publishButtonInputVisible == VisibilityState.visible,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: TransitionAnimWidget(
                    onEnd: () {
                      publishButtonAnimated = true;
                    },
                    animate: !publishButtonAnimated,
                    duration: 1600,
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
        switchButtonVisible = VisibilityState.visible;

        authorFocusNode.unfocus();
        bodyFocusNode.unfocus();
      });
    } else {
      context.goBack();
    }
  }
}