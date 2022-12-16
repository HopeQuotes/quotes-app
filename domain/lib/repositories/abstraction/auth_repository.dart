import '../../models/ui/user.dart';

import '../../models/state/domain_result.dart';

abstract class AuthRepository {
  Stream<DomainResult> login(String email, String password);

  Future<void> saveUser(User user);
}
