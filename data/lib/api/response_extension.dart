import 'package:dio/dio.dart';

extension ResponseExt on Response {
  bool get isSuccessful => statusCode == 200;
}
