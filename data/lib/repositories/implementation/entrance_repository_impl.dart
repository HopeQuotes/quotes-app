import 'package:domain/models/state/domain_result.dart';
import 'package:domain/repositories/abstraction/entrance_repository.dart';

class EntranceRepositoryImpl extends EntranceRepository {
  @override
  Stream<DomainResult> getUserStatus() async* {
    await Future.delayed(const Duration(seconds: 5));
    yield DomainSuccess();
    // var box = await (getBox<UserCache>(HiveKeys.profile));
    // if (box.get(HiveKeys.profile) != null) {
    //   yield DomainSuccess();
    // } else {
    //   yield DomainError();
    // }
  }
}
