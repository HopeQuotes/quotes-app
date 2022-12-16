import 'package:json_annotation/json_annotation.dart';

class User {
  String userID;
  String name;
  String email;
  String authToken;

  User({
    required this.userID,
    required this.name,
    required this.email,
    required this.authToken,
  });
}
