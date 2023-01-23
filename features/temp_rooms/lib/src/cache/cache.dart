import 'package:drift/drift.dart';

import 'func_channels/func_channels_dao.dart';
import 'func_channels/func_channels_table.dart';
import 'temp_rooms/temp_rooms_dao.dart';
import 'temp_rooms/temp_rooms_table.dart';

part 'cache.g.dart';

@DriftDatabase(
  tables: [TempRoomsTable, FuncChannelsTable],
  daos: [TempRoomsDao, FuncChannelsDao],
)
class Cache extends _$Cache {
  Cache(super.connection) : super.connect();

  @override
  int get schemaVersion => 1;
}
