import 'dart:io';

import 'package:clasher_bot/bot.dart';
import 'package:dotenv/dotenv.dart';
import 'package:drift/drift.dart';
import 'package:drift/isolate.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as path;

Future<void> main(List<String> args) async {
  // Bot token configuration
  final env = DotEnv()..load();
  final isDebug = args.contains('--debug');

  final botToken = env[!isDebug ? 'BOT_TOKEN' : 'BOT_TOKEN_DEBUG'];

  if (botToken == null) {
    stderr.addError(ArgumentError('Bot token must be specified in .env file'));
    exit(1);
  }

  // Database configuration
  DatabaseConnection? dbConnection;

  if (!isDebug) {
    final dbIsolate = await DriftIsolate.spawn(_openLocalDatabase);
    dbConnection = await dbIsolate.connect();
  }

  await ClasherBot(botToken: botToken, dbConnection: dbConnection).start();
}

/// Creates or opens local db.sqlite3 file as database
DatabaseConnection _openLocalDatabase() {
  final dbFile = File(path.join(path.current, 'data', 'db.sqlite3'));
  final db = NativeDatabase(dbFile);

  return DatabaseConnection(db);
}
