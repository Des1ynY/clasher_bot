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

  Future<void> updateGuildMessage(WelcomeMessage message) async {
    await into(db.messagesTable).insert(message, onConflict: DoUpdate((old) => message));
  }
}
