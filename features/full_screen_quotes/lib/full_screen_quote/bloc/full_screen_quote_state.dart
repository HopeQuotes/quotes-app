part of 'full_screen_quote_bloc.dart';

enum QuotesPagingStatus {
  initialPaging,
  success,
  loading,
  fail,
}

class FullScreenQuoteState extends Equatable {
  final QuotesPagingStatus? quotesPagingStatus;
  final List<Quote>? quotes;
  final String? message;

  @override
  List<Object?> get props => [quotesPagingStatus, quotes, message];



  const FullScreenQuoteState({
    this.quotesPagingStatus,
    this.quotes,
    this.message,
  });

  FullScreenQuoteState copyWith({
    QuotesPagingStatus? quotesPagingStatus,
    List<Quote>? quotes,
    String? message,
  }) {
    return FullScreenQuoteState(
      quotesPagingStatus: quotesPagingStatus ?? this.quotesPagingStatus,
      quotes: quotes ?? this.quotes,
      message: message ?? this.message,
    );
  }
}
