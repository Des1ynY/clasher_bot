import 'package:nyxx/nyxx.dart';
import 'package:nyxx_interactions/nyxx_interactions.dart';
import 'package:temp_rooms/src/config.dart';

class TempRooms {
  final INyxxWebsocket client;
  final IInteractions actions;
  final TempRoomsConfig settings;

  TempRooms({
    required this.client,
    required this.actions,
    TempRoomsConfig? config,
  }) : settings = config ?? TempRoomsConfig() {
    client.eventsWs.onVoiceStateUpdate.listen((event) {});
  }
}
