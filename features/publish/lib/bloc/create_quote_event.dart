part of 'create_quote_bloc.dart';

@immutable
abstract class CreateQuoteEvent {}

class CreateQuote extends CreateQuoteEvent {}

class CreateQuotes extends CreateQuoteEvent {}

class AnalyzeFile extends CreateQuoteEvent {
  final String path;
  final String splitBy;

  AnalyzeFile({
    required this.path,
    required this.splitBy,
  });
}

class AddHashTag extends CreateQuoteEvent {
  final IdValue hashtag;

  AddHashTag({
    required this.hashtag,
  });
}

class LoadHashTags extends CreateQuoteEvent {}

class LoadImages extends CreateQuoteEvent {}

class LoadStates extends CreateQuoteEvent {}

class SetSelectedImageId extends CreateQuoteEvent {
  final String id;

  SetSelectedImageId({
    required this.id,
  });
}

class SetSelectedState extends CreateQuoteEvent {
  final QuoteState state;

  SetSelectedState({
    required this.state,
  });
}

class RemoveHashTag extends CreateQuoteEvent {
  final IdValue hashtag;

  RemoveHashTag({
    required this.hashtag,
  });
}

class RemoveText extends CreateQuoteEvent {
  final Content text;

  RemoveText({
    required this.text,
  });
}
