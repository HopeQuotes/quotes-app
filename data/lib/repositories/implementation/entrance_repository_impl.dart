import 'package:data/cache/box.dart';
import 'package:data/cache/keys.dart';
import 'package:domain/models/cache/user_cache.dart';
import 'package:domain/models/state/domain_result.dart';
import 'package:domain/repositories/abstraction/entrance_repository.dart';

class EntranceRepositoryImpl extends EntranceRepository {
  @override
  Stream<DomainResult> getUserStatus() async* {
    var box = await (getBox<UserCache>(HiveKeys.profile));
    if (box.get(HiveKeys.profile) != null) {
      yield DomainSuccess();
    } else {
      yield DomainError();
    }
  }
}
