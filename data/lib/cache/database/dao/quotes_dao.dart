import 'package:drift/drift.dart';
import '../core/app_database.dart';

part 'quotes_dao.g.dart';

@DriftAccessor(tables: [QuotesTable])
class QuotesDao extends DatabaseAccessor<MyDatabase> with _$QuotesDaoMixin {
  QuotesDao(MyDatabase db) : super(db);

  Stream<List<QuotesCache>> getQuotes() {
    return select(quotesTable).watch();
  }
}
