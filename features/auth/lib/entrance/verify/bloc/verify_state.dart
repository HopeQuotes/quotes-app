import 'package:equatable/equatable.dart';

enum VerifyStatus { initial, loading, success, fail }

class VerifyState extends Equatable {
  final VerifyStatus? verifyStatus;
  final String? message;

  @override
  List<Object?> get props => [verifyStatus, message];

  const VerifyState({
    this.verifyStatus,
    this.message,
  });

  VerifyState copyWith({
    VerifyStatus? verifyStatus,
    String? message,
  }) {
    return VerifyState(
      verifyStatus: verifyStatus ?? this.verifyStatus,
      message: message ?? this.message,
    );
  }
}
