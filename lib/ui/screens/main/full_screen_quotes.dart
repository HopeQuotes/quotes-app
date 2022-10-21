import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:progressive_image/progressive_image.dart';

import '../../core/translate_anim_widget.dart';

class FullScreenQuotes extends StatefulWidget {
  @override
  State<FullScreenQuotes> createState() => _FullScreenQuotesState();
}

class _FullScreenQuotesState extends State<FullScreenQuotes> {
  var quotes = [
    "https://i.imgur.com/wB0ps3a.jpeg",
    "https://i.imgur.com/ovgYaot.jpeg",
    "https://i.imgur.com/Z1mxpYj.jpeg"
  ];
  var backgroundImage = "";
  final PageController controller = PageController();

  @override
  void initState() {
    backgroundImage = quotes[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: ProgressiveImage(
            placeholder: const AssetImage('assets/placeholder/placeholder.jpg'),
            thumbnail: const AssetImage('assets/placeholder/placeholder.jpg'),
            image: NetworkImage(backgroundImage),
            height: double.infinity,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: PageView(
            onPageChanged: (page) {
              setState(() {
                backgroundImage = quotes[page];
              });
            },
            scrollDirection: Axis.vertical,
            controller: controller,
            children: quotes.map(
              (e) {
                return ClipRRect(
                  child: Stack(
                    children: [
                      Align(
                        child: Container(
                          color: Colors.black.withAlpha(150),
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
                                      "If you look at what you have in life, you'll always have more. If you look at what you don't have in life, you'll never have enough."),
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
                                      "- Oprah Winfrey -"),
                                ),
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
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TransitionAnimWidget(
                startDirection: StartDirection.bottom,
                duration: 400,
                child: Container(
                  margin: const EdgeInsets.only(right: 12, top: 24, bottom: 24),
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.grey.withAlpha(128),
                    borderRadius: const BorderRadius.all(
                        Radius.circular(12.0) //                 <--- border radius here
                        ),
                  ),
                  child: const Icon(
                    Icons.favorite_border,
                    size: 36,
                    color: Colors.white,
                  ),
                ),
              ),
              TransitionAnimWidget(
                startDirection: StartDirection.bottom,
                duration: 400,
                child: Container(
                  margin: const EdgeInsets.only(right: 24, top: 24, bottom: 24),
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.grey.withAlpha(128),
                    borderRadius: const BorderRadius.all(
                        Radius.circular(12.0) //                 <--- border radius here
                        ),
                  ),
                  child: const Icon(
                    Icons.ios_share_sharp,
                    size: 36,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
