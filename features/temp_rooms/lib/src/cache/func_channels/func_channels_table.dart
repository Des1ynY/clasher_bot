import 'package:drift/drift.dart';

@DataClassName('FuncChannel')
class FuncChannelsTable extends Table {
  IntColumn get id => integer()();
  IntColumn get guildId => integer()();
  TextColumn get name => text().withLength(max: 64)();
  TextColumn get emojis => text().withLength(max: 32).nullable()();
  IntColumn get usersLimit => integer().nullable()();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}
