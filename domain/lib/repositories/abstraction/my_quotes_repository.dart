import '../../models/state/domain_result.dart';

abstract class MyQuotesRepository {
  Stream<DomainResult> getQuotes(int page);
}
