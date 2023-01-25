import 'package:drift/drift.dart';
import 'package:dynamic_presence/dynamic_presence.dart';
import 'package:nyxx/nyxx.dart';
import 'package:nyxx_interactions/nyxx_interactions.dart';
import 'package:temp_rooms/temp_rooms.dart';

/// Bot class with default configuration
class ClasherBot {
  late final INyxxWebsocket client;
  late final IInteractions actions;
  final DatabaseConnection? dbConnection;

  ClasherBot({required String botToken, this.dbConnection}) {
    client = NyxxFactory.createNyxxWebsocket(botToken, GatewayIntents.allUnprivileged);
    actions = IInteractions.create(WebsocketInteractionBackend(client));
  }

  Future<void> start() async {
    actions.syncOnReady();

    // Enables features
    DynamicPresence(client: client);
    TempRooms(client: client, actions: actions);

    await client.connect();
  }
}
