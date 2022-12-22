// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class QuotesCache extends DataClass implements Insertable<QuotesCache> {
  final String id;
  final String state;
  final String author;
  final String body;
  final String photo;
  final String photoHash;
  const QuotesCache(
      {required this.id,
      required this.state,
      required this.author,
      required this.body,
      required this.photo,
      required this.photoHash});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['state'] = Variable<String>(state);
    map['author'] = Variable<String>(author);
    map['body'] = Variable<String>(body);
    map['photo'] = Variable<String>(photo);
    map['photo_hash'] = Variable<String>(photoHash);
    return map;
  }

  QuotesTableCompanion toCompanion(bool nullToAbsent) {
    return QuotesTableCompanion(
      id: Value(id),
      state: Value(state),
      author: Value(author),
      body: Value(body),
      photo: Value(photo),
      photoHash: Value(photoHash),
    );
  }

  factory QuotesCache.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return QuotesCache(
      id: serializer.fromJson<String>(json['id']),
      state: serializer.fromJson<String>(json['state']),
      author: serializer.fromJson<String>(json['author']),
      body: serializer.fromJson<String>(json['body']),
      photo: serializer.fromJson<String>(json['photo']),
      photoHash: serializer.fromJson<String>(json['photoHash']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'state': serializer.toJson<String>(state),
      'author': serializer.toJson<String>(author),
      'body': serializer.toJson<String>(body),
      'photo': serializer.toJson<String>(photo),
      'photoHash': serializer.toJson<String>(photoHash),
    };
  }

  QuotesCache copyWith(
          {String? id,
          String? state,
          String? author,
          String? body,
          String? photo,
          String? photoHash}) =>
      QuotesCache(
        id: id ?? this.id,
        state: state ?? this.state,
        author: author ?? this.author,
        body: body ?? this.body,
        photo: photo ?? this.photo,
        photoHash: photoHash ?? this.photoHash,
      );
  @override
  String toString() {
    return (StringBuffer('QuotesCache(')
          ..write('id: $id, ')
          ..write('state: $state, ')
          ..write('author: $author, ')
          ..write('body: $body, ')
          ..write('photo: $photo, ')
          ..write('photoHash: $photoHash')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, state, author, body, photo, photoHash);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QuotesCache &&
          other.id == this.id &&
          other.state == this.state &&
          other.author == this.author &&
          other.body == this.body &&
          other.photo == this.photo &&
          other.photoHash == this.photoHash);
}

class QuotesTableCompanion extends UpdateCompanion<QuotesCache> {
  final Value<String> id;
  final Value<String> state;
  final Value<String> author;
  final Value<String> body;
  final Value<String> photo;
  final Value<String> photoHash;
  const QuotesTableCompanion({
    this.id = const Value.absent(),
    this.state = const Value.absent(),
    this.author = const Value.absent(),
    this.body = const Value.absent(),
    this.photo = const Value.absent(),
    this.photoHash = const Value.absent(),
  });
  QuotesTableCompanion.insert({
    required String id,
    required String state,
    required String author,
    required String body,
    required String photo,
    required String photoHash,
  })  : id = Value(id),
        state = Value(state),
        author = Value(author),
        body = Value(body),
        photo = Value(photo),
        photoHash = Value(photoHash);
  static Insertable<QuotesCache> custom({
    Expression<String>? id,
    Expression<String>? state,
    Expression<String>? author,
    Expression<String>? body,
    Expression<String>? photo,
    Expression<String>? photoHash,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (state != null) 'state': state,
      if (author != null) 'author': author,
      if (body != null) 'body': body,
      if (photo != null) 'photo': photo,
      if (photoHash != null) 'photo_hash': photoHash,
    });
  }

  QuotesTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? state,
      Value<String>? author,
      Value<String>? body,
      Value<String>? photo,
      Value<String>? photoHash}) {
    return QuotesTableCompanion(
      id: id ?? this.id,
      state: state ?? this.state,
      author: author ?? this.author,
      body: body ?? this.body,
      photo: photo ?? this.photo,
      photoHash: photoHash ?? this.photoHash,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (state.present) {
      map['state'] = Variable<String>(state.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (photo.present) {
      map['photo'] = Variable<String>(photo.value);
    }
    if (photoHash.present) {
      map['photo_hash'] = Variable<String>(photoHash.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuotesTableCompanion(')
          ..write('id: $id, ')
          ..write('state: $state, ')
          ..write('author: $author, ')
          ..write('body: $body, ')
          ..write('photo: $photo, ')
          ..write('photoHash: $photoHash')
          ..write(')'))
        .toString();
  }
}

class $QuotesTableTable extends QuotesTable
    with TableInfo<$QuotesTableTable, QuotesCache> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuotesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _stateMeta = const VerificationMeta('state');
  @override
  late final GeneratedColumn<String> state = GeneratedColumn<String>(
      'state', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _authorMeta = const VerificationMeta('author');
  @override
  late final GeneratedColumn<String> author = GeneratedColumn<String>(
      'author', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _bodyMeta = const VerificationMeta('body');
  @override
  late final GeneratedColumn<String> body = GeneratedColumn<String>(
      'body', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _photoMeta = const VerificationMeta('photo');
  @override
  late final GeneratedColumn<String> photo = GeneratedColumn<String>(
      'photo', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _photoHashMeta =
      const VerificationMeta('photoHash');
  @override
  late final GeneratedColumn<String> photoHash = GeneratedColumn<String>(
      'photo_hash', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, state, author, body, photo, photoHash];
  @override
  String get aliasedName => _alias ?? 'quotes_table';
  @override
  String get actualTableName => 'quotes_table';
  @override
  VerificationContext validateIntegrity(Insertable<QuotesCache> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('state')) {
      context.handle(
          _stateMeta, state.isAcceptableOrUnknown(data['state']!, _stateMeta));
    } else if (isInserting) {
      context.missing(_stateMeta);
    }
    if (data.containsKey('author')) {
      context.handle(_authorMeta,
          author.isAcceptableOrUnknown(data['author']!, _authorMeta));
    } else if (isInserting) {
      context.missing(_authorMeta);
    }
    if (data.containsKey('body')) {
      context.handle(
          _bodyMeta, body.isAcceptableOrUnknown(data['body']!, _bodyMeta));
    } else if (isInserting) {
      context.missing(_bodyMeta);
    }
    if (data.containsKey('photo')) {
      context.handle(
          _photoMeta, photo.isAcceptableOrUnknown(data['photo']!, _photoMeta));
    } else if (isInserting) {
      context.missing(_photoMeta);
    }
    if (data.containsKey('photo_hash')) {
      context.handle(_photoHashMeta,
          photoHash.isAcceptableOrUnknown(data['photo_hash']!, _photoHashMeta));
    } else if (isInserting) {
      context.missing(_photoHashMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  QuotesCache map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return QuotesCache(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      state: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}state'])!,
      author: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}author'])!,
      body: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}body'])!,
      photo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}photo'])!,
      photoHash: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}photo_hash'])!,
    );
  }

  @override
  $QuotesTableTable createAlias(String alias) {
    return $QuotesTableTable(attachedDatabase, alias);
  }
}

class UserCache extends DataClass implements Insertable<UserCache> {
  final String userID;
  final String name;
  final String email;
  final String authToken;
  const UserCache(
      {required this.userID,
      required this.name,
      required this.email,
      required this.authToken});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_i_d'] = Variable<String>(userID);
    map['name'] = Variable<String>(name);
    map['email'] = Variable<String>(email);
    map['auth_token'] = Variable<String>(authToken);
    return map;
  }

  UserTableCompanion toCompanion(bool nullToAbsent) {
    return UserTableCompanion(
      userID: Value(userID),
      name: Value(name),
      email: Value(email),
      authToken: Value(authToken),
    );
  }

  factory UserCache.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserCache(
      userID: serializer.fromJson<String>(json['userID']),
      name: serializer.fromJson<String>(json['name']),
      email: serializer.fromJson<String>(json['email']),
      authToken: serializer.fromJson<String>(json['authToken']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userID': serializer.toJson<String>(userID),
      'name': serializer.toJson<String>(name),
      'email': serializer.toJson<String>(email),
      'authToken': serializer.toJson<String>(authToken),
    };
  }

  UserCache copyWith(
          {String? userID, String? name, String? email, String? authToken}) =>
      UserCache(
        userID: userID ?? this.userID,
        name: name ?? this.name,
        email: email ?? this.email,
        authToken: authToken ?? this.authToken,
      );
  @override
  String toString() {
    return (StringBuffer('UserCache(')
          ..write('userID: $userID, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('authToken: $authToken')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(userID, name, email, authToken);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserCache &&
          other.userID == this.userID &&
          other.name == this.name &&
          other.email == this.email &&
          other.authToken == this.authToken);
}

class UserTableCompanion extends UpdateCompanion<UserCache> {
  final Value<String> userID;
  final Value<String> name;
  final Value<String> email;
  final Value<String> authToken;
  const UserTableCompanion({
    this.userID = const Value.absent(),
    this.name = const Value.absent(),
    this.email = const Value.absent(),
    this.authToken = const Value.absent(),
  });
  UserTableCompanion.insert({
    required String userID,
    required String name,
    required String email,
    required String authToken,
  })  : userID = Value(userID),
        name = Value(name),
        email = Value(email),
        authToken = Value(authToken);
  static Insertable<UserCache> custom({
    Expression<String>? userID,
    Expression<String>? name,
    Expression<String>? email,
    Expression<String>? authToken,
  }) {
    return RawValuesInsertable({
      if (userID != null) 'user_i_d': userID,
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (authToken != null) 'auth_token': authToken,
    });
  }

  UserTableCompanion copyWith(
      {Value<String>? userID,
      Value<String>? name,
      Value<String>? email,
      Value<String>? authToken}) {
    return UserTableCompanion(
      userID: userID ?? this.userID,
      name: name ?? this.name,
      email: email ?? this.email,
      authToken: authToken ?? this.authToken,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userID.present) {
      map['user_i_d'] = Variable<String>(userID.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (authToken.present) {
      map['auth_token'] = Variable<String>(authToken.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserTableCompanion(')
          ..write('userID: $userID, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('authToken: $authToken')
          ..write(')'))
        .toString();
  }
}

class $UserTableTable extends UserTable
    with TableInfo<$UserTableTable, UserCache> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _userIDMeta = const VerificationMeta('userID');
  @override
  late final GeneratedColumn<String> userID = GeneratedColumn<String>(
      'user_i_d', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _authTokenMeta =
      const VerificationMeta('authToken');
  @override
  late final GeneratedColumn<String> authToken = GeneratedColumn<String>(
      'auth_token', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [userID, name, email, authToken];
  @override
  String get aliasedName => _alias ?? 'user_table';
  @override
  String get actualTableName => 'user_table';
  @override
  VerificationContext validateIntegrity(Insertable<UserCache> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_i_d')) {
      context.handle(_userIDMeta,
          userID.isAcceptableOrUnknown(data['user_i_d']!, _userIDMeta));
    } else if (isInserting) {
      context.missing(_userIDMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('auth_token')) {
      context.handle(_authTokenMeta,
          authToken.isAcceptableOrUnknown(data['auth_token']!, _authTokenMeta));
    } else if (isInserting) {
      context.missing(_authTokenMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {userID};
  @override
  UserCache map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserCache(
      userID: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_i_d'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      authToken: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}auth_token'])!,
    );
  }

  @override
  $UserTableTable createAlias(String alias) {
    return $UserTableTable(attachedDatabase, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  late final $QuotesTableTable quotesTable = $QuotesTableTable(this);
  late final $UserTableTable userTable = $UserTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [quotesTable, userTable];
}
