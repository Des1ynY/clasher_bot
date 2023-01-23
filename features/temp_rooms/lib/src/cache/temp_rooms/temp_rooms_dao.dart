import 'package:drift/drift.dart';
import 'package:temp_rooms/src/cache/temp_rooms/temp_rooms_table.dart';

import '../cache.dart';

part 'temp_rooms_dao.g.dart';

@DriftAccessor(tables: [TempRoomsTable])
class TempRoomsDao extends DatabaseAccessor<Cache> with _$TempRoomsDaoMixin {
  TempRoomsDao(super.db);
}
