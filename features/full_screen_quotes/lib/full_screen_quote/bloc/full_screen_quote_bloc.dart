import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:common/utils/path.dart';
import 'package:common/utils/share.dart';
import 'package:domain/models/state/domain_result.dart';
import 'package:domain/models/ui/quote.dart';
import 'package:domain/repositories/abstraction/full_screen_quote_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:screenshot/screenshot.dart';

part 'full_screen_quote_event.dart';

part 'full_screen_quote_state.dart';

class FullScreenQuoteBloc
    extends Bloc<FullScreenQuoteEvent, FullScreenQuoteState> {
  final FullScreenQuoteRepository _repository;
  bool endOfPaginationReached = false;
  int page = 1;
  final PageController pageController = PageController();
  final ScreenshotController screenShotController = ScreenshotController();

  FullScreenQuoteBloc(this._repository) : super(const FullScreenQuoteState()) {
    on<LoadQuotes>(_loadQuotes);
    on<ShareQuote>(_shareQuote);

    pageController.addListener(() async {
      if (pageController.position.atEdge) {
        bool isTop = pageController.position.pixels == 0;
        if (isTop) {
          //
        } else {
          if (!endOfPaginationReached) {
            page++;
            add(LoadQuotes());
          }
        }
      }
    });
  }

  Future<void> _shareQuote(ShareQuote event,Emitter emitter) async {
    var saved = await screenShotController.captureAndSave(await Paths
        .getApplicationDocPath());
    QuoteShare.share(saved);
  }

  Future<void> _loadQuotes(LoadQuotes event, Emitter emitter) async {
    return emitter.forEach<DomainResult>(_repository.getQuotes(page),
        onData: (data) {
      if (data is DomainSuccess<List<Quote>>) {
        endOfPaginationReached = (data.data ?? []).length < 20;
        return state.copyWith(
            quotesPagingStatus: QuotesPagingStatus.success,
            quotes: (state.quotes ?? []) + (data.data ?? []));
      }
      if (data is DomainError) {
        return state.copyWith(quotesPagingStatus: QuotesPagingStatus.fail);
      }
      return state;
    });
  }
}
