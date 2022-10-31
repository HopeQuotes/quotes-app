import 'package:flutter/material.dart';
import 'package:quotes/ui/screens/my_quotes/pending_quote.dart';
import 'package:quotes/ui/screens/my_quotes/quote_filter_tabs.dart';

import '../../../resources/colors.dart';
import '../../core/widgets/translate_anim_widget.dart';
import '../entrance/login_text.dart';
import '../home/quotes_list_item.dart';

class PendingQuotesPage extends StatelessWidget {
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
                  Row(
                    children: [
                      TransitionAnimWidget(
                        duration: 400,
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 32),
                          child: const TitleText(
                            text: 'Pending \nquotes',
                          ),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
