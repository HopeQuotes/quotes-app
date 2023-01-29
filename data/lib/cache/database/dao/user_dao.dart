import 'package:domain/models/ui/user.dart';
import 'package:drift/drift.dart';
import '../core/app_database.dart';

part 'user_dao.g.dart';

@DriftAccessor(tables: [UserTable])
class UserDao extends DatabaseAccessor<AppDatabase> with _$UserDaoMixin {
  UserDao(AppDatabase db) : super(db);

  Future<UserCache?> getUser() {
    return select(userTable).getSingleOrNull();
  }

  Future<void> insertUser(User user) async {
    await userTable.insertOne(UserTableCompanion.insert(
        userID: user.userID,
        name: user.name,
        email: user.email,
        authToken: user.authToken));
  }
}
