import 'dart:convert';

import 'package:data/api/dio.dart';
import 'package:data/cache/box.dart';
import 'package:data/cache/keys.dart';
import 'package:domain/models/cache/user_cache.dart';
import 'package:domain/models/request/register_request.dart';
import 'package:domain/models/request/verify_request.dart';
import 'package:domain/models/state/domain_result.dart';
import 'package:domain/models/request/login_request.dart';
import 'package:domain/models/ui/user.dart';
import 'package:domain/repositories/abstraction/auth_repository.dart';
import 'package:domain/models/base/base_response.dart';
import 'package:domain/models/response/user_response.dart';
import 'package:domain/models/mappers/ui/user_mapper.dart';

class AuthRepositoryImpl extends AuthRepository {
  final DioClient _client;

  AuthRepositoryImpl({
    required DioClient client,
  }) : _client = client;

  @override
  Stream<DomainResult> login(String email, String password) async* {
    try {
      yield DomainLoading();
      if (email.trim().isEmpty || password.trim().isEmpty) {
        yield DomainError(message: 'Malumotlarni oxirigacha toldiring.');
      } else {
        var response = await _client.post('v1/login',
            data: LoginRequest(email: email.trim(), password: password.trim())
                .toJson());

        var decoded = BaseResponse<UserResponse>.fromJson(
            jsonDecode(response.data), (p0) => UserResponse.fromJson(p0));
        await saveUser(decoded.data.toUi());

        yield DomainSuccess();
      }
    } catch (e) {
      yield DomainError(message: 'Nomalum xatolik yuz berdi');
    }
  }

  @override
  Future<void> saveUser(User user) async {
    await (await getBox<UserCache>(HiveKeys.profile))
        .put(HiveKeys.profile, user.toCache());
  }

  @override
  Stream<DomainResult> register(
      String email, String password, String name) async* {
    try {
      yield DomainLoading();
      if (email.trim().isEmpty ||
          password.trim().isEmpty ||
          name.trim().isEmpty) {
        yield DomainError(message: 'Malumotlarni oxirigacha toldiring.');
      } else {
        var response = await _client.post('v1/register',
            data: RegisterRequest(
                    email: email.trim(),
                    password: password.trim(),
                    name: name.trim())
                .toJson());
        if (response.isSuccessful) {
          yield DomainSuccess();
        }
      }
    } catch (e) {
      yield DomainError(message: 'Nomalum xatolik yuz berdi');
    }
  }

  @override
  Stream<DomainResult> verify(String email, String otp) async* {
    try {
      yield DomainLoading();
      if (email.trim().isEmpty || otp.trim().isEmpty) {
        yield DomainError(message: 'Malumotlarni oxirigacha toldiring.');
      } else {
        var response = await _client.post('v1/verify',
            data: VerifyRequest(email: email.trim(), otp: otp).toJson());

        var decoded = BaseResponse<UserResponse>.fromJson(
            jsonDecode(response.data), (p0) => UserResponse.fromJson(p0));
        await saveUser(decoded.data.toUi());

        yield DomainSuccess();
      }
    } catch (e) {
      yield DomainError(message: 'Nomalum xatolik yuz berdi');
    }
  }
}
