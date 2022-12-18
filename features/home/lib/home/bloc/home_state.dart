part of 'home_bloc.dart';

enum QuotesPagingStatus {
  initialPaging,
  success,
  loading,
  fail,
}

enum QuoteUpdateStateStatus {
  loading,
  success,
  fail,
}

class HomeState extends Equatable {
  final QuotesPagingStatus? quotesPagingStatus;
  final List<Quote>? quotes;
  final String? message;
  final QuoteUpdateStateStatus? quoteUpdateStateStatus;
  final List<QuoteState>? quoteStates;
  final User? user;

  @override
  List<Object?> get props =>
      [quotesPagingStatus, quoteUpdateStateStatus, quotes, quoteStates, user];



  const HomeState({
    this.quotesPagingStatus,
    this.quoteUpdateStateStatus,
    this.quotes,
    this.quoteStates,
    this.message,
    this.user,
  });

  HomeState copyWith({
    QuotesPagingStatus? quotesPagingStatus,
    QuoteUpdateStateStatus? quoteUpdateStateStatus,
    List<Quote>? quotes,
    List<QuoteState>? quoteStates,
    String? message,
    User? user,
  }) {
    return HomeState(
      quotesPagingStatus: quotesPagingStatus ?? this.quotesPagingStatus,
      quoteUpdateStateStatus:
          quoteUpdateStateStatus ?? this.quoteUpdateStateStatus,
      quotes: quotes ?? this.quotes,
      quoteStates: quoteStates ?? this.quoteStates,
      message: message ?? this.message,
      user: user ?? this.user,
    );
  }
}
