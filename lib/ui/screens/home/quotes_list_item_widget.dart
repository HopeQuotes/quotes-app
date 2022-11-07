import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotes/resources/colors.dart';
import 'package:quotes/ui/core/widgets/elevated_container_widget.dart';
import 'package:quotes/ui/core/widgets/scale_tap.dart';
import 'package:quotes/ui/core/widgets/translate_anim_widget.dart';

class QuoteItem extends StatelessWidget {
  int index;

  @override
  Widget build(BuildContext context) {
    return ScaleTap(
      child: Container(
        margin: const EdgeInsets.all(16),
        child: Slidable(
          key: ValueKey(index.toString()),
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
            duration: 700 + index,
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
                            "If you look at what you have in life, you'll always have more. If you look at what you don't have in life, you'll never have enough."),
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
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  QuoteItem({
    required this.index,
  });
}
