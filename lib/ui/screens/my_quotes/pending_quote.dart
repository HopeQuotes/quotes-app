import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotes/resources/colors.dart';
import 'package:quotes/ui/core/widgets/elevated_container.dart';
import 'package:quotes/ui/core/widgets/translate_anim_widget.dart';
import 'package:quotes/ui/screens/my_quotes/pending_quote_state.dart';

class PendingQuote extends StatefulWidget {
  int index;

  @override
  State<PendingQuote> createState() => _PendingQuoteState();

  PendingQuote({
    super.key,
    required this.index,
  });
}

class _PendingQuoteState extends State<PendingQuote> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Slidable(
        key: ValueKey(widget.index.toString()),
        endActionPane: ActionPane(
          extentRatio: 0.65,
          motion: const ScrollMotion(),
          dragDismissible: false,
          children: [
            CustomSlidableAction(
              flex: 1,
              padding: const EdgeInsets.only(left: 16, right: 0),
              backgroundColor: Colors.transparent,
              onPressed: (onPressed) {},
              child: const ElevatedContainer(
                radius: 16,
                height: 56,
                blur: 12,
                spread: 14,
                width: double.infinity,
                child: Icon(
                  Icons.thumb_up_off_alt_outlined,
                  color: Colors.black54,
                ),
              ),
            ),
            CustomSlidableAction(
              flex: 1,
              padding: const EdgeInsets.only(left: 10, right: 8),
              backgroundColor: Colors.transparent,
              onPressed: (onPressed) {},
              child: ElevatedContainer(
                radius: 16,
                color: AppColors.red,
                blur: 12,
                spread: 14,
                height: 56,
                width: double.infinity,
                child: const Icon(
                  Icons.thumb_down_off_alt_outlined,
                  color: Colors.white,
                ),
              ),
            ),
            CustomSlidableAction(
              flex: 1,
              padding: const EdgeInsets.only(left: 8, right: 12),
              backgroundColor: Colors.transparent,
              onPressed: (onPressed) {},
              child: ElevatedContainer(
                radius: 16,
                color: AppColors.indigo,
                blur: 12,
                spread: 14,
                height: 56,
                width: double.infinity,
                child: const Icon(
                  Icons.share,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        child: TransitionAnimWidget(
          duration: 700 + widget.index,
          child: ElevatedContainer(
            blur: 3,
            spread: 24,
            height: 232,
            child: ClipRRect(
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                          style: GoogleFonts.nunito(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                              color: Colors.black26),
                          textAlign: TextAlign.center,
                          "- Oprah Winfrey -"),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      margin: const EdgeInsets.all(24),
                      alignment: Alignment.center,
                      child: Text(
                          style: GoogleFonts.nunito(fontWeight: FontWeight.w600, fontSize: 16),
                          textAlign: TextAlign.center,
                          "The best and most beautiful things in the world cannot be seen or even touched - they must be felt with the heart."),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 1000, bottom: 1300),
                    child: Icon(
                      Icons.circle_outlined,
                      size: 125,
                      color: Colors.indigo.withAlpha(6),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      margin: const EdgeInsets.only(left: 200, top: 80),
                      child: Icon(
                        Icons.favorite_border,
                        size: 200,
                        color: Colors.indigo.withAlpha(8),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      margin: const EdgeInsets.only(left: 24, top: 80, bottom: 32),
                      child: Icon(
                        Icons.rectangle_outlined,
                        size: 62,
                        color: Colors.indigo.withAlpha(8),
                      ),
                    ),
                  ),
                  if (widget.index % 2 != 0)
                    PendingQuoteState(
                      backgroundColor: AppColors.green,
                      stateTitle: 'Verified',
                      toolTipMessage: "Your quote successfully verified !",
                      endWidget: const Icon(
                        Icons.info_outline_rounded,
                        size: 24,
                        color: Colors.white,
                      ),
                      index: widget.index,
                    ),
                  if (widget.index % 3 == 0)
                    PendingQuoteState(
                      backgroundColor: Colors.brown,
                      stateTitle: 'Pending',
                      toolTipMessage: "Pending, please wait",
                      endWidget: const Icon(
                        Icons.info_outline_rounded,
                        size: 24,
                        color: Colors.white,
                      ),
                      index: widget.index,
                    ),
                  if (widget.index % 2 == 0)
                    PendingQuoteState(
                      backgroundColor: AppColors.red,
                      stateTitle: 'Rejected',
                      toolTipMessage: "It should *NOT* be used in the following situations",
                      endWidget: const Icon(
                        Icons.info_outline_rounded,
                        size: 24,
                        color: Colors.white,
                      ),
                      index: widget.index,
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
