import 'package:drift/drift.dart';

import '../cache.dart';
import 'temp_rooms_table.dart';

part 'temp_rooms_dao.g.dart';

@DriftAccessor(tables: [TempRoomsTable])
class TempRoomsDao extends DatabaseAccessor<Cache> with _$TempRoomsDaoMixin {
  TempRoomsDao(super.db);
}
