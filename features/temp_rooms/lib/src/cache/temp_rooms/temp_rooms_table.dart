import 'package:drift/drift.dart';

@DataClassName('TempRoom')
class TempRoomsTable extends Table {
  IntColumn get id => integer()();
  IntColumn get authorId => integer()();
  IntColumn get guildId => integer()();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}
