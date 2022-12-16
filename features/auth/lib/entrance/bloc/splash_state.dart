part of 'splash_bloc.dart';

enum SplashStatus { initial, loading, authorized, unAuthorized }

class SplashState extends Equatable {
  final SplashStatus? status;

  SplashState({
    this.status,
  });

  @override
  List<Object?> get props => [status];

  SplashState copyWith({
    SplashStatus? status,
  }) {
    return SplashState(
      status: status ?? this.status,
    );
  }
}
