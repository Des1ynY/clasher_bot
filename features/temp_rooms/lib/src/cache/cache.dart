import 'package:drift/drift.dart';
import 'package:drift/native.dart';

import 'func_channels/func_channels_dao.dart';
import 'func_channels/func_channels_table.dart';
import 'stats/stats_dao.dart';
import 'stats/stats_table.dart';
import 'temp_rooms/temp_rooms_dao.dart';
import 'temp_rooms/temp_rooms_table.dart';

part 'cache.g.dart';

@DriftDatabase(
  tables: [TempRoomsTable, FuncChannelsTable, StatsTable],
  daos: [TempRoomsDao, FuncChannelsDao, StatsDao],
)
class Cache extends _$Cache {
  factory Cache(DatabaseConnection? connection) {
    if (connection == null) return Cache._();

    return Cache._connect(connection);
  }

  Cache._() : super(NativeDatabase.memory());
  Cache._connect(super.connection) : super.connect();

  @override
  int get schemaVersion => 1;
}
