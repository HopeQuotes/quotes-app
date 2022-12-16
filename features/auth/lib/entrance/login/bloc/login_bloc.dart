import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:domain/models/state/domain_result.dart';
import 'package:domain/repositories/abstraction/auth_repository.dart';
import 'package:flutter/cupertino.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository _repository;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginBloc(this._repository) : super(const LoginState()) {
    on<Login>(_login);
  }

  Future<void> _login(Login event, Emitter emitter) async {
    return emitter.forEach(
        _repository.login(emailController.text, passwordController.text),
        onData: (data) {
      if (data is DomainLoading) {
        return state.copyWith(loginStatus: LoginStatus.loading);
      }
      if (data is DomainSuccess) {
        return state.copyWith(loginStatus: LoginStatus.success);
      }
      if (data is DomainError) {
        return state.copyWith(
            loginStatus: LoginStatus.fail, message: data.message);
      }
      return state.copyWith(loginStatus: LoginStatus.initial);
    });
  }
}
