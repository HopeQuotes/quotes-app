import 'package:data/cache/box.dart';
import 'package:data/cache/keys.dart';
import 'package:dio/dio.dart';
import 'package:dio_logging_interceptor/dio_logging_interceptor.dart';
import 'package:flutter/foundation.dart';

class DioClient {
  final String _baseUrl = "https://quotes.esoteric.uz/";
  Dio? _dio;

  Future<BaseOptions> _getOptions() async {
    var token = await (await getBox(HiveKeys.appData)).get(HiveKeys.token);

    return BaseOptions(
        baseUrl: _baseUrl,
        responseType: ResponseType.plain,
        connectTimeout: 120000,
        headers: {
          "Authorization": "Bearer $token",
        },
        receiveTimeout: 120000,
        validateStatus: (code) {
          if (code! >= 200 && code <= 400) {
            return true;
          } else {
            return false;
          }
        });
  }

  Future<Dio> request() async {
    _dio ??= Dio();
    _dio?.options = await _getOptions();
    if (kDebugMode) {
      if (_dio?.interceptors.isEmpty == true) {
        _dio?.interceptors.add(
          DioLoggingInterceptor(
            level: Level.body,
            compact: false,
          ),
        );
        _dio?.interceptors.add(AuthInterceptor());
      }
    }
    return _dio!;
  }

  CancelToken cancelToken() {
    return CancelToken();
  }
}

class AuthInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      //logged out
    }
    super.onError(err, handler);
  }
}
