import 'dart:async';

import 'package:dynamic_presence/src/config.dart';
import 'package:nyxx/nyxx.dart';

class DynamicPresence {
  final INyxxWebsocket client;
  final DynamicPresenceConfig config;

  DynamicPresence({
    required this.client,
    DynamicPresenceConfig? configOverride,
  }) : config = configOverride ?? DynamicPresenceConfig() {
    client.onReady.listen(_handler);
  }

  void _handler(IReadyEvent event) {
    // client.setPresence(config.presences.first);

    Timer.periodic(config.updatePeriod, (timer) {
      client.setPresence(config.presences[timer.tick % config.presences.length]);
    });
  }
}
