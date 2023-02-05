// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cache.dart';

// ignore_for_file: type=lint
class $MessagesTableTable extends MessagesTable
    with TableInfo<$MessagesTableTable, WelcomeMessage> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MessagesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _guildIdMeta =
      const VerificationMeta('guildId');
  @override
  late final GeneratedColumn<int> guildId = GeneratedColumn<int>(
      'guild_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _messageJsonMeta =
      const VerificationMeta('messageJson');
  @override
  late final GeneratedColumn<String> messageJson = GeneratedColumn<String>(
      'message_json', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false, clientDefault: () {
    return (Zone.current['config'] as WelcomingConfig).defaultMessageJson;
  });
  @override
  List<GeneratedColumn> get $columns => [guildId, messageJson];
  @override
  String get aliasedName => _alias ?? 'messages_table';
  @override
  String get actualTableName => 'messages_table';
  @override
  VerificationContext validateIntegrity(Insertable<WelcomeMessage> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('guild_id')) {
      context.handle(_guildIdMeta,
          guildId.isAcceptableOrUnknown(data['guild_id']!, _guildIdMeta));
    }
    if (data.containsKey('message_json')) {
      context.handle(
          _messageJsonMeta,
          messageJson.isAcceptableOrUnknown(
              data['message_json']!, _messageJsonMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {guildId};
  @override
  WelcomeMessage map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WelcomeMessage(
      guildId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}guild_id'])!,
      messageJson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}message_json'])!,
    );
  }

  @override
  $MessagesTableTable createAlias(String alias) {
    return $MessagesTableTable(attachedDatabase, alias);
  }
}

class WelcomeMessage extends DataClass implements Insertable<WelcomeMessage> {
  final int guildId;
  final String messageJson;
  const WelcomeMessage({required this.guildId, required this.messageJson});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['guild_id'] = Variable<int>(guildId);
    map['message_json'] = Variable<String>(messageJson);
    return map;
  }

  MessagesTableCompanion toCompanion(bool nullToAbsent) {
    return MessagesTableCompanion(
      guildId: Value(guildId),
      messageJson: Value(messageJson),
    );
  }

  factory WelcomeMessage.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WelcomeMessage(
      guildId: serializer.fromJson<int>(json['guildId']),
      messageJson: serializer.fromJson<String>(json['messageJson']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'guildId': serializer.toJson<int>(guildId),
      'messageJson': serializer.toJson<String>(messageJson),
    };
  }

  WelcomeMessage copyWith({int? guildId, String? messageJson}) =>
      WelcomeMessage(
        guildId: guildId ?? this.guildId,
        messageJson: messageJson ?? this.messageJson,
      );
  @override
  String toString() {
    return (StringBuffer('WelcomeMessage(')
          ..write('guildId: $guildId, ')
          ..write('messageJson: $messageJson')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(guildId, messageJson);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WelcomeMessage &&
          other.guildId == this.guildId &&
          other.messageJson == this.messageJson);
}

class MessagesTableCompanion extends UpdateCompanion<WelcomeMessage> {
  final Value<int> guildId;
  final Value<String> messageJson;
  const MessagesTableCompanion({
    this.guildId = const Value.absent(),
    this.messageJson = const Value.absent(),
  });
  MessagesTableCompanion.insert({
    this.guildId = const Value.absent(),
    this.messageJson = const Value.absent(),
  });
  static Insertable<WelcomeMessage> custom({
    Expression<int>? guildId,
    Expression<String>? messageJson,
  }) {
    return RawValuesInsertable({
      if (guildId != null) 'guild_id': guildId,
      if (messageJson != null) 'message_json': messageJson,
    });
  }

  MessagesTableCompanion copyWith(
      {Value<int>? guildId, Value<String>? messageJson}) {
    return MessagesTableCompanion(
      guildId: guildId ?? this.guildId,
      messageJson: messageJson ?? this.messageJson,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (guildId.present) {
      map['guild_id'] = Variable<int>(guildId.value);
    }
    if (messageJson.present) {
      map['message_json'] = Variable<String>(messageJson.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MessagesTableCompanion(')
          ..write('guildId: $guildId, ')
          ..write('messageJson: $messageJson')
          ..write(')'))
        .toString();
  }
}

abstract class _$Cache extends GeneratedDatabase {
  _$Cache(QueryExecutor e) : super(e);
  _$Cache.connect(DatabaseConnection c) : super.connect(c);
  late final $MessagesTableTable messagesTable = $MessagesTableTable(this);
  late final MessagesDao messagesDao = MessagesDao(this as Cache);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [messagesTable];
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}
