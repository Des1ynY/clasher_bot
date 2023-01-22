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

  /// Launches bot
  Future<void> start() async {
    return client.connect();
  }
}
