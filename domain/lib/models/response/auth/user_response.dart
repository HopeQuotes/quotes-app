import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  String userID;
  String name;
  String email;
  String created;
  bool isActivated;
  String authToken;
  String authTokenExpiry;

  UserResponse({
    required this.userID,
    required this.name,
    required this.email,
    required this.created,
    required this.isActivated,
    required this.authToken,
    required this.authTokenExpiry,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) => _$UserResponseFromJson(json);
}
