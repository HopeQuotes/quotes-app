import 'package:equatable/equatable.dart';

enum LoginStatus { initial, loading, success, fail }

class LoginState extends Equatable {
  final LoginStatus? loginStatus;
  final String? message;

  @override
  List<Object?> get props => [loginStatus, message];

  const LoginState({
    this.loginStatus,
    this.message,
  });

  LoginState copyWith({
    LoginStatus? loginStatus,
    String? message,
  }) {
    return LoginState(
      loginStatus: loginStatus ?? this.loginStatus,
      message: message ?? this.message,
    );
  }
}
