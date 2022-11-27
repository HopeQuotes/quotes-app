// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyRequest _$VerifyRequestFromJson(Map<String, dynamic> json) =>
    VerifyRequest(
      email: json['email'] as String,
      otp: json['otp'] as String,
    );

Map<String, dynamic> _$VerifyRequestToJson(VerifyRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'otp': instance.otp,
    };
