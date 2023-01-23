import 'package:nyxx/nyxx.dart';

import '../cache/cache.dart';
import 'event_handler.dart';

class RoomsCreator extends EventsHandler<IVoiceStateUpdateEvent> {
  final Cache cache;

  RoomsCreator(super.events, {required this.cache}) {
    cache.funcChannelsDao.dataStream.listen((data) => _funcChannels = data);
  }

  late List<FuncChannel> _funcChannels;

  @override
  void onEvent(IVoiceStateUpdateEvent event) {
    if (userJoinedFuncChannel(event.oldState, event.state)) {
      createTempRoom(event).then((room) => moveUserToRoom(room, event));
    }
  }

  bool userJoinedFuncChannel(IVoiceState? oldState, IVoiceState state) {
    if (state.channel == null) return false;
    if (oldState?.channel?.id == state.channel?.id) return false;

    return _funcChannels.map((e) => e.id).contains(state.channel?.id.id);
  }

  Future<TempRoom> createTempRoom(IVoiceStateUpdateEvent event) async {
    final guild = await event.state.guild!.getOrDownload();
    final user = await event.state.user.getOrDownload();
    final member = await guild.fetchMember(user.id);

    final guildChannel = guild.channels.firstWhere((e) => e.id == event.state.channel!.id);
    final funcChannel = _funcChannels.firstWhere((e) => e.id == event.state.channel!.id.id);

    final roomBuilder = VoiceChannelBuilder()
      ..name = funcChannel.getRoomName(member.nickname ?? user.username)
      ..userLimit = funcChannel.usersLimit
      ..position = guildChannel.position - 1
      ..parentChannel = guildChannel.parentChannel?.id.toSnowflakeEntity();
    final room = await guild.createChannel(roomBuilder);

    return cache.tempRoomsDao.cacheTempRoom(room.id.id, user.id.id, guild.id.id);
  }

  Future<void> moveUserToRoom(TempRoom room, IVoiceStateUpdateEvent event) async {
    final guild = await event.state.guild!.getOrDownload();
    final member = await guild.fetchMember(event.state.user.id);

    return member.edit(builder: MemberBuilder()..channel = Snowflake(room.id));
  }
}

extension on FuncChannel {
  String getRoomName(String username) {
    final regexp = RegExp('%[a-z]*%', caseSensitive: false);
    final validMask = name.replaceAllMapped(regexp, _toUppercase);
    final result = validMask.replaceAll('%USERNAME%', username).replaceAll('%EMOJI%', emoji);

    return result;
  }

  String get emoji {
    if (emojiSet == null) return '';

    final bytes = emojiSet!.codeUnits;
    final emojis = List.generate(bytes.length ~/ 2, (i) => [...bytes.sublist(i, i + 1)]);

    return String.fromCharCodes(emojis[id % emojis.length]);
  }

  String _toUppercase(Match match) => match.input.substring(match.start, match.end).toUpperCase();
}