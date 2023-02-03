import 'package:drift/drift.dart';
import 'package:drift/native.dart';

import 'messages/messages_dao.dart';
import 'messages/messages_table.dart';

part 'cache.g.dart';

@DriftDatabase(
  tables: [MessagesTable],
  daos: [MessagesDao],
)
class Cache extends _$Cache {
  factory Cache(DatabaseConnection? connection) {
    if (connection != null) return Cache._connect(connection);

    return Cache._();
  }

  Cache._() : super(NativeDatabase.memory());
  Cache._connect(super.db) : super.connect();

  @override
  int get schemaVersion => 1;
}
