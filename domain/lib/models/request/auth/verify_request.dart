
import 'package:json_annotation/json_annotation.dart';
part 'verify_request.g.dart';
@JsonSerializable()
class VerifyRequest {
  String email;
  String otp;

  VerifyRequest copyWith({
    String? email,
    String? otp,
  }) {
    return VerifyRequest(
      email: email ?? this.email,
      otp: otp ?? this.otp,
    );
  }

  VerifyRequest({
    required this.email,
    required this.otp,
  });

  Map<String, dynamic> toJson() =>
      _$VerifyRequestToJson(this);
}
