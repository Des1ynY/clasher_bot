class WelcomingConfig {
  final String defaultMessageJson;

  WelcomingConfig({
    String? defaultMessageJson,
  }) : defaultMessageJson = defaultMessageJson ?? _defaultMessageJson;

  static const _defaultMessageJson = r'''
    {
        "content": {
            "title": "Привет и добро пожаловать в ✨%GUILDNAME%✨",
            "fields": [
                {
                    "name": "",
                    "content": "**Посети <#%RULESCHANNELID%>**\nТы все таки в приличном обществе;",
                    "inline": false
                },
                {
                    "name": "",
                    "content": "**Пей, гуляй и веселись!**\n Как говорил один классик: \"Ничто не истинно, все дозволено\";",
                    "inline": false
                },
                {
                    "name": "",
                    "content": "**И благославляй <@%GUILDOWNERID%>**\n Ибо он свет и он же тьма. Ну и потому что забанить может (⊙x⊙;)",
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
