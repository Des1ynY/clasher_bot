// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cache.dart';

// ignore_for_file: type=lint
class $TempRoomsTableTable extends TempRoomsTable
    with TableInfo<$TempRoomsTableTable, TempRoom> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TempRoomsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _authorIdMeta =
      const VerificationMeta('authorId');
  @override
  late final GeneratedColumn<int> authorId = GeneratedColumn<int>(
      'author_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _guildIdMeta =
      const VerificationMeta('guildId');
  @override
  late final GeneratedColumn<int> guildId = GeneratedColumn<int>(
      'guild_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _createdTimeMeta =
      const VerificationMeta('createdTime');
  @override
  late final GeneratedColumn<DateTime> createdTime = GeneratedColumn<DateTime>(
      'created_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletedTimeMeta =
      const VerificationMeta('deletedTime');
  @override
  late final GeneratedColumn<DateTime> deletedTime = GeneratedColumn<DateTime>(
      'deleted_time', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, authorId, guildId, createdTime, deletedTime];
  @override
  String get aliasedName => _alias ?? 'temp_rooms_table';
  @override
  String get actualTableName => 'temp_rooms_table';
  @override
  VerificationContext validateIntegrity(Insertable<TempRoom> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('author_id')) {
      context.handle(_authorIdMeta,
          authorId.isAcceptableOrUnknown(data['author_id']!, _authorIdMeta));
    } else if (isInserting) {
      context.missing(_authorIdMeta);
    }
    if (data.containsKey('guild_id')) {
      context.handle(_guildIdMeta,
          guildId.isAcceptableOrUnknown(data['guild_id']!, _guildIdMeta));
    } else if (isInserting) {
      context.missing(_guildIdMeta);
    }
    if (data.containsKey('created_time')) {
      context.handle(
          _createdTimeMeta,
          createdTime.isAcceptableOrUnknown(
              data['created_time']!, _createdTimeMeta));
    } else if (isInserting) {
      context.missing(_createdTimeMeta);
    }
    if (data.containsKey('deleted_time')) {
      context.handle(
          _deletedTimeMeta,
          deletedTime.isAcceptableOrUnknown(
              data['deleted_time']!, _deletedTimeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TempRoom map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TempRoom(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      authorId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}author_id'])!,
      guildId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}guild_id'])!,
      createdTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_time'])!,
      deletedTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_time']),
    );
  }

  @override
  $TempRoomsTableTable createAlias(String alias) {
    return $TempRoomsTableTable(attachedDatabase, alias);
  }
}

class TempRoom extends DataClass implements Insertable<TempRoom> {
  final int id;
  final int authorId;
  final int guildId;
  final DateTime createdTime;
  final DateTime? deletedTime;
  const TempRoom(
      {required this.id,
      required this.authorId,
      required this.guildId,
      required this.createdTime,
      this.deletedTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['author_id'] = Variable<int>(authorId);
    map['guild_id'] = Variable<int>(guildId);
    map['created_time'] = Variable<DateTime>(createdTime);
    if (!nullToAbsent || deletedTime != null) {
      map['deleted_time'] = Variable<DateTime>(deletedTime);
    }
    return map;
  }

  TempRoomsTableCompanion toCompanion(bool nullToAbsent) {
    return TempRoomsTableCompanion(
      id: Value(id),
      authorId: Value(authorId),
      guildId: Value(guildId),
      createdTime: Value(createdTime),
      deletedTime: deletedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedTime),
    );
  }

  factory TempRoom.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TempRoom(
      id: serializer.fromJson<int>(json['id']),
      authorId: serializer.fromJson<int>(json['authorId']),
      guildId: serializer.fromJson<int>(json['guildId']),
      createdTime: serializer.fromJson<DateTime>(json['createdTime']),
      deletedTime: serializer.fromJson<DateTime?>(json['deletedTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'authorId': serializer.toJson<int>(authorId),
      'guildId': serializer.toJson<int>(guildId),
      'createdTime': serializer.toJson<DateTime>(createdTime),
      'deletedTime': serializer.toJson<DateTime?>(deletedTime),
    };
  }

  TempRoom copyWith(
          {int? id,
          int? authorId,
          int? guildId,
          DateTime? createdTime,
          Value<DateTime?> deletedTime = const Value.absent()}) =>
      TempRoom(
        id: id ?? this.id,
        authorId: authorId ?? this.authorId,
        guildId: guildId ?? this.guildId,
        createdTime: createdTime ?? this.createdTime,
        deletedTime: deletedTime.present ? deletedTime.value : this.deletedTime,
      );
  @override
  String toString() {
    return (StringBuffer('TempRoom(')
          ..write('id: $id, ')
          ..write('authorId: $authorId, ')
          ..write('guildId: $guildId, ')
          ..write('createdTime: $createdTime, ')
          ..write('deletedTime: $deletedTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, authorId, guildId, createdTime, deletedTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TempRoom &&
          other.id == this.id &&
          other.authorId == this.authorId &&
          other.guildId == this.guildId &&
          other.createdTime == this.createdTime &&
          other.deletedTime == this.deletedTime);
}

class TempRoomsTableCompanion extends UpdateCompanion<TempRoom> {
  final Value<int> id;
  final Value<int> authorId;
  final Value<int> guildId;
  final Value<DateTime> createdTime;
  final Value<DateTime?> deletedTime;
  const TempRoomsTableCompanion({
    this.id = const Value.absent(),
    this.authorId = const Value.absent(),
    this.guildId = const Value.absent(),
    this.createdTime = const Value.absent(),
    this.deletedTime = const Value.absent(),
  });
  TempRoomsTableCompanion.insert({
    this.id = const Value.absent(),
    required int authorId,
    required int guildId,
    required DateTime createdTime,
    this.deletedTime = const Value.absent(),
  })  : authorId = Value(authorId),
        guildId = Value(guildId),
        createdTime = Value(createdTime);
  static Insertable<TempRoom> custom({
    Expression<int>? id,
    Expression<int>? authorId,
    Expression<int>? guildId,
    Expression<DateTime>? createdTime,
    Expression<DateTime>? deletedTime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (authorId != null) 'author_id': authorId,
      if (guildId != null) 'guild_id': guildId,
      if (createdTime != null) 'created_time': createdTime,
      if (deletedTime != null) 'deleted_time': deletedTime,
    });
  }

  TempRoomsTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? authorId,
      Value<int>? guildId,
      Value<DateTime>? createdTime,
      Value<DateTime?>? deletedTime}) {
    return TempRoomsTableCompanion(
      id: id ?? this.id,
      authorId: authorId ?? this.authorId,
      guildId: guildId ?? this.guildId,
      createdTime: createdTime ?? this.createdTime,
      deletedTime: deletedTime ?? this.deletedTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (authorId.present) {
      map['author_id'] = Variable<int>(authorId.value);
    }
    if (guildId.present) {
      map['guild_id'] = Variable<int>(guildId.value);
    }
    if (createdTime.present) {
      map['created_time'] = Variable<DateTime>(createdTime.value);
    }
    if (deletedTime.present) {
      map['deleted_time'] = Variable<DateTime>(deletedTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TempRoomsTableCompanion(')
          ..write('id: $id, ')
          ..write('authorId: $authorId, ')
          ..write('guildId: $guildId, ')
          ..write('createdTime: $createdTime, ')
          ..write('deletedTime: $deletedTime')
          ..write(')'))
        .toString();
  }
}

class $FuncChannelsTableTable extends FuncChannelsTable
    with TableInfo<$FuncChannelsTableTable, FuncChannel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FuncChannelsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _guildIdMeta =
      const VerificationMeta('guildId');
  @override
  late final GeneratedColumn<int> guildId = GeneratedColumn<int>(
      'guild_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 64),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _emojiSetMeta =
      const VerificationMeta('emojiSet');
  @override
  late final GeneratedColumn<String> emojiSet = GeneratedColumn<String>(
      'emoji_set', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _usersLimitMeta =
      const VerificationMeta('usersLimit');
  @override
  late final GeneratedColumn<int> usersLimit = GeneratedColumn<int>(
      'users_limit', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, guildId, name, emojiSet, usersLimit];
  @override
  String get aliasedName => _alias ?? 'func_channels_table';
  @override
  String get actualTableName => 'func_channels_table';
  @override
  VerificationContext validateIntegrity(Insertable<FuncChannel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('guild_id')) {
      context.handle(_guildIdMeta,
          guildId.isAcceptableOrUnknown(data['guild_id']!, _guildIdMeta));
    } else if (isInserting) {
      context.missing(_guildIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('emoji_set')) {
      context.handle(_emojiSetMeta,
          emojiSet.isAcceptableOrUnknown(data['emoji_set']!, _emojiSetMeta));
    }
    if (data.containsKey('users_limit')) {
      context.handle(
          _usersLimitMeta,
          usersLimit.isAcceptableOrUnknown(
              data['users_limit']!, _usersLimitMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FuncChannel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FuncChannel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      guildId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}guild_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      emojiSet: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}emoji_set']),
      usersLimit: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}users_limit']),
    );
  }

  @override
  $FuncChannelsTableTable createAlias(String alias) {
    return $FuncChannelsTableTable(attachedDatabase, alias);
  }
}

class FuncChannel extends DataClass implements Insertable<FuncChannel> {
  final int id;
  final int guildId;
  final String name;
  final String? emojiSet;
  final int? usersLimit;
  const FuncChannel(
      {required this.id,
      required this.guildId,
      required this.name,
      this.emojiSet,
      this.usersLimit});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['guild_id'] = Variable<int>(guildId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || emojiSet != null) {
      map['emoji_set'] = Variable<String>(emojiSet);
    }
    if (!nullToAbsent || usersLimit != null) {
      map['users_limit'] = Variable<int>(usersLimit);
    }
    return map;
  }

  FuncChannelsTableCompanion toCompanion(bool nullToAbsent) {
    return FuncChannelsTableCompanion(
      id: Value(id),
      guildId: Value(guildId),
      name: Value(name),
      emojiSet: emojiSet == null && nullToAbsent
          ? const Value.absent()
          : Value(emojiSet),
      usersLimit: usersLimit == null && nullToAbsent
          ? const Value.absent()
          : Value(usersLimit),
    );
  }

  factory FuncChannel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FuncChannel(
      id: serializer.fromJson<int>(json['id']),
      guildId: serializer.fromJson<int>(json['guildId']),
      name: serializer.fromJson<String>(json['name']),
      emojiSet: serializer.fromJson<String?>(json['emojiSet']),
      usersLimit: serializer.fromJson<int?>(json['usersLimit']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'guildId': serializer.toJson<int>(guildId),
      'name': serializer.toJson<String>(name),
      'emojiSet': serializer.toJson<String?>(emojiSet),
      'usersLimit': serializer.toJson<int?>(usersLimit),
    };
  }

  FuncChannel copyWith(
          {int? id,
          int? guildId,
          String? name,
          Value<String?> emojiSet = const Value.absent(),
          Value<int?> usersLimit = const Value.absent()}) =>
      FuncChannel(
        id: id ?? this.id,
        guildId: guildId ?? this.guildId,
        name: name ?? this.name,
        emojiSet: emojiSet.present ? emojiSet.value : this.emojiSet,
        usersLimit: usersLimit.present ? usersLimit.value : this.usersLimit,
      );
  @override
  String toString() {
    return (StringBuffer('FuncChannel(')
          ..write('id: $id, ')
          ..write('guildId: $guildId, ')
          ..write('name: $name, ')
          ..write('emojiSet: $emojiSet, ')
          ..write('usersLimit: $usersLimit')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, guildId, name, emojiSet, usersLimit);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FuncChannel &&
          other.id == this.id &&
          other.guildId == this.guildId &&
          other.name == this.name &&
          other.emojiSet == this.emojiSet &&
          other.usersLimit == this.usersLimit);
}

class FuncChannelsTableCompanion extends UpdateCompanion<FuncChannel> {
  final Value<int> id;
  final Value<int> guildId;
  final Value<String> name;
  final Value<String?> emojiSet;
  final Value<int?> usersLimit;
  const FuncChannelsTableCompanion({
    this.id = const Value.absent(),
    this.guildId = const Value.absent(),
    this.name = const Value.absent(),
    this.emojiSet = const Value.absent(),
    this.usersLimit = const Value.absent(),
  });
  FuncChannelsTableCompanion.insert({
    this.id = const Value.absent(),
    required int guildId,
    required String name,
    this.emojiSet = const Value.absent(),
    this.usersLimit = const Value.absent(),
  })  : guildId = Value(guildId),
        name = Value(name);
  static Insertable<FuncChannel> custom({
    Expression<int>? id,
    Expression<int>? guildId,
    Expression<String>? name,
    Expression<String>? emojiSet,
    Expression<int>? usersLimit,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (guildId != null) 'guild_id': guildId,
      if (name != null) 'name': name,
      if (emojiSet != null) 'emoji_set': emojiSet,
      if (usersLimit != null) 'users_limit': usersLimit,
    });
  }

  FuncChannelsTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? guildId,
      Value<String>? name,
      Value<String?>? emojiSet,
      Value<int?>? usersLimit}) {
    return FuncChannelsTableCompanion(
      id: id ?? this.id,
      guildId: guildId ?? this.guildId,
      name: name ?? this.name,
      emojiSet: emojiSet ?? this.emojiSet,
      usersLimit: usersLimit ?? this.usersLimit,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (guildId.present) {
      map['guild_id'] = Variable<int>(guildId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (emojiSet.present) {
      map['emoji_set'] = Variable<String>(emojiSet.value);
    }
    if (usersLimit.present) {
      map['users_limit'] = Variable<int>(usersLimit.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FuncChannelsTableCompanion(')
          ..write('id: $id, ')
          ..write('guildId: $guildId, ')
          ..write('name: $name, ')
          ..write('emojiSet: $emojiSet, ')
          ..write('usersLimit: $usersLimit')
          ..write(')'))
        .toString();
  }
}

class $StatsTableTable extends StatsTable
    with TableInfo<$StatsTableTable, Stat> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StatsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _guildIdMeta =
      const VerificationMeta('guildId');
  @override
  late final GeneratedColumn<int> guildId = GeneratedColumn<int>(
      'guild_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _tempRoomsCreatedMeta =
      const VerificationMeta('tempRoomsCreated');
  @override
  late final GeneratedColumn<int> tempRoomsCreated = GeneratedColumn<int>(
      'temp_rooms_created', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _tempRoomsMinutesUsedMeta =
      const VerificationMeta('tempRoomsMinutesUsed');
  @override
  late final GeneratedColumn<int> tempRoomsMinutesUsed = GeneratedColumn<int>(
      'temp_rooms_minutes_used', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _mostActiveCreatorIdMeta =
      const VerificationMeta('mostActiveCreatorId');
  @override
  late final GeneratedColumn<int> mostActiveCreatorId = GeneratedColumn<int>(
      'most_active_creator_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _mostActiveCreatorCountMeta =
      const VerificationMeta('mostActiveCreatorCount');
  @override
  late final GeneratedColumn<int> mostActiveCreatorCount = GeneratedColumn<int>(
      'most_active_creator_count', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        guildId,
        tempRoomsCreated,
        tempRoomsMinutesUsed,
        mostActiveCreatorId,
        mostActiveCreatorCount
      ];
  @override
  String get aliasedName => _alias ?? 'stats_table';
  @override
  String get actualTableName => 'stats_table';
  @override
  VerificationContext validateIntegrity(Insertable<Stat> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('guild_id')) {
      context.handle(_guildIdMeta,
          guildId.isAcceptableOrUnknown(data['guild_id']!, _guildIdMeta));
    }
    if (data.containsKey('temp_rooms_created')) {
      context.handle(
          _tempRoomsCreatedMeta,
          tempRoomsCreated.isAcceptableOrUnknown(
              data['temp_rooms_created']!, _tempRoomsCreatedMeta));
    }
    if (data.containsKey('temp_rooms_minutes_used')) {
      context.handle(
          _tempRoomsMinutesUsedMeta,
          tempRoomsMinutesUsed.isAcceptableOrUnknown(
              data['temp_rooms_minutes_used']!, _tempRoomsMinutesUsedMeta));
    }
    if (data.containsKey('most_active_creator_id')) {
      context.handle(
          _mostActiveCreatorIdMeta,
          mostActiveCreatorId.isAcceptableOrUnknown(
              data['most_active_creator_id']!, _mostActiveCreatorIdMeta));
    }
    if (data.containsKey('most_active_creator_count')) {
      context.handle(
          _mostActiveCreatorCountMeta,
          mostActiveCreatorCount.isAcceptableOrUnknown(
              data['most_active_creator_count']!, _mostActiveCreatorCountMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {guildId};
  @override
  Stat map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Stat(
      guildId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}guild_id'])!,
      tempRoomsCreated: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}temp_rooms_created'])!,
      tempRoomsMinutesUsed: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}temp_rooms_minutes_used'])!,
      mostActiveCreatorId: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}most_active_creator_id']),
      mostActiveCreatorCount: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}most_active_creator_count']),
    );
  }

  @override
  $StatsTableTable createAlias(String alias) {
    return $StatsTableTable(attachedDatabase, alias);
  }
}

class Stat extends DataClass implements Insertable<Stat> {
  final int guildId;
  final int tempRoomsCreated;
  final int tempRoomsMinutesUsed;
  final int? mostActiveCreatorId;
  final int? mostActiveCreatorCount;
  const Stat(
      {required this.guildId,
      required this.tempRoomsCreated,
      required this.tempRoomsMinutesUsed,
      this.mostActiveCreatorId,
      this.mostActiveCreatorCount});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['guild_id'] = Variable<int>(guildId);
    map['temp_rooms_created'] = Variable<int>(tempRoomsCreated);
    map['temp_rooms_minutes_used'] = Variable<int>(tempRoomsMinutesUsed);
    if (!nullToAbsent || mostActiveCreatorId != null) {
      map['most_active_creator_id'] = Variable<int>(mostActiveCreatorId);
    }
    if (!nullToAbsent || mostActiveCreatorCount != null) {
      map['most_active_creator_count'] = Variable<int>(mostActiveCreatorCount);
    }
    return map;
  }

  StatsTableCompanion toCompanion(bool nullToAbsent) {
    return StatsTableCompanion(
      guildId: Value(guildId),
      tempRoomsCreated: Value(tempRoomsCreated),
      tempRoomsMinutesUsed: Value(tempRoomsMinutesUsed),
      mostActiveCreatorId: mostActiveCreatorId == null && nullToAbsent
          ? const Value.absent()
          : Value(mostActiveCreatorId),
      mostActiveCreatorCount: mostActiveCreatorCount == null && nullToAbsent
          ? const Value.absent()
          : Value(mostActiveCreatorCount),
    );
  }

  factory Stat.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Stat(
      guildId: serializer.fromJson<int>(json['guildId']),
      tempRoomsCreated: serializer.fromJson<int>(json['tempRoomsCreated']),
      tempRoomsMinutesUsed:
          serializer.fromJson<int>(json['tempRoomsMinutesUsed']),
      mostActiveCreatorId:
          serializer.fromJson<int?>(json['mostActiveCreatorId']),
      mostActiveCreatorCount:
          serializer.fromJson<int?>(json['mostActiveCreatorCount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'guildId': serializer.toJson<int>(guildId),
      'tempRoomsCreated': serializer.toJson<int>(tempRoomsCreated),
      'tempRoomsMinutesUsed': serializer.toJson<int>(tempRoomsMinutesUsed),
      'mostActiveCreatorId': serializer.toJson<int?>(mostActiveCreatorId),
      'mostActiveCreatorCount': serializer.toJson<int?>(mostActiveCreatorCount),
    };
  }

  Stat copyWith(
          {int? guildId,
          int? tempRoomsCreated,
          int? tempRoomsMinutesUsed,
          Value<int?> mostActiveCreatorId = const Value.absent(),
          Value<int?> mostActiveCreatorCount = const Value.absent()}) =>
      Stat(
        guildId: guildId ?? this.guildId,
        tempRoomsCreated: tempRoomsCreated ?? this.tempRoomsCreated,
        tempRoomsMinutesUsed: tempRoomsMinutesUsed ?? this.tempRoomsMinutesUsed,
        mostActiveCreatorId: mostActiveCreatorId.present
            ? mostActiveCreatorId.value
            : this.mostActiveCreatorId,
        mostActiveCreatorCount: mostActiveCreatorCount.present
            ? mostActiveCreatorCount.value
            : this.mostActiveCreatorCount,
      );
  @override
  String toString() {
    return (StringBuffer('Stat(')
          ..write('guildId: $guildId, ')
          ..write('tempRoomsCreated: $tempRoomsCreated, ')
          ..write('tempRoomsMinutesUsed: $tempRoomsMinutesUsed, ')
          ..write('mostActiveCreatorId: $mostActiveCreatorId, ')
          ..write('mostActiveCreatorCount: $mostActiveCreatorCount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(guildId, tempRoomsCreated,
      tempRoomsMinutesUsed, mostActiveCreatorId, mostActiveCreatorCount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Stat &&
          other.guildId == this.guildId &&
          other.tempRoomsCreated == this.tempRoomsCreated &&
          other.tempRoomsMinutesUsed == this.tempRoomsMinutesUsed &&
          other.mostActiveCreatorId == this.mostActiveCreatorId &&
          other.mostActiveCreatorCount == this.mostActiveCreatorCount);
}

class StatsTableCompanion extends UpdateCompanion<Stat> {
  final Value<int> guildId;
  final Value<int> tempRoomsCreated;
  final Value<int> tempRoomsMinutesUsed;
  final Value<int?> mostActiveCreatorId;
  final Value<int?> mostActiveCreatorCount;
  const StatsTableCompanion({
    this.guildId = const Value.absent(),
    this.tempRoomsCreated = const Value.absent(),
    this.tempRoomsMinutesUsed = const Value.absent(),
    this.mostActiveCreatorId = const Value.absent(),
    this.mostActiveCreatorCount = const Value.absent(),
  });
  StatsTableCompanion.insert({
    this.guildId = const Value.absent(),
    this.tempRoomsCreated = const Value.absent(),
    this.tempRoomsMinutesUsed = const Value.absent(),
    this.mostActiveCreatorId = const Value.absent(),
    this.mostActiveCreatorCount = const Value.absent(),
  });
  static Insertable<Stat> custom({
    Expression<int>? guildId,
    Expression<int>? tempRoomsCreated,
    Expression<int>? tempRoomsMinutesUsed,
    Expression<int>? mostActiveCreatorId,
    Expression<int>? mostActiveCreatorCount,
  }) {
    return RawValuesInsertable({
      if (guildId != null) 'guild_id': guildId,
      if (tempRoomsCreated != null) 'temp_rooms_created': tempRoomsCreated,
      if (tempRoomsMinutesUsed != null)
        'temp_rooms_minutes_used': tempRoomsMinutesUsed,
      if (mostActiveCreatorId != null)
        'most_active_creator_id': mostActiveCreatorId,
      if (mostActiveCreatorCount != null)
        'most_active_creator_count': mostActiveCreatorCount,
    });
  }

  StatsTableCompanion copyWith(
      {Value<int>? guildId,
      Value<int>? tempRoomsCreated,
      Value<int>? tempRoomsMinutesUsed,
      Value<int?>? mostActiveCreatorId,
      Value<int?>? mostActiveCreatorCount}) {
    return StatsTableCompanion(
      guildId: guildId ?? this.guildId,
      tempRoomsCreated: tempRoomsCreated ?? this.tempRoomsCreated,
      tempRoomsMinutesUsed: tempRoomsMinutesUsed ?? this.tempRoomsMinutesUsed,
      mostActiveCreatorId: mostActiveCreatorId ?? this.mostActiveCreatorId,
      mostActiveCreatorCount:
          mostActiveCreatorCount ?? this.mostActiveCreatorCount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (guildId.present) {
      map['guild_id'] = Variable<int>(guildId.value);
    }
    if (tempRoomsCreated.present) {
      map['temp_rooms_created'] = Variable<int>(tempRoomsCreated.value);
    }
    if (tempRoomsMinutesUsed.present) {
      map['temp_rooms_minutes_used'] =
          Variable<int>(tempRoomsMinutesUsed.value);
    }
    if (mostActiveCreatorId.present) {
      map['most_active_creator_id'] = Variable<int>(mostActiveCreatorId.value);
    }
    if (mostActiveCreatorCount.present) {
      map['most_active_creator_count'] =
          Variable<int>(mostActiveCreatorCount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StatsTableCompanion(')
          ..write('guildId: $guildId, ')
          ..write('tempRoomsCreated: $tempRoomsCreated, ')
          ..write('tempRoomsMinutesUsed: $tempRoomsMinutesUsed, ')
          ..write('mostActiveCreatorId: $mostActiveCreatorId, ')
          ..write('mostActiveCreatorCount: $mostActiveCreatorCount')
          ..write(')'))
        .toString();
  }
}

abstract class _$Cache extends GeneratedDatabase {
  _$Cache(QueryExecutor e) : super(e);
  _$Cache.connect(DatabaseConnection c) : super.connect(c);
  late final $TempRoomsTableTable tempRoomsTable = $TempRoomsTableTable(this);
  late final $FuncChannelsTableTable funcChannelsTable =
      $FuncChannelsTableTable(this);
  late final $StatsTableTable statsTable = $StatsTableTable(this);
  late final TempRoomsDao tempRoomsDao = TempRoomsDao(this as Cache);
  late final FuncChannelsDao funcChannelsDao = FuncChannelsDao(this as Cache);
  late final StatsDao statsDao = StatsDao(this as Cache);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [tempRoomsTable, funcChannelsTable, statsTable];
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}
