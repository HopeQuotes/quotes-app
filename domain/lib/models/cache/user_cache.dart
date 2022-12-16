import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_cache.g.dart';

@HiveType(typeId: 1)
class UserCache {
  @HiveField(0)
  String userID;
  @HiveField(1)
  String name;
  @HiveField(2)
  String email;
  @HiveField(3)
  String authToken;

  UserCache({
    required this.userID,
    required this.name,
    required this.email,
    required this.authToken,
  });
}
