import '../../models/state/domain_result.dart';

abstract class QuotesRepository {
  Stream<DomainResult> getQuotes(int page);

  Stream<DomainResult> getQuoteStates();

  Stream<DomainResult> setQuoteState(String stateId, String quoteId);
}
