import 'package:domain/data_source/user_data_source.dart';
import 'package:domain/models/state/domain_result.dart';
import 'package:domain/repositories/abstraction/entrance_repository.dart';

class EntranceRepositoryImpl extends EntranceRepository {
  final UserLocalDataSource _userLocalDataSource;

  @override
  Stream<DomainResult> getUserStatus() async* {
    await Future.delayed(const Duration(seconds: 5));
    var user = await _userLocalDataSource.getUser();
    if (user != null) {
      yield DomainSuccess();
    } else {
      yield DomainError();
    }
  }

  EntranceRepositoryImpl({
    required UserLocalDataSource userLocalDataSource,
  }) : _userLocalDataSource = userLocalDataSource;
}
