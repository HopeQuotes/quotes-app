import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  String userID;
  String name;
  String email;
  String authToken;

  UserResponse({
    required this.userID,
    required this.name,
    required this.email,
    required this.authToken,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
}
