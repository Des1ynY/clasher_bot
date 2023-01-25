import 'package:drift/drift.dart';

@DataClassName('Stat')
class StatsTable extends Table {
  IntColumn get guildId => integer()();
  IntColumn get tempRoomsCreated => integer().withDefault(const Constant(0))();
  IntColumn get tempRoomsMinutesUsed => integer().withDefault(const Constant(0))();
  IntColumn get mostActiveCreatorId => integer().nullable()();
  IntColumn get mostActiveCreatorCount => integer().nullable()();

  @override
  Set<Column<Object>>? get primaryKey => {guildId};
}
