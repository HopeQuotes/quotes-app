import '../../models/base/domain_result.dart';

abstract class AuthRepository {
  Stream<DomainResult> login(String email, String password);

  Stream<DomainResult> register(String name, String email, String password);

  Stream<DomainResult> verify(String email, String otp);
}
