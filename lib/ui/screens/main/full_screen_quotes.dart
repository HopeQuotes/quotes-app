import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:progressive_image/progressive_image.dart';

import '../../../resources/colors.dart';

class FullScreenQuotes extends StatelessWidget {
  var quotes = ["", "", "", ""];

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();

    return Container(
        color: AppColors.backgroundColor,
        child: PageView(
          scrollDirection: Axis.vertical,
          controller: controller,
          children: quotes.map(
            (e) {
              return ClipRRect(
                child: Stack(
                  children: [
                    Align(
                      child: ProgressiveImage(
                        placeholder: const AssetImage('assets/placeholder/placeholder.jpg'),
                        thumbnail: const NetworkImage('https://i.imgur.com/7XL923M.jpg'),
                        image: const NetworkImage('https://i.imgur.com/xVS07vQ.jpg'),
                        height: double.infinity,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                    Align(
                        child: Container(
                      color: Colors.black.withAlpha(150),
                    )),
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
                              child: Text(
                                  style: GoogleFonts.nunito(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                  textAlign: TextAlign.center,
                                  "If you look at what you have in life, you'll always have more. If you look at what you don't have in life, you'll never have enough."),
                            ),
                          ),

                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Text(
                                  style: GoogleFonts.nunito(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.white),
                                  textAlign: TextAlign.center,
                                  "- Oprah Winfrey -"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ).toList(),
        ));
  }
}
