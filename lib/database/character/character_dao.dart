import 'package:injectable/injectable.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:rickandmorty/database/app_database.dart';
import 'package:rickandmorty/database/character/character_table.dart';

part 'character_dao.g.dart';

@UseDao(tables: [CharactersTable])
@lazySingleton
class CharacterDao extends DatabaseAccessor<AppDatabase>
    with _$CharacterDaoMixin {
  CharacterDao(AppDatabase db) : super(db);

  Future<List<CharacterTable>> getCharacters() => select(charactersTable).get();
  Future<List<CharacterTable>> getCharacter(int id) =>
      (select(charactersTable)..where((tbl) => tbl.id.equals(id))).get();

  Future insertCharacter(CharacterTable character) => into(charactersTable).insert(character);
  Future deleteAll() => delete(charactersTable).go();
}
