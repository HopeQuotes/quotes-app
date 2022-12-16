import '../../models/state/domain_result.dart';

abstract class EntranceRepository {
  Stream<DomainResult> getUserStatus();
}
