import 'package:nyxx/nyxx.dart';

class WelcomeMessageConfig {
  // Message content
  final String? _title;
  final List<_WelcomeMessageField> _fields;
  final String? _footerText;

  // Message config
  final String? _discordHexColor;
  final String? _imageUrl;
  final bool? _addMention;

  const WelcomeMessageConfig._({
    String? title,
    List<_WelcomeMessageField>? fields,
    String? footerText,
    String? discordHextColor,
    String? imageUrl,
    bool? addMention,
  })  : _title = title,
        _fields = fields ?? const <_WelcomeMessageField>[],
        _footerText = footerText,
        _discordHexColor = discordHextColor,
        _imageUrl = imageUrl,
        _addMention = addMention;

  factory WelcomeMessageConfig.fromJson(Map<String, dynamic> json) {
    final content = json['content'] as Map<String, dynamic>;
    final config = json['config'] as Map<String, dynamic>;

    return WelcomeMessageConfig._(
      title: content['title'] as String?,
      fields: (content['fields'] as List<Map<String, dynamic>>?)
          ?.map(_WelcomeMessageField.fromJson)
          .toList(),
      footerText: content['footer'] as String?,
      discordHextColor: config['color'] as String?,
      imageUrl: config['image_url'] as String?,
      addMention: config['mention'] as bool?,
    );
  }

  String? get title => _title;

  DiscordColor? get color {
    if (_discordHexColor == null) return null;

    return DiscordColor.fromHexString(_discordHexColor!);
  }

  String? get imageUrl => _imageUrl;

  List<EmbedFieldBuilder> get fields => _fields.map((e) => e.toEmbedField()).toList();

  EmbedFooterBuilder get footer => EmbedFooterBuilder()..text = _footerText;

  bool get addMention => _addMention ?? true;
}

class _WelcomeMessageField {
  final String _name;
  final String _content;
  final bool _inline;

  const _WelcomeMessageField({
    String? name,
    String? content,
    bool? inline,
  })  : _name = name ?? '',
        _content = content ?? '',
        _inline = inline ?? false;

  factory _WelcomeMessageField.fromJson(Map<String, dynamic> json) {
    return _WelcomeMessageField(
        name: json['name'] as String?,
        content: json['content'] as String?,
        inline: json['inline'] as bool?);
  }

  EmbedFieldBuilder toEmbedField() => EmbedFieldBuilder(_name, _content, _inline);
}
