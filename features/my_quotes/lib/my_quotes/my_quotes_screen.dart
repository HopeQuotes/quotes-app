import 'package:common/core/widgets/login_text_widget.dart';
import 'package:common/core/widgets/translate_anim_widget.dart';
import 'package:common/navigation/exp.dart';
import 'package:common/resources/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_quotes/my_quotes/pending_quotes_screen.dart';
import 'package:my_quotes/my_quotes/quote_filter_tabs_widget.dart';
import 'package:my_quotes/my_quotes/quotes_list_item_widget.dart';

class MyQuotesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundColor,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          if (index > 0) {
            return QuoteItem(index: index);
          } else {
            return Column(
              children: [
                Row(
                  children: [
                    TransitionAnimWidget(
                      duration: 400,
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 32),
                        child: const TitleText(
                          text: 'Your quotes',
                        ),
                      ),
                    ),
                    const Spacer(),
                    TransitionAnimWidget(
                      startDirection: StartDirection.end,
                      duration: 500,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        margin: const EdgeInsets.only(right: 16, top: 32),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.indigo,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12.withOpacity(0.05),
                              blurRadius: 18,
                              spreadRadius: 10,
                              offset: const Offset(0, 0), // shadow direction: bottom right
                            )
                          ],
                        ),
                        child: GestureDetector(
                          child: const Icon(
                            size: 32,
                            Icons.access_time_rounded,
                            color: Colors.white,
                          ),
                          onTap: () {
                            context.navigateTo(PendingQuotesScreen());
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                QuoteFilterTabs(),
              ],
            );
          }
        },
      ),
    );
  }
}
