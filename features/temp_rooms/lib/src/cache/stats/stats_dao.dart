import 'package:drift/drift.dart';
import 'package:temp_rooms/src/cache/temp_rooms/temp_rooms_table.dart';

import '../cache.dart';
import 'stats_table.dart';

part 'stats_dao.g.dart';

@DriftAccessor(tables: [TempRoomsTable, StatsTable])
class StatsDao extends DatabaseAccessor<Cache> with _$StatsDaoMixin {
  StatsDao(super.db);

  Future<Stat?> getGuildStat(int guildId) async {
    final query = select(db.statsTable)..where((tbl) => tbl.guildId.equals(guildId));

    return query.getSingleOrNull();
  }

  Future<void> collectStats() async {
    final tempRooms = await select(db.tempRoomsTable).get();

    /* Sorting rooms data in a map with the following structure:
      {
        guildId: {
          creators: {
            creatorId: count
          },
          roomsCreated: count,
          roomsUseInMinutes: count,
        }
      } */
    final statsByGuild = <int, Map<String, dynamic>>{};
    for (final room in tempRooms) {
      final roomUseDuration = (room.deletedTime ?? DateTime.now()).difference(room.createdTime);

      if (!statsByGuild.containsKey(room.guildId)) {
        statsByGuild[room.guildId] = <String, dynamic>{
          'creators': {
            room.authorId: 1,
          },
          'roomsCreated': 1,
          'roomsUseInMinutes': roomUseDuration,
        };
      } else {
        final creators = statsByGuild[room.guildId]!['creators'] as Map<int, int>;
        var roomsCreated = statsByGuild[room.guildId]!['roomsCreated'] as int;
        var roomsUseInMinutes = statsByGuild[room.guildId]!['roomsUseInMinutes'] as int;

        creators[room.authorId] = (creators[room.authorId] ?? 0) + 1;
        roomsCreated += 1;
        roomsUseInMinutes += roomUseDuration.inMinutes;

        statsByGuild[room.guildId] = <String, dynamic>{
          'creators': creators,
          'roomsCreated': roomsCreated,
          'roomsUseInMinutes': roomsUseInMinutes,
        };
      }
    }

    // Caching stats
    final cachingProcesses = <Future<void>>[];
    for (final statEntry in statsByGuild.entries) {
      final creators = statEntry.value['creators'] as Map<int, int>;
      var mostActiveCreator = creators.entries.first;
      for (final creatorEntry in creators.entries) {
        if (creatorEntry.value > mostActiveCreator.value) {
          mostActiveCreator = creatorEntry;
        }
      }

      final stat = Stat(
        guildId: statEntry.key,
        tempRoomsCreated: statEntry.value['roomsCreated'] as int,
        tempRoomsMinutesUsed: statEntry.value['roomsUseInMinutes'] as int,
        mostActiveCreatorId: mostActiveCreator.key,
        mostActiveCreatorCount: mostActiveCreator.value,
      );

      cachingProcesses.add(into(db.statsTable).insert(stat));
    }

    await Future.wait(cachingProcesses);
  }
}
