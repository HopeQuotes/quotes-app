import 'package:common/core/widgets/login_text_widget.dart';
import 'package:common/core/widgets/translate_anim_widget.dart';
import 'package:common/navigation/exp.dart';
import 'package:common/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:my_quotes/my_quotes/pending_quote_widget.dart';
import 'package:my_quotes/my_quotes/pending_quotes_filter_tabs_widget.dart';

class PendingQuotesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: AppColors.backgroundColor,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 100,
          itemBuilder: (BuildContext context, int index) {
            if (index > 0) {
              return PendingQuote(index: index);
            } else {
              return Column(
                children: [
                  TransitionAnimWidget(
                    duration: 500,
                    startDirection: StartDirection.start,
                    child: AnimatedContainer(
                      margin: const EdgeInsets.only(left: 6, top: 24),
                      curve: Curves.fastOutSlowIn,
                      height: 42,
                      duration: const Duration(milliseconds: 100),
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
                  ),
                  Row(
                    children: [
                      TransitionAnimWidget(
                        duration: 600,
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 32),
                          child: const TitleText(
                            paddingTop: 28,
                            text: 'Pending \nquotes',
                          ),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  PendingQuotesFilterTabs(),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
