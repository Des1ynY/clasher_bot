import 'package:guild_rules/src/config.dart';
import 'package:nyxx/nyxx.dart';

class GuildRules {
  final INyxxWebsocket client;
  final GuildRulesConfig config;

  GuildRules({
    required this.client,
    GuildRulesConfig? configOverride,
  }) : config = configOverride ?? GuildRulesConfig();
}
