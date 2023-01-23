import 'package:nyxx/nyxx.dart';

class TempRoomsConfig {
  final String emojiSet;
  final bool overrideCachedEmojis;
  final DiscordColor messageColor;

  TempRoomsConfig({
    String? emojiSet,
    bool? overrideCachedEmojis,
    DiscordColor? messageColor,
  })  : emojiSet = emojiSet ?? _emojiSet,
        overrideCachedEmojis = overrideCachedEmojis ?? false,
        messageColor = messageColor ?? _messageColor;

  static const String _emojiSet = '🍷🍺🥃🍸🍹';
  static final DiscordColor _messageColor = DiscordColor.fromHexString('#5b4665');
}
