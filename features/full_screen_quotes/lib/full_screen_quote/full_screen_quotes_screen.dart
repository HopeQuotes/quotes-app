import 'package:common/core/widgets/translate_anim_widget.dart';
import 'package:common/resources/colors.dart';
import 'package:common/utils/fonts.dart';
import 'package:di/data_module_injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:full_screen_quotes/full_screen_quote/bloc/full_screen_quote_bloc.dart';
import 'package:full_screen_quotes/full_screen_quote/full_screen_quote_item_widget.dart';
import 'package:screenshot/screenshot.dart';

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
  bool shareMode = false;
  String image = "";
  String hash = "";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (_) => FullScreenQuoteBloc(injector())..add(LoadQuotes()),
      child: BlocConsumer<FullScreenQuoteBloc, FullScreenQuoteState>(
          builder: (context, state) {
            var bloc = context.read<FullScreenQuoteBloc>();
            if (state.quotes != null) {
              return Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: ClipRRect(
                      borderRadius: shareMode
                          ? BorderRadius.circular(12)
                          : BorderRadius.circular(0),
                      child: AnimatedContainer(
                        width: shareMode ? size.width * .9 : size.width,
                        alignment: Alignment.center,
                        height: shareMode ? 300 : size.height,
                        duration: const Duration(milliseconds: 250),
                        child: Screenshot(
                          controller: bloc.screenShotController,
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 1500),
                                  child: BlurHash(
                                    color: Colors.transparent,
                                    key: UniqueKey(),
                                    duration:
                                        const Duration(milliseconds: 2000),
                                    imageFit: BoxFit.cover,
                                    hash: (state.quotes ?? [])[pageIndex]
                                        .imageHash,
                                    image:
                                        (state.quotes ?? [])[pageIndex].image,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: PageView(
                                  onPageChanged: (page) {
                                    setState(() {
                                      // isLiked = false;
                                      pageIndex = page;
                                    });
                                  },
                                  scrollDirection: Axis.vertical,
                                  controller: context
                                      .read<FullScreenQuoteBloc>()
                                      .pageController,
                                  children: (state.quotes ?? []).map(
                                    (e) {
                                      return FullScreenQuoteItemWidget(
                                          quote: e);
                                    },
                                  ).toList(),
                                ),
                              ),
                              if (shareMode)
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Container(
                                    margin: const EdgeInsets.all(12),
                                    child: Text(
                                      "Hope quotes",
                                      style:
                                          getTextStyle(color: Colors.white24),
                                    ),
                                  ),
                                )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (!shareMode)
                          TransitionAnimWidget(
                            startDirection: StartDirection.bottom,
                            duration: 400,
                            child: Container(
                              margin: const EdgeInsets.only(
                                  right: 12, top: 24, bottom: 24),
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: shareMode
                                    ? AppColors.indigo.withAlpha(32)
                                    : Colors.grey.withAlpha(50),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(12.0)),
                              ),
                              child: GestureDetector(
                                child: Icon(
                                  (state.quotes ?? [])[pageIndex].isLiked ??
                                          false
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  size: 36,
                                  color:
                                      (state.quotes ?? [])[pageIndex].isLiked ==
                                              true
                                          ? Colors.redAccent
                                          : Colors.white,
                                ),
                                onTap: () async {
                                  //
                                },
                              ),
                            ),
                          ),
                        if (shareMode)
                          TransitionAnimWidget(
                            startDirection: StartDirection.bottom,
                            duration: 400,
                            child: Container(
                              margin: const EdgeInsets.only(
                                  right: 12, top: 24, bottom: 24),
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: shareMode
                                    ? AppColors.indigo.withAlpha(200)
                                    : Colors.grey.withAlpha(50),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(12.0)),
                              ),
                              child: GestureDetector(
                                child: const Icon(Icons.save_alt,
                                    size: 36, color: Colors.white),
                                onTap: () {
                                  bloc.add(ShareQuote());
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
                              color: shareMode
                                  ? AppColors.indigo.withAlpha(200)
                                  : Colors.grey.withAlpha(50),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(12.0),
                              ),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  shareMode = !shareMode;
                                });
                              },
                              child: Icon(
                                shareMode
                                    ? Icons.fit_screen_rounded
                                    : Icons.upload_rounded,
                                size: 36,
                                color: shareMode ? Colors.white : Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(left: 8)),
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
