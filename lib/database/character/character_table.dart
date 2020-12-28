import 'package:moor_flutter/moor_flutter.dart';

@DataClassName("CharacterTable")
class CharactersTable extends Table {
  IntColumn get id => integer()();
  TextColumn get name =>text()();
  TextColumn get status => text()();
  TextColumn get species => text()();
  TextColumn get gender => text()();
  TextColumn get image => text().withDefault(Constant(""))();
  TextColumn get origin => text()();
  TextColumn get location => text()();
  
  @override
  Set<Column> get primaryKey => {id};
}