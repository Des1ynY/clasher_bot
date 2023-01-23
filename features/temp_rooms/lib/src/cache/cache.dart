import 'package:drift/drift.dart';
import 'package:temp_rooms/src/cache/temp_rooms/temp_rooms_dao.dart';
import 'package:temp_rooms/src/cache/temp_rooms/temp_rooms_table.dart';

part 'cache.g.dart';

@DriftDatabase(
  tables: [TempRoomsTable],
  daos: [TempRoomsDao],
)
class Cache extends _$Cache {
  Cache(super.connection) : super.connect();

  @override
  int get schemaVersion => 1;
}
