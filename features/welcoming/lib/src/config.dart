import 'package:nyxx/nyxx.dart';

typedef TitleBuilder = String Function(IUser, IGuild);
typedef FieldsBuilder = List<EmbedFieldBuilder> Function(IUser, IGuild);

class WelcomingConfig {
  WelcomingConfig();
}

/// Helper class for getting nullable values
class ConfigValue<T> {
  final T value;

  const ConfigValue(this.value);
}
