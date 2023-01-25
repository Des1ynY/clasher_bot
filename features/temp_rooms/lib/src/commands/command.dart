import 'package:nyxx_interactions/nyxx_interactions.dart';

abstract class SlashCommand {
  SlashCommandBuilder get builder;

  void handler(ISlashCommandInteractionEvent event);
}

extension InterationArgsHelper on List<IInteractionOption> {
  T? withKey<T>(String key) {
    try {
      return firstWhere((e) => e.name == key).value as T;
    } on Object {
      return null;
    }
  }
}
