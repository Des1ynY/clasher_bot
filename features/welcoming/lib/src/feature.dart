import 'package:nyxx/nyxx.dart';

import 'config.dart';

class Welcoming {
  final INyxxWebsocket client;
  final WelcomingConfig config;

  Welcoming({
    required this.client,
    WelcomingConfig? configOverride,
  }) : config = configOverride ?? WelcomingConfig() {
    client.eventsWs.onGuildMemberAdd.listen(_handler);
    client.eventsWs.onGuildMemberAddScreening.listen(_handler);
  }

  Future<void> _handler(IGuildMemberAddEvent event) async {
    final guild = await event.guild.getOrDownload();
    final systemChannel = await guild.systemChannel?.getOrDownload();

    if (systemChannel != null) {
      final welcomeMessage = await config.welcomeMessageBuilder(event);

      await systemChannel.sendMessage(welcomeMessage);
    }
  }
}
