import 'package:domain/models/cache/user_cache.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

Future<Box<T>> getBox<T>(String name) async {
  if (Hive.isBoxOpen(name)) {
    return Hive.box<T>(name);
  } else {
    return Hive.openBox<T>(name);
  }
}

Future<void> registerAdapters() async {
  Hive.registerAdapter<UserCache>(UserCacheAdapter());
}
