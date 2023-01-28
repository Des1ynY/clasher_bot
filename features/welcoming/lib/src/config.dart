import 'package:nyxx/nyxx.dart';

typedef WelcomeMessageBuilder = Future<MessageBuilder> Function(IGuildMemberAddEvent);

class WelcomingConfig {
  final WelcomeMessageBuilder welcomeMessageBuilder;

  WelcomingConfig({WelcomeMessageBuilder? welcomeMessage})
      : welcomeMessageBuilder = welcomeMessage ?? _welcomeMessage;

  static Future<MessageBuilder> _welcomeMessage(IGuildMemberAddEvent event) async {
    final guild = await event.guild.getOrDownload();

    final guildName = guild.name;
    final userId = event.user.id.id;

    final content = EmbedBuilder()
      ..title = '<@$userId>, рады видеть тебя в **$guildName**!'
      ..imageUrl = 'https://i.pinimg.com/originals/1c/91/83/1c9183d00ad83ec833bf2ef0d6cf70e2.gif'
      ..addField(
        name: '',
        content: 'Посети <#1028537635616063618>, познакомишься с принятыми нормами '
            'и сможешь получить доступ ко всему серверу по кнопке;',
      )
      ..addField(
        name: '',
        content: 'Используй <#1028543512649662554> для общения '
            'и разговоров со всеми обитателями и гостями;',
      )
      ..addField(
        name: '',
        content: 'Слушай <@&1002999129686933504> и радуйся жизни!',
      )
      ..addFooter((footer) => footer.text = 'Улыбаемся и машем, ребята! (✿◡‿◡)');

    return MessageBuilder.embed(content);
  }
}
