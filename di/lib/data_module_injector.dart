import 'package:domain/repositories/abstraction/auth_repository.dart';
import 'package:get_it/get_it.dart';

final GetIt injector = GetIt.instance;

void initDomainModuleDependencies() {
  injector.registerSingleton<AuthRepository>(AuthRepositoryImpl());
}
