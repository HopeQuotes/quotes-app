import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'app_database.g.dart'; // the generated code will be there

@DataClassName('QuotesCache')
class QuotesTable extends Table {
  TextColumn get id => text()();

  TextColumn get state => text()();

  TextColumn get author => text()();

  TextColumn get body => text()();

  TextColumn get photo => text()();

  TextColumn get photoHash => text()();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}

@DataClassName('UserCache')
class UserTable extends Table {
  TextColumn get userID => text()();

  TextColumn get name => text()();

  TextColumn get email => text()();

  TextColumn get authToken => text()();

  @override
  Set<Column<Object>>? get primaryKey => {userID};
}

@DriftDatabase(tables: [QuotesTable, UserTable])
class AppDatabase extends _$MyDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
//
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
