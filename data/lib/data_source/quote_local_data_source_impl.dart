import 'package:data/cache/database/core/app_database.dart';
import 'package:data/cache/database/dao/quotes_dao.dart';
import 'package:data/mapper/quote_mapper.dart';
import 'package:domain/data_source/quote_data_source.dart';
import 'package:domain/models/ui/quote.dart';

class QuoteLocalDataSourceImpl extends QuoteLocalDataSource {
  final QuotesDao _dao;

  @override
  Stream<List<Quote>> getQuotes() {
    return _dao
        .getQuotes()
        .map((event) => event.map((e) => e.toUi()).toList());
  }

  QuoteLocalDataSourceImpl({
    required QuotesDao database,
  }) : _dao = database;
}
