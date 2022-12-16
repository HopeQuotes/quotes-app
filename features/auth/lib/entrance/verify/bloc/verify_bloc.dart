import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:domain/models/state/domain_result.dart';
import 'package:domain/repositories/abstraction/auth_repository.dart';
import 'package:flutter/cupertino.dart';

import 'verify_event.dart';
import 'verify_state.dart';

class VerifyBloc extends Bloc<VerifyEvent, VerifyState> {
  final AuthRepository _repository;
  final TextEditingController otpController = TextEditingController();

  VerifyBloc(this._repository) : super(const VerifyState()) {
    on<Verify>(_verify);
  }

  Future<void> _verify(Verify event, Emitter emitter) async {
    return emitter.forEach(_repository.verify(event.email, otpController.text),
        onData: (data) {
      if (data is DomainLoading) {
        return state.copyWith(verifyStatus: VerifyStatus.loading);
      }
      if (data is DomainSuccess) {
        return state.copyWith(verifyStatus: VerifyStatus.success);
      }
      if (data is DomainError) {
        return state.copyWith(
            verifyStatus: VerifyStatus.fail, message: data.message);
      }
      return state.copyWith(verifyStatus: VerifyStatus.initial);
    });
  }
}
