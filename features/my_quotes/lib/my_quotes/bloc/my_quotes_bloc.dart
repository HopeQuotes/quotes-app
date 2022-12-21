import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:common/utils/exp.dart';
import 'package:domain/models/state/domain_result.dart';
import 'package:domain/models/ui/quote.dart';
import 'package:equatable/equatable.dart';
import 'package:domain/repositories/abstraction/my_quotes_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'my_quotes_event.dart';

part 'my_quotes_state.dart';

class MyQuotesBloc extends Bloc<MyQuotesEvent, MyQuotesState> {
  final MyQuotesRepository _repository;
  final ScrollController scrollController = ScrollController();
  int _page = 1;
  bool _endOfPaginationReached = false;

  MyQuotesBloc(this._repository) : super(const MyQuotesState()) {
    on<GetQuotes>(_getQuotes);

    scrollController.onBottomReached(() {
      if (!_endOfPaginationReached) {
        _page++;
        add(GetQuotes());
      }
    });
  }

  Future<void> _getQuotes(GetQuotes event, Emitter emitter) async {
    return emitter.forEach(_repository.getQuotes(_page), onData: (data) {
      if (data is DomainSuccess<List<Quote>>) {
        _endOfPaginationReached = (data.data?.length ?? 0) < 20;
        return state.copyWith(
            myQuotesStatus: MyQuotesStatus.success,
            quotes: (state.quotes ?? []) + (data.data ?? []));
      }
    });
  }
}
