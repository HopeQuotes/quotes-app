import '../../models/ui/user.dart';

import '../../models/state/domain_result.dart';

abstract class AuthRepository {
  Stream<DomainResult> login(String email, String password);

  Stream<DomainResult> register(String email, String password, String name);

  Stream<DomainResult> verify(String email, String otp);

  Future<void> saveUser(User user);
}
