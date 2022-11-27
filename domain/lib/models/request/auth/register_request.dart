import 'package:json_annotation/json_annotation.dart';

part 'register_request.g.dart';

@JsonSerializable()
class RegisterRequest {
  String email;
  String password;
  String name;

  RegisterRequest({
    required this.email,
    required this.password,
    required this.name,
  });

  RegisterRequest copyWith({
    String? email,
    String? password,
    String? name,
  }) {
    return RegisterRequest(
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toJson() =>
      _$RegisterRequestToJson(this);
}
