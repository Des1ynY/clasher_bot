import 'package:nyxx/nyxx.dart';

import '../cache/cache.dart';
import 'events_handler.dart';

class MessageSender extends EventsHandler<IGuildMemberAddEvent> {
  List<WelcomeMessage> messages = [];

  MessageSender(super.events, {required Cache cache}) {
    cache.messagesDao.dataStream.listen((data) => messages = data);
  }

  @override
  Future<void> onEvent(IGuildMemberAddEvent event) async {
    if (_welcomingIsEnabled(event.guild.id.id)) {}
  }

  bool _welcomingIsEnabled(int guildId) => messages.where((e) => e.guildId == guildId).isNotEmpty;
}
