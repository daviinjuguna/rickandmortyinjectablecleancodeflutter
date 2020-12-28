import 'package:injectable/injectable.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:rickandmorty/database/character/character_dao.dart';
import 'package:rickandmorty/database/character/character_table.dart';

part 'app_database.g.dart';

@UseMoor(
  tables:[CharactersTable],
  daos:[CharacterDao]
)

@lazySingleton
class AppDatabase extends _$AppDatabase {
  AppDatabase()
     : super(
          (FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite',
            logStatements: true,
            
          )),
        ){moorRuntimeOptions.dontWarnAboutMultipleDatabases = true;}

  @override
  int get schemaVersion => 1;
}