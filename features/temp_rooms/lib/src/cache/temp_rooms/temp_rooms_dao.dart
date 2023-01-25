import 'package:drift/drift.dart';

import '../cache.dart';
import 'temp_rooms_table.dart';

part 'temp_rooms_dao.g.dart';

@DriftAccessor(tables: [TempRoomsTable])
class TempRoomsDao extends DatabaseAccessor<Cache> with _$TempRoomsDaoMixin {
  TempRoomsDao(super.db);

  Stream<List<TempRoom>> get dataStream {
    return select(db.tempRoomsTable).watch().asBroadcastStream();
  }

  Future<TempRoom> cacheTempRoom(int roomId, int authorId, int guildId) async {
    final room = TempRoomsTableCompanion(
      id: Value(roomId),
      authorId: Value(authorId),
      guildId: Value(guildId),
      createdTime: Value(DateTime.now()),
    );

    return into(db.tempRoomsTable).insertReturning(
      room,
      onConflict: DoUpdate((old) => room),
    );
  }

  Future<void> deleteTempRoom(int roomId) async {
    final query = update(db.tempRoomsTable)..where((tbl) => tbl.id.equals(roomId));

    await query.write(
      TempRoomsTableCompanion(
        deletedTime: Value(DateTime.now()),
      ),
    );
  }
}
