part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class LoadQuotes extends HomeEvent {}

class GetQuoteStates extends HomeEvent {}
class GetProfile extends HomeEvent {}

class SetQuoteState extends HomeEvent {
  final String stateId;
  final String quoteId;

  SetQuoteState({
    required this.stateId,
    required this.quoteId,
  });
}
