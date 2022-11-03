import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'my_quotes_event.dart';
part 'my_quotes_state.dart';

class MyQuotesBloc extends Bloc<MyQuotesEvent, MyQuotesState> {
  MyQuotesBloc() : super(MyQuotesInitial()) {
    on<MyQuotesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
