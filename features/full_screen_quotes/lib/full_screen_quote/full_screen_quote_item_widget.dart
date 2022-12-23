import 'package:common/core/widgets/translate_anim_widget.dart';
import 'package:domain/models/ui/quote.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FullScreenQuoteItemWidget extends StatelessWidget {
  final Quote quote;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          child: Container(
            color: Colors.black.withAlpha(200),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  margin: const EdgeInsets.all(24),
                  alignment: Alignment.center,
                  child: TransitionAnimWidget(
                    startDirection: StartDirection.bottom,
                    duration: 400,
                    child: Text(
                        style: GoogleFonts.nunito(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                        textAlign: TextAlign.center,
                        quote.text),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: TransitionAnimWidget(
                    startDirection: StartDirection.bottom,
                    duration: 1000,
                    child: Text(
                        style: GoogleFonts.nunito(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                        "- ${quote.author} -"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  const FullScreenQuoteItemWidget({
    super.key,
    required this.quote,
  });
}
