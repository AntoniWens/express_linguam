// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $AppDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $AppDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<AppDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder implements $AppDatabaseBuilderContract {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $AppDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  UserDao? _userDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 11,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `user` (`userid` TEXT NOT NULL, `username` TEXT NOT NULL, `email` TEXT NOT NULL, `password` TEXT NOT NULL, `commercialStatus` INTEGER NOT NULL, `cellNo` TEXT NOT NULL, `address` TEXT NOT NULL, `city` TEXT NOT NULL, `province` TEXT NOT NULL, `country` TEXT NOT NULL, `gpsLat` REAL NOT NULL, `gpsLng` REAL NOT NULL, `active` INTEGER NOT NULL, `manufacture` TEXT NOT NULL, `apiVersion` TEXT NOT NULL, `appVersion` TEXT NOT NULL, `avatar` TEXT NOT NULL, `expiredDate` INTEGER, `namaLembaga` TEXT, `lembagaInternal` INTEGER, `jenisLogin` TEXT, `dateCreated` INTEGER, `expiredDateCc` INTEGER, `nohpReferral` TEXT NOT NULL, PRIMARY KEY (`userid`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  UserDao get userDao {
    return _userDaoInstance ??= _$UserDao(database, changeListener);
  }
}

class _$UserDao extends UserDao {
  _$UserDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _userDataUserInsertionAdapter = InsertionAdapter(
            database,
            'user',
            (UserDataUser item) => <String, Object?>{
                  'userid': item.userid,
                  'username': item.username,
                  'email': item.email,
                  'password': item.password,
                  'commercialStatus': item.commercialStatus,
                  'cellNo': item.cellNo,
                  'address': item.address,
                  'city': item.city,
                  'province': item.province,
                  'country': item.country,
                  'gpsLat': item.gpsLat,
                  'gpsLng': item.gpsLng,
                  'active': item.active ? 1 : 0,
                  'manufacture': item.manufacture,
                  'apiVersion': item.apiVersion,
                  'appVersion': item.appVersion,
                  'avatar': item.avatar,
                  'expiredDate': _dateTimeConverter.encode(item.expiredDate),
                  'namaLembaga': item.namaLembaga,
                  'lembagaInternal': item.lembagaInternal,
                  'jenisLogin': item.jenisLogin,
                  'dateCreated': _dateTimeConverter.encode(item.dateCreated),
                  'expiredDateCc':
                      _dateTimeConverter.encode(item.expiredDateCc),
                  'nohpReferral': item.nohpReferral
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<UserDataUser> _userDataUserInsertionAdapter;

  @override
  Future<void> truncate() async {
    await _queryAdapter.queryNoReturn('DELETE FROM user');
  }

  @override
  Future<int> insert(UserDataUser item) {
    return _userDataUserInsertionAdapter.insertAndReturnId(
        item, OnConflictStrategy.replace);
  }
}

// ignore_for_file: unused_element
final _dateTimeConverter = DateTimeConverter();
