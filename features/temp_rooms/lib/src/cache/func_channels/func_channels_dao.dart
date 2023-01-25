import 'package:drift/drift.dart';

import '../cache.dart';
import 'func_channels_table.dart';

part 'func_channels_dao.g.dart';

@DriftAccessor(tables: [FuncChannelsTable])
class FuncChannelsDao extends DatabaseAccessor<Cache> with _$FuncChannelsDaoMixin {
  FuncChannelsDao(super.db);

  Stream<List<FuncChannel>> get dataStream {
    return select(db.funcChannelsTable).watch().asBroadcastStream();
  }

  Future<void> cacheFuncChannel(FuncChannel funcChannel) async {
    await into(db.funcChannelsTable).insert(
      funcChannel,
      onConflict: DoUpdate((old) => funcChannel),
    );
  }

  Future<void> deleteFuncChannel(int channelId) async {
    final query = delete(db.funcChannelsTable)..where((tbl) => tbl.id.equals(channelId));
    await query.go();
  }
}
