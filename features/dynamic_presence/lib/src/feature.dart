import 'dart:async';

import 'package:dynamic_presence/src/settings_override.dart';
import 'package:nyxx/nyxx.dart';

class DynamicPresence {
  final INyxxWebsocket client;
  final SettingsOverride settings;

  DynamicPresence({
    required this.client,
    SettingsOverride? override,
  }) : settings = override ?? SettingsOverride() {
    client.onReady.listen(_handler);
  }

  void _handler(IReadyEvent event) {
    Timer.periodic(settings.updatePeriod, (timer) {
      client.setPresence(settings.presences[timer.tick % settings.presences.length]);
    });
  }
}
