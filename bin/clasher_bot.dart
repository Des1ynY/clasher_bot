import 'dart:io';

import 'package:clasher_bot/bot.dart';
import 'package:dotenv/dotenv.dart';

void main(List<String> args) {
  final env = DotEnv();
  final isDebug = args.contains('--debug');

  final botToken = env[isDebug ? 'BOT_TOKEN' : 'BOT_TOKEN_DEBUG'];

  if (botToken == null) {
    stderr.addError(ArgumentError());
    exit(1);
  }

  ClasherBot(botToken: botToken).start();
}
