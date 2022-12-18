import 'package:common/core/widgets/translate_anim_widget.dart';
import 'package:di/data_module_injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:full_screen_quotes/full_screen_quote/bloc/full_screen_quote_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class FullScreenQuotesScreen extends StatefulWidget {
  const FullScreenQuotesScreen({super.key});

  @override
  State<FullScreenQuotesScreen> createState() => _FullScreenQuotesState();
}

class ExampleQuoteObject {
  String url;
  bool isLiked;

  ExampleQuoteObject({
    required this.url,
    required this.isLiked,
  });
}

class _FullScreenQuotesState extends State<FullScreenQuotesScreen> {
  var pageIndex = 0;
  var isLiked = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FullScreenQuoteBloc(injector())..add(LoadQuotes()),
      child: BlocConsumer<FullScreenQuoteBloc, FullScreenQuoteState>(
          builder: (context, state) {
            if (state.quotes != null) {
              return Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: BlurHash(
                      duration: const Duration(milliseconds: 2000),
                      imageFit: BoxFit.cover,
                      hash: (state.quotes ?? [])[pageIndex].image.blurHash,
                      image: (state.quotes ?? [])[pageIndex].image.url,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: PageView(
                      onPageChanged: (page) {
                        setState(() {
                          isLiked = false;
                          pageIndex = page;
                        });
                      },
                      scrollDirection: Axis.vertical,
                      controller:
                          context.read<FullScreenQuoteBloc>().pageController,
                      children: (state.quotes ?? []).map(
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
                                            startDirection:
                                                StartDirection.bottom,
                                            duration: 400,
                                            child: Text(
                                                style: GoogleFonts.nunito(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16),
                                                textAlign: TextAlign.center,
                                                (state.quotes ?? [])[pageIndex]
                                                    .text),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Padding(
                                          padding: const EdgeInsets.all(12),
                                          child: TransitionAnimWidget(
                                            startDirection:
                                                StartDirection.bottom,
                                            duration: 1000,
                                            child: Text(
                                                style: GoogleFonts.nunito(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                    fontStyle: FontStyle.italic,
                                                    color: Colors.white),
                                                textAlign: TextAlign.center,
                                                "- ${(state.quotes ?? [])[pageIndex].author} -"),
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
                            margin: const EdgeInsets.only(
                                right: 12, top: 24, bottom: 24),
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.grey.withAlpha(50),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12.0)),
                            ),
                            child: GestureDetector(
                              child: Icon(
                                isLiked
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                size: 36,
                                color:
                                    isLiked ? Colors.redAccent : Colors.white,
                              ),
                              onTap: () {
                                setState(() {
                                  isLiked = !isLiked;
                                });
                              },
                            ),
                          ),
                        ),
                        TransitionAnimWidget(
                          startDirection: StartDirection.bottom,
                          duration: 400,
                          child: Container(
                            margin: const EdgeInsets.only(
                                right: 12, top: 24, bottom: 24),
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.grey.withAlpha(50),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(12.0),
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
            } else {
              return Container();
            }
          },
          listener: (context, state) {}),
    );
  }
}
