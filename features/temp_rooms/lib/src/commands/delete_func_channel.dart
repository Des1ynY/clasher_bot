import 'package:nyxx/nyxx.dart';
import 'package:nyxx_interactions/nyxx_interactions.dart';
import 'package:temp_rooms/src/cache/cache.dart';
import 'package:temp_rooms/src/commands/command.dart';
import 'package:temp_rooms/src/config.dart';

class DeleteFuncChannel implements SlashCommand {
  final Cache cache;
  final TempRoomsConfig config;

  const DeleteFuncChannel({required this.cache, required this.config});

  @override
  SlashCommandBuilder get builder {
    return SlashCommandBuilder(
      'delete-func-channel',
      'Снимает обязанности с выбранного функционального канала',
      [
        CommandOptionBuilder(
          CommandOptionType.channel,
          'channel',
          'Выберите функциональный канал',
          required: true,
        ),
      ],
      canBeUsedInDm: false,
    )..registerHandler(handler);
  }

  @override
  Future<void> handler(ISlashCommandInteractionEvent event) async {
    await event.acknowledge();

    try {
      final channelId = int.parse(event.args.withKey<String>('channel')!);

      await cache.funcChannelsDao.deleteFuncChannel(channelId);

      await event.respond(getSuccessMessage(channelId));
    } on Object {
      await event.respond(getFailureMessage(), hidden: true);
    }
  }

  MessageBuilder getSuccessMessage(int channelId) {
    final content = EmbedBuilder()
      ..color = config.messageColor
      ..addField(
        name: 'Готово!',
        content: '<#$channelId> больше не функциональный!',
      );

    return MessageBuilder.embed(content);
  }

  MessageBuilder getFailureMessage() {
    final content = EmbedBuilder()
      ..color = config.messageColor
      ..addField(
        name: 'Упс!',
        content: 'Что-то пошло не так, возможно, стоит попробовать еще раз...',
      );

    return MessageBuilder.embed(content);
  }
}
