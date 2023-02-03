// ignore_for_file: unnecessary_string_escapes

import 'package:drift/drift.dart';

@DataClassName('WelcomeMessage')
class MessagesTable extends Table {
  IntColumn get guildId => integer()();
  IntColumn get systemChannelId => integer().nullable()();
  TextColumn get messageJson => text().withDefault(const Constant(_defaultMessageJson))();

  @override
  Set<Column<Object>>? get primaryKey => {guildId};
}

const _defaultMessageJson = '''
{
    "content": {
        "title": "Привет, %USERNAME%, и добро пожаловать в ✨%GUILDNAME%✨",
        "body": [
            {
                "name": "Посети <#%RULESCHANNEL%>",
                "content": "Узнаешь местные обычаи и может научишься этикету;",
                "inline": false
            },
            {
                "name": "Пей, гуляй и веселись",
                "content": "Как говорил один классик: \"Ничто не истинно, все дозволено\".",
                "inline": false
            },
            {
                "name": "И благославляй <@%GUILDOWNER%>",
                "content": "Ибо он свет и он же тьма. Ну и потому что забанить может (⊙x⊙;)",
                "inline": false
            }
        ],
        "footer": "Улыбаемся и машем! (✿◡‿◡)"
    },
    "config": {
        "mention": true,
        "color": "#5b4665",
        "image_url": "https://i.pinimg.com/originals/1c/91/83/1c9183d00ad83ec833bf2ef0d6cf70e2.gif"
    }
}
''';
