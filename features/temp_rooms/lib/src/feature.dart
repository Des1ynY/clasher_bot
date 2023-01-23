import 'package:nyxx/nyxx.dart';
import 'package:nyxx_interactions/nyxx_interactions.dart';
import 'package:temp_rooms/src/settings_override.dart';

class TempRooms {
  final INyxxWebsocket client;
  final IInteractions actions;
  final SettingsOverride settings;

  TempRooms({
    required this.client,
    required this.actions,
    SettingsOverride? override,
  }) : settings = override ?? SettingsOverride() {
    client.eventsWs.onVoiceStateUpdate.listen((event) {});
  }
}
