import 'package:drift/drift.dart';

import '../cache.dart';
import 'func_channels_table.dart';

part 'func_channels_dao.g.dart';

@DriftAccessor(tables: [FuncChannelsTable])
class FuncChannelsDao extends DatabaseAccessor<Cache> with _$FuncChannelsDaoMixin {
  FuncChannelsDao(super.db);

  Stream<List<FuncChannel>> get dataStream => select(db.funcChannelsTable).watch();
}
