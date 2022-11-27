// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      userID: json['userID'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      created: json['created'] as String,
      isActivated: json['isActivated'] as bool,
      authToken: json['authToken'] as String,
      authTokenExpiry: json['authTokenExpiry'] as String,
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'userID': instance.userID,
      'name': instance.name,
      'email': instance.email,
      'created': instance.created,
      'isActivated': instance.isActivated,
      'authToken': instance.authToken,
      'authTokenExpiry': instance.authTokenExpiry,
    };
