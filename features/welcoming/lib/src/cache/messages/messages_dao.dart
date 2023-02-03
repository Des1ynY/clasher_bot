import 'package:drift/drift.dart';

import '../cache.dart';
import 'messages_table.dart';

part 'messages_dao.g.dart';

@DriftAccessor(tables: [MessagesTable])
class MessagesDao extends DatabaseAccessor<Cache> with _$MessagesDaoMixin {
  MessagesDao(super.db);

  Stream<List<WelcomeMessage>> get dataStream {
    return select(db.messagesTable).watch().asBroadcastStream();
  }

  Future<void> enableWelcoming(int guildId) async {
    final welcomeMessage = MessagesTableCompanion.insert(guildId: Value(guildId));

    await into(db.messagesTable).insert(
      welcomeMessage,
      onConflict: DoUpdate((old) => welcomeMessage),
    );
  }

  Future<void> disableWelcoming(int guildId) async {
    await (delete(db.messagesTable)..where((tbl) => tbl.guildId.equals(guildId))).go();
  }
}
