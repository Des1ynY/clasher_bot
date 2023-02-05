import 'dart:convert';

import 'package:nyxx/nyxx.dart';

import '../cache/cache.dart';
import '../models/welcome_message_config.dart';
import 'events_handler.dart';

class MessageSender extends EventsHandler<IGuildMemberAddEvent> {
  List<WelcomeMessage> messages = [];

  MessageSender(super.events, {required Cache cache}) {
    cache.messagesDao.dataStream.listen((data) => messages = data);
  }

  @override
  Future<void> onEvent(IGuildMemberAddEvent event) async {
    if (_welcomingIsEnabled(event.guild.id.id)) {
      final guild = await event.guild.getOrDownload();
      final systemChannel = await guild.systemChannel?.getOrDownload();

      if (systemChannel != null) {
        final welcomeMessage = messages.firstWhere((e) => e.guildId == guild.id.id);
        final messageJson = await welcomeMessage.getFormattedMessageJson(guild, event.user);
        final message = _getMessageFromJson(messageJson, event.user);

        await systemChannel.sendMessage(message);
      }
    }
  }

  bool _welcomingIsEnabled(int guildId) => messages.where((e) => e.guildId == guildId).isNotEmpty;

  MessageBuilder _getMessageFromJson(Map<String, dynamic> json, IUser user) {
    final message = MessageBuilder();
    final messageConfig = WelcomeMessageConfig.fromJson(json);

    message.embeds = [
      EmbedBuilder()
        ..title = messageConfig.title
        ..color = messageConfig.color
        ..imageUrl = messageConfig.imageUrl
        ..fields = messageConfig.fields
        ..footer = messageConfig.footer
    ];

    if (messageConfig.addMention) {
      message.appendMention(user);
    }

    return message;
  }
}

extension on WelcomeMessage {
  Future<Map<String, dynamic>> getFormattedMessageJson(IGuild guild, IUser user) async {
    final guildOwner = await guild.owner.getOrDownload();

    final regexp = RegExp('%[a-z]*%', caseSensitive: false);
    final validString = messageJson.replaceAllMapped(regexp, _toUppercase);
    final jsonString = validString
        .replaceAll('%USERID%', user.id.id.toString())
        .replaceAll('%USERNAME%', user.username)
        .replaceAll('%GUILDID%', guild.id.id.toString())
        .replaceAll('%GUILDNAME%', guild.name)
        .replaceAll('%GUILDOWNERID%', guild.owner.id.id.toString())
        .replaceAll('%GUILDOWNERNAME%', guildOwner.username)
        .replaceAll('%RULESCHANNELID%', guild.rulesChannel?.id.id.toString() ?? '000')
        .replaceAll('%SYSTEMCHANNELID%', guild.systemChannel?.id.id.toString() ?? '000');

    return jsonDecode(jsonString) as Map<String, dynamic>;
  }

  String _toUppercase(Match match) => match.input.substring(match.start, match.end).toUpperCase();
}
