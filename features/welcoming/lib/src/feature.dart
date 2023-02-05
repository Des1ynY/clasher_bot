import 'dart:async';

import 'package:drift/drift.dart';
import 'package:nyxx/nyxx.dart';

import 'cache/cache.dart';
import 'config.dart';
import 'handlers/guilds_cacher.dart';
import 'handlers/message_sender.dart';

class Welcoming {
  final INyxxWebsocket client;
  final WelcomingConfig config;
  late final Cache cache;

  Welcoming({
    required this.client,
    required DatabaseConnection? connection,
    WelcomingConfig? configOverride,
  }) : config = configOverride ?? WelcomingConfig() {
    runZoned(
      () {
        cache = Cache(connection);

        final newGuildEvents = client.eventsWs.onGuildCreate;
        final newMemberEvents = client.eventsWs.onGuildMemberAdd;

        GuildsCacher(newGuildEvents, cache: cache);
        MessageSender(newMemberEvents, cache: cache);
      },
      zoneValues: {'config': config},
    );
  }
}
