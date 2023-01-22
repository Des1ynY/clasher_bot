import 'package:nyxx/nyxx.dart';

class SettingsOverride {
  final List<PresenceBuilder> presences;
  final Duration updatePeriod;

  SettingsOverride({
    List<PresenceBuilder>? presences,
    Duration? updatePeriod,
  })  : presences = presences ?? _presences,
        updatePeriod = updatePeriod ?? _updatePeriod;

  /// Default list of presences
  static final _presences = [
    PresenceBuilder.of(activity: ActivityBuilder.watching('в твое окно')),
    PresenceBuilder.of(activity: ActivityBuilder.listening('разговоры в баре')),
    PresenceBuilder.of(
      activity: ActivityBuilder.streaming(
        'модный приговор',
        'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
      ),
    )
  ];

  /// Default period of presence change
  static const _updatePeriod = Duration(minutes: 5);
}
