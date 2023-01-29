import 'package:nyxx/nyxx.dart';

typedef WelcomeMessageBuilder = Future<MessageBuilder> Function(IGuildMemberAddEvent);

class WelcomingConfig {
  final WelcomeMessageBuilder welcomeMessageBuilder;

  WelcomingConfig({
    WelcomeMessageBuilder? welcomeMessage,
  }) : welcomeMessageBuilder = welcomeMessage ?? _welcomeMessage;

  static Future<MessageBuilder> _welcomeMessage(IGuildMemberAddEvent event) async {
    final guild = await event.guild.getOrDownload();

    final guildName = guild.name;
    final userId = event.user.id.id;

    final content = EmbedBuilder()
      ..title = '<@$userId>, рады видеть тебя в **$guildName**!'
      ..color = DiscordColor.fromHexString('#5b4665')
      ..imageUrl = 'https://i.pinimg.com/originals/1c/91/83/1c9183d00ad83ec833bf2ef0d6cf70e2.gif'
      ..addField(
        name: 'Посети <#1028537635616063618>',
        content: 'Узнаешь, что хорошо, а что плохо, '
            'и сможешь получить доступ ко всему серверу по кнопке;',
      )
      ..addField(
        name: 'Чувствуй себя как дома',
        content: 'Сервер создан для общения и игр со всеми его обитателями и гостями;',
      )
      ..addField(
        name: 'Благословляй <@&1002999129686933504>',
        content: 'И радуйся жизни! ✌',
      )
      ..addFooter((footer) => footer.text = 'Улыбаемся и машем! (✿◡‿◡)');

    return MessageBuilder.embed(content);
  }
}
