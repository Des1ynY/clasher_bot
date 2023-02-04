import 'package:nyxx/nyxx.dart';

import '../cache/cache.dart';
import 'events_handler.dart';

class GuildsCacher extends EventsHandler<IGuildCreateEvent> {
  final Cache cache;

  GuildsCacher(super.events, {required this.cache});

  @override
  Future<void> onEvent(IGuildCreateEvent event) async {
    await cache.messagesDao.enableWelcoming(event.guild.id.id, isCaching: true);
  }
}
