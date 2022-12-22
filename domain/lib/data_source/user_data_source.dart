import 'package:domain/models/ui/quote.dart';
import 'package:domain/models/ui/user.dart';

abstract class UserLocalDataSource {
  Future<User?> getUser();

  Future<void> saveUser(User user);
}
