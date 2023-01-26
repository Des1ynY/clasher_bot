class TempRoomsConfig {
  final String emojiSet;
  final bool overrideCachedEmojis;
  final String messageHexColor;

  TempRoomsConfig({
    String? emojiSet,
    bool? overrideCachedEmojis,
    String? messageColor,
  })  : emojiSet = emojiSet ?? _emojiSet,
        overrideCachedEmojis = overrideCachedEmojis ?? false,
        messageHexColor = messageColor ?? _messageHexColor;

  static const String _emojiSet = '🍷🍺🥃🍸🍹';
  static const String _messageHexColor = '#5b4665';
}
