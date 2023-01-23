import 'package:nyxx/nyxx.dart';

import '../cache/cache.dart';
import '../config.dart';
import 'event_handler.dart';

class RoomsCleaner extends EventsHandler<IVoiceStateUpdateEvent> {
  final Cache cache;
  final TempRoomsConfig config;

  RoomsCleaner(super.events, {required this.cache, required this.config}) {
    cache.tempRoomsDao.dataStream.listen((data) => _tempRooms = data);
  }

  late List<TempRoom> _tempRooms;

  @override
  void onEvent(IVoiceStateUpdateEvent event) {
    if (userLeftTempRoom(event.oldState, event.state)) {
      deleteTempRoom(event);
    }
  }

  bool userLeftTempRoom(IVoiceState? oldState, IVoiceState state) {
    if (oldState?.channel == null) return false;
    if (oldState?.channel?.id == state.channel?.id) return false;

    return _tempRooms.map((e) => e.id).contains(oldState?.channel?.id.id);
  }

  Future<void> deleteTempRoom(IVoiceStateUpdateEvent event, {bool checkEmptiness = true}) async {
    final guild = await event.oldState!.guild!.getOrDownload();
    final roomId = event.oldState!.channel!.id;
    final room = guild.channels.firstWhere((e) => e.id == roomId);

    if (checkEmptiness) {
      final voiceStates = guild.voiceStates.values;
      final roomIsEmpty = voiceStates.where((e) => e.channel?.id == roomId).isEmpty;

      if (!roomIsEmpty) return;
    }

    await Future.wait([
      room.delete(),
      cache.tempRoomsDao.deleteTempRoom(roomId.id),
    ]);
  }
}
