import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:domain/models/state/domain_result.dart';
import 'package:domain/models/ui/quote.dart';
import 'package:domain/models/ui/user.dart';
import 'package:domain/repositories/abstraction/quotes_repository.dart';
import 'package:common/utils/utils.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _repository;
  final ScrollController quotesScrollController = ScrollController();
  int page = 1;
  var endOfPaginationReached = false;

  HomeBloc(this._repository) : super(const HomeState()) {
    on<LoadQuotes>(_loadQuotes);
    on<GetProfile>(_getProfile);

    quotesScrollController.onBottomReached(() {
      if (!endOfPaginationReached) {
        page++;
        add(LoadQuotes());
      }
    });
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

  Future<void> _getProfile(GetProfile event, Emitter emitter) async {
    final user = await _repository.getProfile();
    emitter(state.copyWith(user: user));
  }
}
