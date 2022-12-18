

import '../../models/state/domain_result.dart';

abstract class FullScreenQuoteRepository {
  Stream<DomainResult> getQuotes(int page);
}