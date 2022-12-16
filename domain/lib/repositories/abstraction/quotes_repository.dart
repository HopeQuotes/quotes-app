import 'package:domain/models/ui/user.dart';

import '../../models/state/domain_result.dart';

abstract class HomeRepository {
  Stream<DomainResult> getQuotes(int page);

  Stream<DomainResult> getQuoteStates();

  Stream<DomainResult> setQuoteState(String stateId, String quoteId);

  Future<User?> getProfile();
}
