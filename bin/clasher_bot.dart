import 'dart:io';

import 'package:clasher_bot/bot.dart';
import 'package:dotenv/dotenv.dart';

void main(List<String> args) {
  final env = DotEnv()..load();
  final isDebug = args.contains('--debug');

  final botToken = env[!isDebug ? 'BOT_TOKEN' : 'BOT_TOKEN_DEBUG'];

  if (botToken == null) {
    stderr.addError(ArgumentError('Bot token must be specified in .env file'));
    exit(1);
  }

  ClasherBot(botToken: botToken).start();
}
