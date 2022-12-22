import 'package:domain/models/ui/quote.dart';

abstract class QuoteLocalDataSource {
  Stream<List<Quote>> getQuotes();
}
