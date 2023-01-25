import 'package:drift/drift.dart';
import 'package:nyxx/nyxx.dart';
import 'package:nyxx_interactions/nyxx_interactions.dart';
import 'package:temp_rooms/src/commands/create_func_channel.dart';
import 'package:temp_rooms/src/commands/delete_func_channel.dart';
import 'package:temp_rooms/src/commands/get_stats.dart';
import 'package:temp_rooms/src/handlers/rooms_cleaner.dart';
import 'package:temp_rooms/src/handlers/rooms_creator.dart';
import 'package:temp_rooms/src/workers/stats_collector.dart';

import 'cache/cache.dart';
import 'config.dart';

class TempRooms {
  final INyxxWebsocket client;
  final IInteractions actions;
  final Cache cache;
  final TempRoomsConfig config;

  TempRooms({
    required this.client,
    required this.actions,
    DatabaseConnection? connection,
    TempRoomsConfig? configOverride,
  })  : cache = Cache(connection),
        config = configOverride ?? TempRoomsConfig() {
    // Event handlers
    final events = client.eventsWs.onVoiceStateUpdate;

    RoomsCreator(events, cache: cache, config: config);
    RoomsCleaner(events, cache: cache, config: config);

    // Commands
    actions
      ..registerSlashCommand(CreateFuncChannel(cache: cache, config: config).builder)
      ..registerSlashCommand(DeleteFuncChannel(cache: cache, config: config).builder)
      ..registerSlashCommand(GetStats(cache: cache, config: config).builder);

    // Workers
    StatsCollector(cache: cache);
  }
}
