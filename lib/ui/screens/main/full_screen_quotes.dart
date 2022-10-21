import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/translate_anim_widget.dart';

class FullScreenQuotes extends StatefulWidget {
  const FullScreenQuotes({super.key});

  @override
  State<FullScreenQuotes> createState() => _FullScreenQuotesState();
}

class _FullScreenQuotesState extends State<FullScreenQuotes> {
  var quotes = [
    "https://i.picsum.photos/id/455/200/300.jpg?hmac=IRhIhAnPAK71fkZ41MDW7ZOQWyMDZcBkbWPUUUp9Y3Q",
    "https://i.picsum.photos/id/295/200/300.jpg?hmac=b6Ets6Bu47pFHcU4UK7lI6xYkfy48orifVzWeHAe0zM",
    "https://i.picsum.photos/id/973/200/300.jpg?hmac=gFjS6R63ZUmM9pkLFyPxuEmsxvZ_e8VJxB3mcXpvTUQ"
  ];
  var pageIndex = 0;
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: BlurHash(
            duration: const Duration(milliseconds: 600),
            imageFit: BoxFit.cover,
            hash: 'L5H2EC=PM+yV0g-mq.wG9c010J}I',
            image: quotes[pageIndex],
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: PageView(
            onPageChanged: (page) {
              setState(() {
                pageIndex = page;
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
                  padding: const EdgeInsets.all(6),
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
                  margin: const EdgeInsets.only(right: 12, top: 24, bottom: 24),
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.grey.withAlpha(128),
                    borderRadius: const BorderRadius.all(
                        Radius.circular(12.0) //                 <--- border radius here
                        ),
                  ),
                  child: const Icon(
                    Icons.upload_rounded,
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
