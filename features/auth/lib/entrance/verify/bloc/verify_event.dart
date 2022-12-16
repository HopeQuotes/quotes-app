abstract class VerifyEvent {}

class Verify extends VerifyEvent {
  String email;

  Verify({
    required this.email,
  });
}
