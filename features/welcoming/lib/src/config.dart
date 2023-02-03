class WelcomingConfig {
  final String defaultMessageJson;

  WelcomingConfig({
    String? defaultMessageJson,
  }) : defaultMessageJson = defaultMessageJson ?? _defaultMessageJson;

  static const _defaultMessageJson = '''
    {
        "content": {
            "title": "Привет, %USERNAME%, и добро пожаловать в ✨%GUILDNAME%✨",
            "body": [
                {
                    "name": "Посети <#%RULESCHANNELID%>",
                    "content": "Узнаешь местные обычаи и может научишься этикету;",
                    "inline": false
                },
                {
                    "name": "Пей, гуляй и веселись",
                    "content": "Как говорил один классик: \"Ничто не истинно, все дозволено\".",
                    "inline": false
                },
                {
                    "name": "И благославляй <@%GUILDOWNERID%>",
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
}
