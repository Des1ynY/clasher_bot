import 'dart:async';

import 'package:drift/drift.dart';

import '../../config.dart';

@DataClassName('WelcomeMessage')
class MessagesTable extends Table {
  IntColumn get guildId => integer()();
  TextColumn get messageJson => text().clientDefault(() {
        return (Zone.current['config'] as WelcomingConfig).defaultMessageJson;
      })();

  @override
  Set<Column<Object>>? get primaryKey => {guildId};
}
