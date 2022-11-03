import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'quotes_screen_event.dart';
part 'quotes_screen_state.dart';

class QuotesScreenBloc extends Bloc<QuotesScreenEvent, QuotesScreenState> {
  QuotesScreenBloc() : super(QuotesScreenInitial()) {
    on<QuotesScreenEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
