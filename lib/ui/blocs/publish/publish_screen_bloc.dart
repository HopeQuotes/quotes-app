import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'publish_screen_event.dart';
part 'publish_screen_state.dart';

class PublishScreenBloc extends Bloc<PublishScreenEvent, PublishScreenState> {
  PublishScreenBloc() : super(PublishScreenInitial()) {
    on<PublishScreenEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
