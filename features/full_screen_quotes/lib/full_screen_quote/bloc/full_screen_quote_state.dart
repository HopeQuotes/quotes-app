part of 'full_screen_quote_bloc.dart';

enum QuotesPagingStatus {
  initialPaging,
  success,
  loading,
  fail,
}

enum QuoteActionStatus { sharing, shared, initial }

class FullScreenQuoteState extends Equatable {
  final QuotesPagingStatus? quotesPagingStatus;
  final QuoteActionStatus? quoteActionStatus;
  final List<Quote>? quotes;
  final String? message;

  @override
  List<Object?> get props => [quotesPagingStatus, quotes, message,quoteActionStatus];

  const FullScreenQuoteState({
    this.quotesPagingStatus,
    this.quotes,
    this.message,
    this.quoteActionStatus = QuoteActionStatus.initial,
  });

  FullScreenQuoteState copyWith({
    QuotesPagingStatus? quotesPagingStatus,
    QuoteActionStatus? quoteActionStatus,
    List<Quote>? quotes,
    String? message,
  }) {
    return FullScreenQuoteState(
      quotesPagingStatus: quotesPagingStatus ?? this.quotesPagingStatus,
      quoteActionStatus: quoteActionStatus ?? this.quoteActionStatus,
      quotes: quotes ?? this.quotes,
      message: message ?? this.message,
    );
  }
}
