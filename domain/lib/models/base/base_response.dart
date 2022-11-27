import 'package:json_annotation/json_annotation.dart';

class BaseResponse<T> {
  String message;
  T data;

  BaseResponse({required this.message, required this.data});

  factory BaseResponse.fromJson(
      Map<String, dynamic> json, Function(Map<String, dynamic>) create) {
    return BaseResponse<T>(
      message: json["message"],
      data: create(json["data"]),
    );
  }
}
