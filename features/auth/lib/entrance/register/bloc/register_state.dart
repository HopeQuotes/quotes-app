import 'package:equatable/equatable.dart';

enum RegisterStatus { initial, loading, success, fail }

class RegisterState extends Equatable {
  final RegisterStatus? registerStatus;
  final String? message;

  @override
  List<Object?> get props => [registerStatus, message];

  const RegisterState({
    this.registerStatus,
    this.message,
  });

  RegisterState copyWith({
    RegisterStatus? registerStatus,
    String? message,
  }) {
    return RegisterState(
      registerStatus: registerStatus ?? this.registerStatus,
      message: message ?? this.message,
    );
  }
}
