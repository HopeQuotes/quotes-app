import 'package:data/api/dio.dart';
import 'package:data/api/response_extension.dart';
import 'package:domain/models/base/domain_result.dart';
import 'package:domain/models/request/auth/login_request.dart';
import 'package:domain/models/request/auth/register_request.dart';
import 'package:domain/models/request/auth/verify_request.dart';
import 'package:domain/repositories/abstraction/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final DioClient _client = DioClient();

  @override
  Stream<DomainResult> login(String email, String password) async* {
    try {
      yield DomainResultLoading();
      var response = await (await _client.request()).post('v1/login',
          data: LoginRequest(email: email, password: password).toJson());
      if (response.isSuccessful) {
        yield DomainResultSuccess();
      } else {
        yield DomainResultFail();
      }
    } catch (e) {
      yield DomainResultFail();
    }
  }

  @override
  Stream<DomainResult> register(
      String name, String email, String password) async* {
    try {
      yield DomainResultLoading();
      var response = await (await _client.request()).post('v1/register',
          data: RegisterRequest(email: email, password: password, name: name)
              .toJson());
      if (response.isSuccessful) {
        yield DomainResultSuccess();
      } else {
        yield DomainResultFail();
      }
    } catch (e) {
      yield DomainResultFail();
    }
  }

  @override
  Stream<DomainResult> verify(String email, String otp) async* {
    try {
      yield DomainResultLoading();
      var response = await (await _client.request()).post('v1/register',
          data: VerifyRequest(email: email, otp: otp).toJson());
      if (response.isSuccessful) {
        yield DomainResultSuccess();
      } else {
        yield DomainResultFail();
      }
    } catch (e) {
      yield DomainResultFail();
    }
  }
}
