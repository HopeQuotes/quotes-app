import 'dart:async';

import 'package:auth/entrance/register/bloc/register_event.dart';
import 'package:auth/entrance/register/bloc/register_state.dart';
import 'package:bloc/bloc.dart';
import 'package:domain/models/state/domain_result.dart';
import 'package:domain/repositories/abstraction/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRepository _repository;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RegisterBloc(this._repository) : super(const RegisterState()) {
    on<Register>(_register);
  }

  Future<void> _register(Register event, Emitter emitter) async {
    return emitter.forEach(
        _repository.login(emailController.text, passwordController.text),
        onData: (data) {
      if (data is DomainLoading) {
        return state.copyWith(registerStatus: RegisterStatus.loading);
      }
      if (data is DomainSuccess) {
        return state.copyWith(registerStatus: RegisterStatus.success);
      }
      if (data is DomainError) {
        return state.copyWith(
            registerStatus: RegisterStatus.fail, message: data.message);
      }
      return state.copyWith(registerStatus: RegisterStatus.initial);
    });
  }
}
