import 'package:json_annotation/json_annotation.dart';

part 'verify_request.g.dart';

@JsonSerializable()
class VerifyRequest {
  String email;
  String otp;

  VerifyRequest({
    required this.email,
    required this.otp,
  });

  Map<String, dynamic> toJson() => _$VerifyRequestToJson(this);
}
