import 'dart:async';

import 'package:dynamic_presence/src/config.dart';
import 'package:nyxx/nyxx.dart';

class DynamicPresence {
  final INyxxWebsocket client;
  final DynamicPresenceConfig settings;

  DynamicPresence({
    required this.client,
    DynamicPresenceConfig? override,
  }) : settings = override ?? DynamicPresenceConfig() {
    client.onReady.listen(_handler);
  }

  void _handler(IReadyEvent event) {
    client.setPresence(settings.presences.first);

    Timer.periodic(settings.updatePeriod, (timer) {
      client.setPresence(settings.presences[timer.tick % settings.presences.length]);
    });
  }
}
