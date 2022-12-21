part of 'my_quotes_bloc.dart';

enum MyQuotesStatus { initial, loading, success, fail }

class MyQuotesState extends Equatable {
  final MyQuotesStatus? myQuotesStatus;
  final List<Quote>? quotes;
  final String? message;

  const MyQuotesState({
    this.myQuotesStatus,
    this.message,
    this.quotes,
  });

  @override
  List<Object?> get props => [myQuotesStatus, message, quotes];

  MyQuotesState copyWith({
    MyQuotesStatus? myQuotesStatus,
    List<Quote>? quotes,
    String? message,
  }) {
    return MyQuotesState(
      myQuotesStatus: myQuotesStatus ?? this.myQuotesStatus,
      quotes: quotes ?? this.quotes,
      message: message ?? this.message,
    );
  }
}
