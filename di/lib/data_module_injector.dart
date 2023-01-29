import 'package:data/cache/database/core/app_database.dart';
import 'package:data/cache/database/dao/quotes_dao.dart';
import 'package:data/cache/database/dao/user_dao.dart';
import 'package:data/repositories/implementation/auth_repository_impl.dart';
import 'package:data/repositories/implementation/entrance_repository_impl.dart';
import 'package:data/repositories/implementation/full_screen_quote_repository_impl.dart';
import 'package:data/repositories/implementation/hashtag_repository_impl.dart';
import 'package:data/repositories/implementation/home_repository.dart';
import 'package:data/repositories/implementation/publish_repository_impl.dart';
import 'package:data/repositories/implementation/my_quotes_repository_impl.dart';
import 'package:domain/repositories/abstraction/auth_repository.dart';
import 'package:data/api/dio.dart';
import 'package:domain/repositories/abstraction/entrance_repository.dart';
import 'package:domain/repositories/abstraction/full_screen_quote_repository.dart';
import 'package:domain/repositories/abstraction/hashtag_repository.dart';
import 'package:domain/repositories/abstraction/home_repository.dart';
import 'package:domain/repositories/abstraction/publish_repository.dart';
import 'package:domain/repositories/abstraction/my_quotes_repository.dart';
import 'package:domain/data_source/user_data_source.dart';
import 'package:domain/data_source/quote_data_source.dart';
import 'package:data/data_source/user_local_data_source_impl.dart';
import 'package:data/data_source/quote_local_data_source_impl.dart';
import 'package:get_it/get_it.dart';

final GetIt injector = GetIt.instance;

void initDomainModuleDependencies() {
  injector.registerSingleton<DioClient>(DioClient());
  initDaos();
  initDataSources();

  injector.registerSingleton<EntranceRepository>(
      EntranceRepositoryImpl(userLocalDataSource: injector()));
  injector.registerSingleton<AuthRepository>(
      AuthRepositoryImpl(client: injector(), userLocalDataSource: injector()));
  injector.registerSingleton<HashtagRepository>(
      HashtagRepositoryImpl(client: injector()));
  injector.registerSingleton<HomeRepository>(
      HomeRepositoryImpl(client: injector()));
  injector.registerSingleton<FullScreenQuoteRepository>(
      FullScreenQuoteRepositoryImpl(client: injector()));
  injector.registerSingleton<PublishRepository>(
      PublishRepositoryImpl(client: injector()));
  injector.registerSingleton<MyQuotesRepository>(
      MyQuotesRepositoryImpl(client: injector()));
}

void initDaos() {
  injector.registerSingleton(AppDatabase());
  injector.registerSingleton(QuotesDao(injector()));
  injector.registerSingleton(UserDao(injector()));
}

void initDataSources() {
  injector.registerSingleton<QuoteLocalDataSource>(
      QuoteLocalDataSourceImpl(database: injector()));
  injector.registerSingleton<UserLocalDataSource>(
      UserLocalDataSourceImpl(userDao: injector()));
}
