import '../../cache/user_cache.dart';
import '../../response/user_response.dart';
import '../../ui/user.dart';

extension UserResponseToCache on UserResponse {
  UserCache toCache() {
    return UserCache(
        userID: userID, name: name, email: email, authToken: authToken);
  }
}

extension UserCacheToUi on UserCache {
  User toUi() {
    return User(userID: userID, name: name, email: email, authToken: authToken);
  }
}

extension UserToCache on User {
  UserCache toCache() {
    return UserCache(
        userID: userID, name: name, email: email, authToken: authToken);
  }
}

extension UserResponseToUi on UserResponse {
  User toUi() {
    return User(userID: userID, name: name, email: email, authToken: authToken);
  }
}
