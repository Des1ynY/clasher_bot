import 'package:dynamic_presence/dynamic_presence.dart';
import 'package:nyxx/nyxx.dart';
import 'package:nyxx_interactions/nyxx_interactions.dart';

/// Bot class with default configuration
class ClasherBot {
  late final INyxxWebsocket client;
  late final IInteractions actions;

  ClasherBot({required String botToken}) {
    client = NyxxFactory.createNyxxWebsocket(botToken, GatewayIntents.allUnprivileged);
    actions = IInteractions.create(WebsocketInteractionBackend(client));
  }

  Future<void> start() async {
    actions.syncOnReady();

    // Enables features
    DynamicPresence(client: client);

    await client.connect();
  }
}
