import 'package:nyxx/nyxx.dart';
import 'package:nyxx_interactions/nyxx_interactions.dart';
import 'package:temp_rooms/src/cache/cache.dart';
import 'package:temp_rooms/src/commands/command.dart';
import 'package:temp_rooms/src/config.dart';

class GetStats implements SlashCommand {
  final Cache cache;
  final TempRoomsConfig config;

  const GetStats({required this.cache, required this.config});

  @override
  SlashCommandBuilder get builder {
    return SlashCommandBuilder(
      'get-stats',
      'Узнайте вашу статистику использования бота',
      [],
      canBeUsedInDm: false,
    )..registerHandler(handler);
  }

  @override
  Future<void> handler(ISlashCommandInteractionEvent event) async {
    await event.acknowledge();

    try {
      final guildId = event.interaction.guild!.id.id;
      final stat = await cache.statsDao.getGuildStat(guildId);

      if (stat == null) return event.respond(getEmptyStatMessage());

      await event.respond(getSuccessMessage(stat));
    } on Object {
      await event.respond(getFailureMessage());
    }
  }

  MessageBuilder getSuccessMessage(Stat stats) {
    final content = EmbedBuilder()
      ..color = DiscordColor.fromHexString(config.messageHexColor)
      ..title = 'Статистика'
      ..addField(
        name: 'Самый активный',
        content: '<@${stats.mostActiveCreatorId}> был самым активным '
            'и создал комнат: ${stats.mostActiveCreatorCount}',
      )
      ..addField(
        name: 'Всего комнат создано',
        content: 'Члены вашего сервера создали комнат: ${stats.tempRoomsCreated}',
      )
      ..addField(
        name: 'Времен потрачено',
        content: 'Минут во временных комнатах потрачено : ${stats.tempRoomsMinutesUsed}',
      )
      ..addFooter((footer) => footer.text = 'P.S. Данные обновляются каждые 24 часа');

    return MessageBuilder.embed(content);
  }

  MessageBuilder getEmptyStatMessage() {
    final content = EmbedBuilder()
      ..color = DiscordColor.fromHexString(config.messageHexColor)
      ..title = 'Нет данных!'
      ..addField(
        name: '',
        content: 'Пока данных по вашему серверу нет, но вскоре они появятся!',
      )
      ..addFooter((footer) => footer.text = 'P.S. Данные обновляются каждые 24 часа');

    return MessageBuilder.embed(content);
  }

  MessageBuilder getFailureMessage() {
    final content = EmbedBuilder()
      ..color = DiscordColor.fromHexString(config.messageHexColor)
      ..addField(
        name: 'Упс!',
        content: 'Что-то пошло не так, возможно, стоит попробовать еще раз...',
      );

    return MessageBuilder.embed(content);
  }
}
