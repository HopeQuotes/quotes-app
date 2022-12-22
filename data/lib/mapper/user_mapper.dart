import 'package:domain/models/ui/user.dart';

import '../cache/database/core/app_database.dart';

extension UserCacheToUi on UserCache {
  User toUi() {
    return User(userID: userID, name: name, email: email, authToken: authToken);
  }
}
