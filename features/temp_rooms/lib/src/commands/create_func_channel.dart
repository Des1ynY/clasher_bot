import 'package:nyxx/nyxx.dart';
import 'package:nyxx_interactions/nyxx_interactions.dart';

import '../cache/cache.dart';
import '../config.dart';
import 'command.dart';

class CreateFuncChannel implements SlashCommand {
  final Cache cache;
  final TempRoomsConfig config;

  const CreateFuncChannel({required this.cache, required this.config});

  @override
  SlashCommandBuilder get builder {
    return SlashCommandBuilder(
      'create-func-channel',
      'Назначает выбранный голосовой канал функциональным',
      [
        CommandOptionBuilder(
          CommandOptionType.channel,
          'channel',
          'Голосовой канал',
          channelTypes: [ChannelType.voice],
          required: true,
        ),
        CommandOptionBuilder(
          CommandOptionType.string,
          'name',
          'Маска имени для временных комнат',
          required: true,
        ),
        CommandOptionBuilder(
          CommandOptionType.string,
          'emoji-set',
          'Определяет емодзи, которые можно использовать в маске',
        ),
        CommandOptionBuilder(
          CommandOptionType.integer,
          'users-limit',
          'Устанавливает лимит пользователей на комнату',
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
      final guild = await event.interaction.guild!.getOrDownload();
      final funcChannel = FuncChannel(
        id: channelId,
        guildId: guild.id.id,
        name: event.args.withKey<String>('name')!,
        emojiSet: event.args.withKey<String>('emoji-set'),
        usersLimit: event.args.withKey<int>('users-limit'),
      );

      await cache.funcChannelsDao.cacheFuncChannel(funcChannel);

      await event.respond(getSuccessMessage(channelId));
    } on Object {
      await event.respond(getFailureMessage(), hidden: true);
    }
  }

  MessageBuilder getSuccessMessage(int channelId) {
    final content = EmbedBuilder()
      ..color = DiscordColor.fromHexString(config.messageHexColor)
      ..addField(name: 'Готово!', content: '<#$channelId> назначен функциональным!');

    return MessageBuilder.embed(content);
  }

  MessageBuilder getFailureMessage() {
    final content = EmbedBuilder()
      ..color = DiscordColor.fromHexString(config.messageHexColor)
      ..addField(
        name: 'Усп!',
        content: 'Что-то пошло не так, возможно, стоит попробовать еще раз...',
      );

    return MessageBuilder.embed(content);
  }
}
