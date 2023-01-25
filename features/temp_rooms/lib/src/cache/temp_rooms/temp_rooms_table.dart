import 'package:drift/drift.dart';

@DataClassName('TempRoom')
class TempRoomsTable extends Table {
  IntColumn get id => integer()();
  IntColumn get authorId => integer()();
  IntColumn get guildId => integer()();
  DateTimeColumn get createdTime => dateTime()();
  DateTimeColumn get deletedTime => dateTime().nullable()();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}
