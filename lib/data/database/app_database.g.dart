// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $TasksTable extends Tasks with TableInfo<$TasksTable, Task> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TasksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 200,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<TaskTypeIndex, int> type =
      GeneratedColumn<int>(
        'type',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<TaskTypeIndex>($TasksTable.$convertertype);
  @override
  late final GeneratedColumnWithTypeConverter<TaskStatusIndex, int> status =
      GeneratedColumn<int>(
        'status',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<TaskStatusIndex>($TasksTable.$converterstatus);
  static const VerificationMeta _targetDateMeta = const VerificationMeta(
    'targetDate',
  );
  @override
  late final GeneratedColumn<DateTime> targetDate = GeneratedColumn<DateTime>(
    'target_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _scheduledStartMeta = const VerificationMeta(
    'scheduledStart',
  );
  @override
  late final GeneratedColumn<DateTime> scheduledStart =
      GeneratedColumn<DateTime>(
        'scheduled_start',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _durationMinutesMeta = const VerificationMeta(
    'durationMinutes',
  );
  @override
  late final GeneratedColumn<int> durationMinutes = GeneratedColumn<int>(
    'duration_minutes',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _memoMeta = const VerificationMeta('memo');
  @override
  late final GeneratedColumn<String> memo = GeneratedColumn<String>(
    'memo',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _iconNameMeta = const VerificationMeta(
    'iconName',
  );
  @override
  late final GeneratedColumn<String> iconName = GeneratedColumn<String>(
    'icon_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _colorValueMeta = const VerificationMeta(
    'colorValue',
  );
  @override
  late final GeneratedColumn<int> colorValue = GeneratedColumn<int>(
    'color_value',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isPinnedMeta = const VerificationMeta(
    'isPinned',
  );
  @override
  late final GeneratedColumn<bool> isPinned = GeneratedColumn<bool>(
    'is_pinned',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_pinned" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _routineIdMeta = const VerificationMeta(
    'routineId',
  );
  @override
  late final GeneratedColumn<String> routineId = GeneratedColumn<String>(
    'routine_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _snoozeCountMeta = const VerificationMeta(
    'snoozeCount',
  );
  @override
  late final GeneratedColumn<int> snoozeCount = GeneratedColumn<int>(
    'snooze_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _snoozedUntilMeta = const VerificationMeta(
    'snoozedUntil',
  );
  @override
  late final GeneratedColumn<DateTime> snoozedUntil = GeneratedColumn<DateTime>(
    'snoozed_until',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    type,
    status,
    targetDate,
    scheduledStart,
    durationMinutes,
    memo,
    iconName,
    colorValue,
    isPinned,
    routineId,
    snoozeCount,
    snoozedUntil,
    sortOrder,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tasks';
  @override
  VerificationContext validateIntegrity(
    Insertable<Task> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('target_date')) {
      context.handle(
        _targetDateMeta,
        targetDate.isAcceptableOrUnknown(data['target_date']!, _targetDateMeta),
      );
    } else if (isInserting) {
      context.missing(_targetDateMeta);
    }
    if (data.containsKey('scheduled_start')) {
      context.handle(
        _scheduledStartMeta,
        scheduledStart.isAcceptableOrUnknown(
          data['scheduled_start']!,
          _scheduledStartMeta,
        ),
      );
    }
    if (data.containsKey('duration_minutes')) {
      context.handle(
        _durationMinutesMeta,
        durationMinutes.isAcceptableOrUnknown(
          data['duration_minutes']!,
          _durationMinutesMeta,
        ),
      );
    }
    if (data.containsKey('memo')) {
      context.handle(
        _memoMeta,
        memo.isAcceptableOrUnknown(data['memo']!, _memoMeta),
      );
    }
    if (data.containsKey('icon_name')) {
      context.handle(
        _iconNameMeta,
        iconName.isAcceptableOrUnknown(data['icon_name']!, _iconNameMeta),
      );
    }
    if (data.containsKey('color_value')) {
      context.handle(
        _colorValueMeta,
        colorValue.isAcceptableOrUnknown(data['color_value']!, _colorValueMeta),
      );
    }
    if (data.containsKey('is_pinned')) {
      context.handle(
        _isPinnedMeta,
        isPinned.isAcceptableOrUnknown(data['is_pinned']!, _isPinnedMeta),
      );
    }
    if (data.containsKey('routine_id')) {
      context.handle(
        _routineIdMeta,
        routineId.isAcceptableOrUnknown(data['routine_id']!, _routineIdMeta),
      );
    }
    if (data.containsKey('snooze_count')) {
      context.handle(
        _snoozeCountMeta,
        snoozeCount.isAcceptableOrUnknown(
          data['snooze_count']!,
          _snoozeCountMeta,
        ),
      );
    }
    if (data.containsKey('snoozed_until')) {
      context.handle(
        _snoozedUntilMeta,
        snoozedUntil.isAcceptableOrUnknown(
          data['snoozed_until']!,
          _snoozedUntilMeta,
        ),
      );
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Task map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Task(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      type: $TasksTable.$convertertype.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}type'],
        )!,
      ),
      status: $TasksTable.$converterstatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}status'],
        )!,
      ),
      targetDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}target_date'],
      )!,
      scheduledStart: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}scheduled_start'],
      ),
      durationMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration_minutes'],
      ),
      memo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}memo'],
      ),
      iconName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}icon_name'],
      ),
      colorValue: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}color_value'],
      ),
      isPinned: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_pinned'],
      )!,
      routineId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}routine_id'],
      ),
      snoozeCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}snooze_count'],
      )!,
      snoozedUntil: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}snoozed_until'],
      ),
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $TasksTable createAlias(String alias) {
    return $TasksTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<TaskTypeIndex, int, int> $convertertype =
      const EnumIndexConverter<TaskTypeIndex>(TaskTypeIndex.values);
  static JsonTypeConverter2<TaskStatusIndex, int, int> $converterstatus =
      const EnumIndexConverter<TaskStatusIndex>(TaskStatusIndex.values);
}

class Task extends DataClass implements Insertable<Task> {
  final String id;
  final String title;
  final TaskTypeIndex type;
  final TaskStatusIndex status;
  final DateTime targetDate;
  final DateTime? scheduledStart;
  final int? durationMinutes;
  final String? memo;
  final String? iconName;
  final int? colorValue;
  final bool isPinned;
  final String? routineId;
  final int snoozeCount;
  final DateTime? snoozedUntil;
  final int sortOrder;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Task({
    required this.id,
    required this.title,
    required this.type,
    required this.status,
    required this.targetDate,
    this.scheduledStart,
    this.durationMinutes,
    this.memo,
    this.iconName,
    this.colorValue,
    required this.isPinned,
    this.routineId,
    required this.snoozeCount,
    this.snoozedUntil,
    required this.sortOrder,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    {
      map['type'] = Variable<int>($TasksTable.$convertertype.toSql(type));
    }
    {
      map['status'] = Variable<int>($TasksTable.$converterstatus.toSql(status));
    }
    map['target_date'] = Variable<DateTime>(targetDate);
    if (!nullToAbsent || scheduledStart != null) {
      map['scheduled_start'] = Variable<DateTime>(scheduledStart);
    }
    if (!nullToAbsent || durationMinutes != null) {
      map['duration_minutes'] = Variable<int>(durationMinutes);
    }
    if (!nullToAbsent || memo != null) {
      map['memo'] = Variable<String>(memo);
    }
    if (!nullToAbsent || iconName != null) {
      map['icon_name'] = Variable<String>(iconName);
    }
    if (!nullToAbsent || colorValue != null) {
      map['color_value'] = Variable<int>(colorValue);
    }
    map['is_pinned'] = Variable<bool>(isPinned);
    if (!nullToAbsent || routineId != null) {
      map['routine_id'] = Variable<String>(routineId);
    }
    map['snooze_count'] = Variable<int>(snoozeCount);
    if (!nullToAbsent || snoozedUntil != null) {
      map['snoozed_until'] = Variable<DateTime>(snoozedUntil);
    }
    map['sort_order'] = Variable<int>(sortOrder);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  TasksCompanion toCompanion(bool nullToAbsent) {
    return TasksCompanion(
      id: Value(id),
      title: Value(title),
      type: Value(type),
      status: Value(status),
      targetDate: Value(targetDate),
      scheduledStart: scheduledStart == null && nullToAbsent
          ? const Value.absent()
          : Value(scheduledStart),
      durationMinutes: durationMinutes == null && nullToAbsent
          ? const Value.absent()
          : Value(durationMinutes),
      memo: memo == null && nullToAbsent ? const Value.absent() : Value(memo),
      iconName: iconName == null && nullToAbsent
          ? const Value.absent()
          : Value(iconName),
      colorValue: colorValue == null && nullToAbsent
          ? const Value.absent()
          : Value(colorValue),
      isPinned: Value(isPinned),
      routineId: routineId == null && nullToAbsent
          ? const Value.absent()
          : Value(routineId),
      snoozeCount: Value(snoozeCount),
      snoozedUntil: snoozedUntil == null && nullToAbsent
          ? const Value.absent()
          : Value(snoozedUntil),
      sortOrder: Value(sortOrder),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Task.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Task(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      type: $TasksTable.$convertertype.fromJson(
        serializer.fromJson<int>(json['type']),
      ),
      status: $TasksTable.$converterstatus.fromJson(
        serializer.fromJson<int>(json['status']),
      ),
      targetDate: serializer.fromJson<DateTime>(json['targetDate']),
      scheduledStart: serializer.fromJson<DateTime?>(json['scheduledStart']),
      durationMinutes: serializer.fromJson<int?>(json['durationMinutes']),
      memo: serializer.fromJson<String?>(json['memo']),
      iconName: serializer.fromJson<String?>(json['iconName']),
      colorValue: serializer.fromJson<int?>(json['colorValue']),
      isPinned: serializer.fromJson<bool>(json['isPinned']),
      routineId: serializer.fromJson<String?>(json['routineId']),
      snoozeCount: serializer.fromJson<int>(json['snoozeCount']),
      snoozedUntil: serializer.fromJson<DateTime?>(json['snoozedUntil']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'type': serializer.toJson<int>($TasksTable.$convertertype.toJson(type)),
      'status': serializer.toJson<int>(
        $TasksTable.$converterstatus.toJson(status),
      ),
      'targetDate': serializer.toJson<DateTime>(targetDate),
      'scheduledStart': serializer.toJson<DateTime?>(scheduledStart),
      'durationMinutes': serializer.toJson<int?>(durationMinutes),
      'memo': serializer.toJson<String?>(memo),
      'iconName': serializer.toJson<String?>(iconName),
      'colorValue': serializer.toJson<int?>(colorValue),
      'isPinned': serializer.toJson<bool>(isPinned),
      'routineId': serializer.toJson<String?>(routineId),
      'snoozeCount': serializer.toJson<int>(snoozeCount),
      'snoozedUntil': serializer.toJson<DateTime?>(snoozedUntil),
      'sortOrder': serializer.toJson<int>(sortOrder),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Task copyWith({
    String? id,
    String? title,
    TaskTypeIndex? type,
    TaskStatusIndex? status,
    DateTime? targetDate,
    Value<DateTime?> scheduledStart = const Value.absent(),
    Value<int?> durationMinutes = const Value.absent(),
    Value<String?> memo = const Value.absent(),
    Value<String?> iconName = const Value.absent(),
    Value<int?> colorValue = const Value.absent(),
    bool? isPinned,
    Value<String?> routineId = const Value.absent(),
    int? snoozeCount,
    Value<DateTime?> snoozedUntil = const Value.absent(),
    int? sortOrder,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Task(
    id: id ?? this.id,
    title: title ?? this.title,
    type: type ?? this.type,
    status: status ?? this.status,
    targetDate: targetDate ?? this.targetDate,
    scheduledStart: scheduledStart.present
        ? scheduledStart.value
        : this.scheduledStart,
    durationMinutes: durationMinutes.present
        ? durationMinutes.value
        : this.durationMinutes,
    memo: memo.present ? memo.value : this.memo,
    iconName: iconName.present ? iconName.value : this.iconName,
    colorValue: colorValue.present ? colorValue.value : this.colorValue,
    isPinned: isPinned ?? this.isPinned,
    routineId: routineId.present ? routineId.value : this.routineId,
    snoozeCount: snoozeCount ?? this.snoozeCount,
    snoozedUntil: snoozedUntil.present ? snoozedUntil.value : this.snoozedUntil,
    sortOrder: sortOrder ?? this.sortOrder,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Task copyWithCompanion(TasksCompanion data) {
    return Task(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      type: data.type.present ? data.type.value : this.type,
      status: data.status.present ? data.status.value : this.status,
      targetDate: data.targetDate.present
          ? data.targetDate.value
          : this.targetDate,
      scheduledStart: data.scheduledStart.present
          ? data.scheduledStart.value
          : this.scheduledStart,
      durationMinutes: data.durationMinutes.present
          ? data.durationMinutes.value
          : this.durationMinutes,
      memo: data.memo.present ? data.memo.value : this.memo,
      iconName: data.iconName.present ? data.iconName.value : this.iconName,
      colorValue: data.colorValue.present
          ? data.colorValue.value
          : this.colorValue,
      isPinned: data.isPinned.present ? data.isPinned.value : this.isPinned,
      routineId: data.routineId.present ? data.routineId.value : this.routineId,
      snoozeCount: data.snoozeCount.present
          ? data.snoozeCount.value
          : this.snoozeCount,
      snoozedUntil: data.snoozedUntil.present
          ? data.snoozedUntil.value
          : this.snoozedUntil,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Task(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('type: $type, ')
          ..write('status: $status, ')
          ..write('targetDate: $targetDate, ')
          ..write('scheduledStart: $scheduledStart, ')
          ..write('durationMinutes: $durationMinutes, ')
          ..write('memo: $memo, ')
          ..write('iconName: $iconName, ')
          ..write('colorValue: $colorValue, ')
          ..write('isPinned: $isPinned, ')
          ..write('routineId: $routineId, ')
          ..write('snoozeCount: $snoozeCount, ')
          ..write('snoozedUntil: $snoozedUntil, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    type,
    status,
    targetDate,
    scheduledStart,
    durationMinutes,
    memo,
    iconName,
    colorValue,
    isPinned,
    routineId,
    snoozeCount,
    snoozedUntil,
    sortOrder,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Task &&
          other.id == this.id &&
          other.title == this.title &&
          other.type == this.type &&
          other.status == this.status &&
          other.targetDate == this.targetDate &&
          other.scheduledStart == this.scheduledStart &&
          other.durationMinutes == this.durationMinutes &&
          other.memo == this.memo &&
          other.iconName == this.iconName &&
          other.colorValue == this.colorValue &&
          other.isPinned == this.isPinned &&
          other.routineId == this.routineId &&
          other.snoozeCount == this.snoozeCount &&
          other.snoozedUntil == this.snoozedUntil &&
          other.sortOrder == this.sortOrder &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class TasksCompanion extends UpdateCompanion<Task> {
  final Value<String> id;
  final Value<String> title;
  final Value<TaskTypeIndex> type;
  final Value<TaskStatusIndex> status;
  final Value<DateTime> targetDate;
  final Value<DateTime?> scheduledStart;
  final Value<int?> durationMinutes;
  final Value<String?> memo;
  final Value<String?> iconName;
  final Value<int?> colorValue;
  final Value<bool> isPinned;
  final Value<String?> routineId;
  final Value<int> snoozeCount;
  final Value<DateTime?> snoozedUntil;
  final Value<int> sortOrder;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const TasksCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.type = const Value.absent(),
    this.status = const Value.absent(),
    this.targetDate = const Value.absent(),
    this.scheduledStart = const Value.absent(),
    this.durationMinutes = const Value.absent(),
    this.memo = const Value.absent(),
    this.iconName = const Value.absent(),
    this.colorValue = const Value.absent(),
    this.isPinned = const Value.absent(),
    this.routineId = const Value.absent(),
    this.snoozeCount = const Value.absent(),
    this.snoozedUntil = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TasksCompanion.insert({
    required String id,
    required String title,
    required TaskTypeIndex type,
    required TaskStatusIndex status,
    required DateTime targetDate,
    this.scheduledStart = const Value.absent(),
    this.durationMinutes = const Value.absent(),
    this.memo = const Value.absent(),
    this.iconName = const Value.absent(),
    this.colorValue = const Value.absent(),
    this.isPinned = const Value.absent(),
    this.routineId = const Value.absent(),
    this.snoozeCount = const Value.absent(),
    this.snoozedUntil = const Value.absent(),
    this.sortOrder = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       type = Value(type),
       status = Value(status),
       targetDate = Value(targetDate),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<Task> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<int>? type,
    Expression<int>? status,
    Expression<DateTime>? targetDate,
    Expression<DateTime>? scheduledStart,
    Expression<int>? durationMinutes,
    Expression<String>? memo,
    Expression<String>? iconName,
    Expression<int>? colorValue,
    Expression<bool>? isPinned,
    Expression<String>? routineId,
    Expression<int>? snoozeCount,
    Expression<DateTime>? snoozedUntil,
    Expression<int>? sortOrder,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (type != null) 'type': type,
      if (status != null) 'status': status,
      if (targetDate != null) 'target_date': targetDate,
      if (scheduledStart != null) 'scheduled_start': scheduledStart,
      if (durationMinutes != null) 'duration_minutes': durationMinutes,
      if (memo != null) 'memo': memo,
      if (iconName != null) 'icon_name': iconName,
      if (colorValue != null) 'color_value': colorValue,
      if (isPinned != null) 'is_pinned': isPinned,
      if (routineId != null) 'routine_id': routineId,
      if (snoozeCount != null) 'snooze_count': snoozeCount,
      if (snoozedUntil != null) 'snoozed_until': snoozedUntil,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TasksCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<TaskTypeIndex>? type,
    Value<TaskStatusIndex>? status,
    Value<DateTime>? targetDate,
    Value<DateTime?>? scheduledStart,
    Value<int?>? durationMinutes,
    Value<String?>? memo,
    Value<String?>? iconName,
    Value<int?>? colorValue,
    Value<bool>? isPinned,
    Value<String?>? routineId,
    Value<int>? snoozeCount,
    Value<DateTime?>? snoozedUntil,
    Value<int>? sortOrder,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return TasksCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      type: type ?? this.type,
      status: status ?? this.status,
      targetDate: targetDate ?? this.targetDate,
      scheduledStart: scheduledStart ?? this.scheduledStart,
      durationMinutes: durationMinutes ?? this.durationMinutes,
      memo: memo ?? this.memo,
      iconName: iconName ?? this.iconName,
      colorValue: colorValue ?? this.colorValue,
      isPinned: isPinned ?? this.isPinned,
      routineId: routineId ?? this.routineId,
      snoozeCount: snoozeCount ?? this.snoozeCount,
      snoozedUntil: snoozedUntil ?? this.snoozedUntil,
      sortOrder: sortOrder ?? this.sortOrder,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (type.present) {
      map['type'] = Variable<int>($TasksTable.$convertertype.toSql(type.value));
    }
    if (status.present) {
      map['status'] = Variable<int>(
        $TasksTable.$converterstatus.toSql(status.value),
      );
    }
    if (targetDate.present) {
      map['target_date'] = Variable<DateTime>(targetDate.value);
    }
    if (scheduledStart.present) {
      map['scheduled_start'] = Variable<DateTime>(scheduledStart.value);
    }
    if (durationMinutes.present) {
      map['duration_minutes'] = Variable<int>(durationMinutes.value);
    }
    if (memo.present) {
      map['memo'] = Variable<String>(memo.value);
    }
    if (iconName.present) {
      map['icon_name'] = Variable<String>(iconName.value);
    }
    if (colorValue.present) {
      map['color_value'] = Variable<int>(colorValue.value);
    }
    if (isPinned.present) {
      map['is_pinned'] = Variable<bool>(isPinned.value);
    }
    if (routineId.present) {
      map['routine_id'] = Variable<String>(routineId.value);
    }
    if (snoozeCount.present) {
      map['snooze_count'] = Variable<int>(snoozeCount.value);
    }
    if (snoozedUntil.present) {
      map['snoozed_until'] = Variable<DateTime>(snoozedUntil.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TasksCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('type: $type, ')
          ..write('status: $status, ')
          ..write('targetDate: $targetDate, ')
          ..write('scheduledStart: $scheduledStart, ')
          ..write('durationMinutes: $durationMinutes, ')
          ..write('memo: $memo, ')
          ..write('iconName: $iconName, ')
          ..write('colorValue: $colorValue, ')
          ..write('isPinned: $isPinned, ')
          ..write('routineId: $routineId, ')
          ..write('snoozeCount: $snoozeCount, ')
          ..write('snoozedUntil: $snoozedUntil, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UserSettingsTableTable extends UserSettingsTable
    with TableInfo<$UserSettingsTableTable, UserSettingsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserSettingsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _wakeHourMeta = const VerificationMeta(
    'wakeHour',
  );
  @override
  late final GeneratedColumn<int> wakeHour = GeneratedColumn<int>(
    'wake_hour',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(7),
  );
  static const VerificationMeta _wakeMinuteMeta = const VerificationMeta(
    'wakeMinute',
  );
  @override
  late final GeneratedColumn<int> wakeMinute = GeneratedColumn<int>(
    'wake_minute',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _sleepHourMeta = const VerificationMeta(
    'sleepHour',
  );
  @override
  late final GeneratedColumn<int> sleepHour = GeneratedColumn<int>(
    'sleep_hour',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(23),
  );
  static const VerificationMeta _sleepMinuteMeta = const VerificationMeta(
    'sleepMinute',
  );
  @override
  late final GeneratedColumn<int> sleepMinute = GeneratedColumn<int>(
    'sleep_minute',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _reminderBeforeMinutesMeta =
      const VerificationMeta('reminderBeforeMinutes');
  @override
  late final GeneratedColumn<int> reminderBeforeMinutes = GeneratedColumn<int>(
    'reminder_before_minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(5),
  );
  static const VerificationMeta _snoozeMinutesMeta = const VerificationMeta(
    'snoozeMinutes',
  );
  @override
  late final GeneratedColumn<int> snoozeMinutes = GeneratedColumn<int>(
    'snooze_minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(15),
  );
  static const VerificationMeta _notificationsEnabledMeta =
      const VerificationMeta('notificationsEnabled');
  @override
  late final GeneratedColumn<bool> notificationsEnabled = GeneratedColumn<bool>(
    'notifications_enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("notifications_enabled" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    wakeHour,
    wakeMinute,
    sleepHour,
    sleepMinute,
    reminderBeforeMinutes,
    snoozeMinutes,
    notificationsEnabled,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_settings';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserSettingsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('wake_hour')) {
      context.handle(
        _wakeHourMeta,
        wakeHour.isAcceptableOrUnknown(data['wake_hour']!, _wakeHourMeta),
      );
    }
    if (data.containsKey('wake_minute')) {
      context.handle(
        _wakeMinuteMeta,
        wakeMinute.isAcceptableOrUnknown(data['wake_minute']!, _wakeMinuteMeta),
      );
    }
    if (data.containsKey('sleep_hour')) {
      context.handle(
        _sleepHourMeta,
        sleepHour.isAcceptableOrUnknown(data['sleep_hour']!, _sleepHourMeta),
      );
    }
    if (data.containsKey('sleep_minute')) {
      context.handle(
        _sleepMinuteMeta,
        sleepMinute.isAcceptableOrUnknown(
          data['sleep_minute']!,
          _sleepMinuteMeta,
        ),
      );
    }
    if (data.containsKey('reminder_before_minutes')) {
      context.handle(
        _reminderBeforeMinutesMeta,
        reminderBeforeMinutes.isAcceptableOrUnknown(
          data['reminder_before_minutes']!,
          _reminderBeforeMinutesMeta,
        ),
      );
    }
    if (data.containsKey('snooze_minutes')) {
      context.handle(
        _snoozeMinutesMeta,
        snoozeMinutes.isAcceptableOrUnknown(
          data['snooze_minutes']!,
          _snoozeMinutesMeta,
        ),
      );
    }
    if (data.containsKey('notifications_enabled')) {
      context.handle(
        _notificationsEnabledMeta,
        notificationsEnabled.isAcceptableOrUnknown(
          data['notifications_enabled']!,
          _notificationsEnabledMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserSettingsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserSettingsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      wakeHour: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}wake_hour'],
      )!,
      wakeMinute: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}wake_minute'],
      )!,
      sleepHour: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sleep_hour'],
      )!,
      sleepMinute: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sleep_minute'],
      )!,
      reminderBeforeMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}reminder_before_minutes'],
      )!,
      snoozeMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}snooze_minutes'],
      )!,
      notificationsEnabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}notifications_enabled'],
      )!,
    );
  }

  @override
  $UserSettingsTableTable createAlias(String alias) {
    return $UserSettingsTableTable(attachedDatabase, alias);
  }
}

class UserSettingsTableData extends DataClass
    implements Insertable<UserSettingsTableData> {
  final int id;
  final int wakeHour;
  final int wakeMinute;
  final int sleepHour;
  final int sleepMinute;
  final int reminderBeforeMinutes;
  final int snoozeMinutes;
  final bool notificationsEnabled;
  const UserSettingsTableData({
    required this.id,
    required this.wakeHour,
    required this.wakeMinute,
    required this.sleepHour,
    required this.sleepMinute,
    required this.reminderBeforeMinutes,
    required this.snoozeMinutes,
    required this.notificationsEnabled,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['wake_hour'] = Variable<int>(wakeHour);
    map['wake_minute'] = Variable<int>(wakeMinute);
    map['sleep_hour'] = Variable<int>(sleepHour);
    map['sleep_minute'] = Variable<int>(sleepMinute);
    map['reminder_before_minutes'] = Variable<int>(reminderBeforeMinutes);
    map['snooze_minutes'] = Variable<int>(snoozeMinutes);
    map['notifications_enabled'] = Variable<bool>(notificationsEnabled);
    return map;
  }

  UserSettingsTableCompanion toCompanion(bool nullToAbsent) {
    return UserSettingsTableCompanion(
      id: Value(id),
      wakeHour: Value(wakeHour),
      wakeMinute: Value(wakeMinute),
      sleepHour: Value(sleepHour),
      sleepMinute: Value(sleepMinute),
      reminderBeforeMinutes: Value(reminderBeforeMinutes),
      snoozeMinutes: Value(snoozeMinutes),
      notificationsEnabled: Value(notificationsEnabled),
    );
  }

  factory UserSettingsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserSettingsTableData(
      id: serializer.fromJson<int>(json['id']),
      wakeHour: serializer.fromJson<int>(json['wakeHour']),
      wakeMinute: serializer.fromJson<int>(json['wakeMinute']),
      sleepHour: serializer.fromJson<int>(json['sleepHour']),
      sleepMinute: serializer.fromJson<int>(json['sleepMinute']),
      reminderBeforeMinutes: serializer.fromJson<int>(
        json['reminderBeforeMinutes'],
      ),
      snoozeMinutes: serializer.fromJson<int>(json['snoozeMinutes']),
      notificationsEnabled: serializer.fromJson<bool>(
        json['notificationsEnabled'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'wakeHour': serializer.toJson<int>(wakeHour),
      'wakeMinute': serializer.toJson<int>(wakeMinute),
      'sleepHour': serializer.toJson<int>(sleepHour),
      'sleepMinute': serializer.toJson<int>(sleepMinute),
      'reminderBeforeMinutes': serializer.toJson<int>(reminderBeforeMinutes),
      'snoozeMinutes': serializer.toJson<int>(snoozeMinutes),
      'notificationsEnabled': serializer.toJson<bool>(notificationsEnabled),
    };
  }

  UserSettingsTableData copyWith({
    int? id,
    int? wakeHour,
    int? wakeMinute,
    int? sleepHour,
    int? sleepMinute,
    int? reminderBeforeMinutes,
    int? snoozeMinutes,
    bool? notificationsEnabled,
  }) => UserSettingsTableData(
    id: id ?? this.id,
    wakeHour: wakeHour ?? this.wakeHour,
    wakeMinute: wakeMinute ?? this.wakeMinute,
    sleepHour: sleepHour ?? this.sleepHour,
    sleepMinute: sleepMinute ?? this.sleepMinute,
    reminderBeforeMinutes: reminderBeforeMinutes ?? this.reminderBeforeMinutes,
    snoozeMinutes: snoozeMinutes ?? this.snoozeMinutes,
    notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
  );
  UserSettingsTableData copyWithCompanion(UserSettingsTableCompanion data) {
    return UserSettingsTableData(
      id: data.id.present ? data.id.value : this.id,
      wakeHour: data.wakeHour.present ? data.wakeHour.value : this.wakeHour,
      wakeMinute: data.wakeMinute.present
          ? data.wakeMinute.value
          : this.wakeMinute,
      sleepHour: data.sleepHour.present ? data.sleepHour.value : this.sleepHour,
      sleepMinute: data.sleepMinute.present
          ? data.sleepMinute.value
          : this.sleepMinute,
      reminderBeforeMinutes: data.reminderBeforeMinutes.present
          ? data.reminderBeforeMinutes.value
          : this.reminderBeforeMinutes,
      snoozeMinutes: data.snoozeMinutes.present
          ? data.snoozeMinutes.value
          : this.snoozeMinutes,
      notificationsEnabled: data.notificationsEnabled.present
          ? data.notificationsEnabled.value
          : this.notificationsEnabled,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserSettingsTableData(')
          ..write('id: $id, ')
          ..write('wakeHour: $wakeHour, ')
          ..write('wakeMinute: $wakeMinute, ')
          ..write('sleepHour: $sleepHour, ')
          ..write('sleepMinute: $sleepMinute, ')
          ..write('reminderBeforeMinutes: $reminderBeforeMinutes, ')
          ..write('snoozeMinutes: $snoozeMinutes, ')
          ..write('notificationsEnabled: $notificationsEnabled')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    wakeHour,
    wakeMinute,
    sleepHour,
    sleepMinute,
    reminderBeforeMinutes,
    snoozeMinutes,
    notificationsEnabled,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserSettingsTableData &&
          other.id == this.id &&
          other.wakeHour == this.wakeHour &&
          other.wakeMinute == this.wakeMinute &&
          other.sleepHour == this.sleepHour &&
          other.sleepMinute == this.sleepMinute &&
          other.reminderBeforeMinutes == this.reminderBeforeMinutes &&
          other.snoozeMinutes == this.snoozeMinutes &&
          other.notificationsEnabled == this.notificationsEnabled);
}

class UserSettingsTableCompanion
    extends UpdateCompanion<UserSettingsTableData> {
  final Value<int> id;
  final Value<int> wakeHour;
  final Value<int> wakeMinute;
  final Value<int> sleepHour;
  final Value<int> sleepMinute;
  final Value<int> reminderBeforeMinutes;
  final Value<int> snoozeMinutes;
  final Value<bool> notificationsEnabled;
  const UserSettingsTableCompanion({
    this.id = const Value.absent(),
    this.wakeHour = const Value.absent(),
    this.wakeMinute = const Value.absent(),
    this.sleepHour = const Value.absent(),
    this.sleepMinute = const Value.absent(),
    this.reminderBeforeMinutes = const Value.absent(),
    this.snoozeMinutes = const Value.absent(),
    this.notificationsEnabled = const Value.absent(),
  });
  UserSettingsTableCompanion.insert({
    this.id = const Value.absent(),
    this.wakeHour = const Value.absent(),
    this.wakeMinute = const Value.absent(),
    this.sleepHour = const Value.absent(),
    this.sleepMinute = const Value.absent(),
    this.reminderBeforeMinutes = const Value.absent(),
    this.snoozeMinutes = const Value.absent(),
    this.notificationsEnabled = const Value.absent(),
  });
  static Insertable<UserSettingsTableData> custom({
    Expression<int>? id,
    Expression<int>? wakeHour,
    Expression<int>? wakeMinute,
    Expression<int>? sleepHour,
    Expression<int>? sleepMinute,
    Expression<int>? reminderBeforeMinutes,
    Expression<int>? snoozeMinutes,
    Expression<bool>? notificationsEnabled,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (wakeHour != null) 'wake_hour': wakeHour,
      if (wakeMinute != null) 'wake_minute': wakeMinute,
      if (sleepHour != null) 'sleep_hour': sleepHour,
      if (sleepMinute != null) 'sleep_minute': sleepMinute,
      if (reminderBeforeMinutes != null)
        'reminder_before_minutes': reminderBeforeMinutes,
      if (snoozeMinutes != null) 'snooze_minutes': snoozeMinutes,
      if (notificationsEnabled != null)
        'notifications_enabled': notificationsEnabled,
    });
  }

  UserSettingsTableCompanion copyWith({
    Value<int>? id,
    Value<int>? wakeHour,
    Value<int>? wakeMinute,
    Value<int>? sleepHour,
    Value<int>? sleepMinute,
    Value<int>? reminderBeforeMinutes,
    Value<int>? snoozeMinutes,
    Value<bool>? notificationsEnabled,
  }) {
    return UserSettingsTableCompanion(
      id: id ?? this.id,
      wakeHour: wakeHour ?? this.wakeHour,
      wakeMinute: wakeMinute ?? this.wakeMinute,
      sleepHour: sleepHour ?? this.sleepHour,
      sleepMinute: sleepMinute ?? this.sleepMinute,
      reminderBeforeMinutes:
          reminderBeforeMinutes ?? this.reminderBeforeMinutes,
      snoozeMinutes: snoozeMinutes ?? this.snoozeMinutes,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (wakeHour.present) {
      map['wake_hour'] = Variable<int>(wakeHour.value);
    }
    if (wakeMinute.present) {
      map['wake_minute'] = Variable<int>(wakeMinute.value);
    }
    if (sleepHour.present) {
      map['sleep_hour'] = Variable<int>(sleepHour.value);
    }
    if (sleepMinute.present) {
      map['sleep_minute'] = Variable<int>(sleepMinute.value);
    }
    if (reminderBeforeMinutes.present) {
      map['reminder_before_minutes'] = Variable<int>(
        reminderBeforeMinutes.value,
      );
    }
    if (snoozeMinutes.present) {
      map['snooze_minutes'] = Variable<int>(snoozeMinutes.value);
    }
    if (notificationsEnabled.present) {
      map['notifications_enabled'] = Variable<bool>(notificationsEnabled.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserSettingsTableCompanion(')
          ..write('id: $id, ')
          ..write('wakeHour: $wakeHour, ')
          ..write('wakeMinute: $wakeMinute, ')
          ..write('sleepHour: $sleepHour, ')
          ..write('sleepMinute: $sleepMinute, ')
          ..write('reminderBeforeMinutes: $reminderBeforeMinutes, ')
          ..write('snoozeMinutes: $snoozeMinutes, ')
          ..write('notificationsEnabled: $notificationsEnabled')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TasksTable tasks = $TasksTable(this);
  late final $UserSettingsTableTable userSettingsTable =
      $UserSettingsTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    tasks,
    userSettingsTable,
  ];
}

typedef $$TasksTableCreateCompanionBuilder =
    TasksCompanion Function({
      required String id,
      required String title,
      required TaskTypeIndex type,
      required TaskStatusIndex status,
      required DateTime targetDate,
      Value<DateTime?> scheduledStart,
      Value<int?> durationMinutes,
      Value<String?> memo,
      Value<String?> iconName,
      Value<int?> colorValue,
      Value<bool> isPinned,
      Value<String?> routineId,
      Value<int> snoozeCount,
      Value<DateTime?> snoozedUntil,
      Value<int> sortOrder,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$TasksTableUpdateCompanionBuilder =
    TasksCompanion Function({
      Value<String> id,
      Value<String> title,
      Value<TaskTypeIndex> type,
      Value<TaskStatusIndex> status,
      Value<DateTime> targetDate,
      Value<DateTime?> scheduledStart,
      Value<int?> durationMinutes,
      Value<String?> memo,
      Value<String?> iconName,
      Value<int?> colorValue,
      Value<bool> isPinned,
      Value<String?> routineId,
      Value<int> snoozeCount,
      Value<DateTime?> snoozedUntil,
      Value<int> sortOrder,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$TasksTableFilterComposer extends Composer<_$AppDatabase, $TasksTable> {
  $$TasksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<TaskTypeIndex, TaskTypeIndex, int> get type =>
      $composableBuilder(
        column: $table.type,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<TaskStatusIndex, TaskStatusIndex, int>
  get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get targetDate => $composableBuilder(
    column: $table.targetDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get scheduledStart => $composableBuilder(
    column: $table.scheduledStart,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get durationMinutes => $composableBuilder(
    column: $table.durationMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get memo => $composableBuilder(
    column: $table.memo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get iconName => $composableBuilder(
    column: $table.iconName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get colorValue => $composableBuilder(
    column: $table.colorValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isPinned => $composableBuilder(
    column: $table.isPinned,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get routineId => $composableBuilder(
    column: $table.routineId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get snoozeCount => $composableBuilder(
    column: $table.snoozeCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get snoozedUntil => $composableBuilder(
    column: $table.snoozedUntil,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TasksTableOrderingComposer
    extends Composer<_$AppDatabase, $TasksTable> {
  $$TasksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get targetDate => $composableBuilder(
    column: $table.targetDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get scheduledStart => $composableBuilder(
    column: $table.scheduledStart,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get durationMinutes => $composableBuilder(
    column: $table.durationMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get memo => $composableBuilder(
    column: $table.memo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get iconName => $composableBuilder(
    column: $table.iconName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get colorValue => $composableBuilder(
    column: $table.colorValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isPinned => $composableBuilder(
    column: $table.isPinned,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get routineId => $composableBuilder(
    column: $table.routineId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get snoozeCount => $composableBuilder(
    column: $table.snoozeCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get snoozedUntil => $composableBuilder(
    column: $table.snoozedUntil,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TasksTableAnnotationComposer
    extends Composer<_$AppDatabase, $TasksTable> {
  $$TasksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumnWithTypeConverter<TaskTypeIndex, int> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumnWithTypeConverter<TaskStatusIndex, int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get targetDate => $composableBuilder(
    column: $table.targetDate,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get scheduledStart => $composableBuilder(
    column: $table.scheduledStart,
    builder: (column) => column,
  );

  GeneratedColumn<int> get durationMinutes => $composableBuilder(
    column: $table.durationMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get memo =>
      $composableBuilder(column: $table.memo, builder: (column) => column);

  GeneratedColumn<String> get iconName =>
      $composableBuilder(column: $table.iconName, builder: (column) => column);

  GeneratedColumn<int> get colorValue => $composableBuilder(
    column: $table.colorValue,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isPinned =>
      $composableBuilder(column: $table.isPinned, builder: (column) => column);

  GeneratedColumn<String> get routineId =>
      $composableBuilder(column: $table.routineId, builder: (column) => column);

  GeneratedColumn<int> get snoozeCount => $composableBuilder(
    column: $table.snoozeCount,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get snoozedUntil => $composableBuilder(
    column: $table.snoozedUntil,
    builder: (column) => column,
  );

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$TasksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TasksTable,
          Task,
          $$TasksTableFilterComposer,
          $$TasksTableOrderingComposer,
          $$TasksTableAnnotationComposer,
          $$TasksTableCreateCompanionBuilder,
          $$TasksTableUpdateCompanionBuilder,
          (Task, BaseReferences<_$AppDatabase, $TasksTable, Task>),
          Task,
          PrefetchHooks Function()
        > {
  $$TasksTableTableManager(_$AppDatabase db, $TasksTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TasksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TasksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TasksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<TaskTypeIndex> type = const Value.absent(),
                Value<TaskStatusIndex> status = const Value.absent(),
                Value<DateTime> targetDate = const Value.absent(),
                Value<DateTime?> scheduledStart = const Value.absent(),
                Value<int?> durationMinutes = const Value.absent(),
                Value<String?> memo = const Value.absent(),
                Value<String?> iconName = const Value.absent(),
                Value<int?> colorValue = const Value.absent(),
                Value<bool> isPinned = const Value.absent(),
                Value<String?> routineId = const Value.absent(),
                Value<int> snoozeCount = const Value.absent(),
                Value<DateTime?> snoozedUntil = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TasksCompanion(
                id: id,
                title: title,
                type: type,
                status: status,
                targetDate: targetDate,
                scheduledStart: scheduledStart,
                durationMinutes: durationMinutes,
                memo: memo,
                iconName: iconName,
                colorValue: colorValue,
                isPinned: isPinned,
                routineId: routineId,
                snoozeCount: snoozeCount,
                snoozedUntil: snoozedUntil,
                sortOrder: sortOrder,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                required TaskTypeIndex type,
                required TaskStatusIndex status,
                required DateTime targetDate,
                Value<DateTime?> scheduledStart = const Value.absent(),
                Value<int?> durationMinutes = const Value.absent(),
                Value<String?> memo = const Value.absent(),
                Value<String?> iconName = const Value.absent(),
                Value<int?> colorValue = const Value.absent(),
                Value<bool> isPinned = const Value.absent(),
                Value<String?> routineId = const Value.absent(),
                Value<int> snoozeCount = const Value.absent(),
                Value<DateTime?> snoozedUntil = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => TasksCompanion.insert(
                id: id,
                title: title,
                type: type,
                status: status,
                targetDate: targetDate,
                scheduledStart: scheduledStart,
                durationMinutes: durationMinutes,
                memo: memo,
                iconName: iconName,
                colorValue: colorValue,
                isPinned: isPinned,
                routineId: routineId,
                snoozeCount: snoozeCount,
                snoozedUntil: snoozedUntil,
                sortOrder: sortOrder,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TasksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TasksTable,
      Task,
      $$TasksTableFilterComposer,
      $$TasksTableOrderingComposer,
      $$TasksTableAnnotationComposer,
      $$TasksTableCreateCompanionBuilder,
      $$TasksTableUpdateCompanionBuilder,
      (Task, BaseReferences<_$AppDatabase, $TasksTable, Task>),
      Task,
      PrefetchHooks Function()
    >;
typedef $$UserSettingsTableTableCreateCompanionBuilder =
    UserSettingsTableCompanion Function({
      Value<int> id,
      Value<int> wakeHour,
      Value<int> wakeMinute,
      Value<int> sleepHour,
      Value<int> sleepMinute,
      Value<int> reminderBeforeMinutes,
      Value<int> snoozeMinutes,
      Value<bool> notificationsEnabled,
    });
typedef $$UserSettingsTableTableUpdateCompanionBuilder =
    UserSettingsTableCompanion Function({
      Value<int> id,
      Value<int> wakeHour,
      Value<int> wakeMinute,
      Value<int> sleepHour,
      Value<int> sleepMinute,
      Value<int> reminderBeforeMinutes,
      Value<int> snoozeMinutes,
      Value<bool> notificationsEnabled,
    });

class $$UserSettingsTableTableFilterComposer
    extends Composer<_$AppDatabase, $UserSettingsTableTable> {
  $$UserSettingsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get wakeHour => $composableBuilder(
    column: $table.wakeHour,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get wakeMinute => $composableBuilder(
    column: $table.wakeMinute,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sleepHour => $composableBuilder(
    column: $table.sleepHour,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sleepMinute => $composableBuilder(
    column: $table.sleepMinute,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get reminderBeforeMinutes => $composableBuilder(
    column: $table.reminderBeforeMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get snoozeMinutes => $composableBuilder(
    column: $table.snoozeMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get notificationsEnabled => $composableBuilder(
    column: $table.notificationsEnabled,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UserSettingsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $UserSettingsTableTable> {
  $$UserSettingsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get wakeHour => $composableBuilder(
    column: $table.wakeHour,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get wakeMinute => $composableBuilder(
    column: $table.wakeMinute,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sleepHour => $composableBuilder(
    column: $table.sleepHour,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sleepMinute => $composableBuilder(
    column: $table.sleepMinute,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get reminderBeforeMinutes => $composableBuilder(
    column: $table.reminderBeforeMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get snoozeMinutes => $composableBuilder(
    column: $table.snoozeMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get notificationsEnabled => $composableBuilder(
    column: $table.notificationsEnabled,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UserSettingsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserSettingsTableTable> {
  $$UserSettingsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get wakeHour =>
      $composableBuilder(column: $table.wakeHour, builder: (column) => column);

  GeneratedColumn<int> get wakeMinute => $composableBuilder(
    column: $table.wakeMinute,
    builder: (column) => column,
  );

  GeneratedColumn<int> get sleepHour =>
      $composableBuilder(column: $table.sleepHour, builder: (column) => column);

  GeneratedColumn<int> get sleepMinute => $composableBuilder(
    column: $table.sleepMinute,
    builder: (column) => column,
  );

  GeneratedColumn<int> get reminderBeforeMinutes => $composableBuilder(
    column: $table.reminderBeforeMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<int> get snoozeMinutes => $composableBuilder(
    column: $table.snoozeMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get notificationsEnabled => $composableBuilder(
    column: $table.notificationsEnabled,
    builder: (column) => column,
  );
}

class $$UserSettingsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserSettingsTableTable,
          UserSettingsTableData,
          $$UserSettingsTableTableFilterComposer,
          $$UserSettingsTableTableOrderingComposer,
          $$UserSettingsTableTableAnnotationComposer,
          $$UserSettingsTableTableCreateCompanionBuilder,
          $$UserSettingsTableTableUpdateCompanionBuilder,
          (
            UserSettingsTableData,
            BaseReferences<
              _$AppDatabase,
              $UserSettingsTableTable,
              UserSettingsTableData
            >,
          ),
          UserSettingsTableData,
          PrefetchHooks Function()
        > {
  $$UserSettingsTableTableTableManager(
    _$AppDatabase db,
    $UserSettingsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserSettingsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserSettingsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserSettingsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> wakeHour = const Value.absent(),
                Value<int> wakeMinute = const Value.absent(),
                Value<int> sleepHour = const Value.absent(),
                Value<int> sleepMinute = const Value.absent(),
                Value<int> reminderBeforeMinutes = const Value.absent(),
                Value<int> snoozeMinutes = const Value.absent(),
                Value<bool> notificationsEnabled = const Value.absent(),
              }) => UserSettingsTableCompanion(
                id: id,
                wakeHour: wakeHour,
                wakeMinute: wakeMinute,
                sleepHour: sleepHour,
                sleepMinute: sleepMinute,
                reminderBeforeMinutes: reminderBeforeMinutes,
                snoozeMinutes: snoozeMinutes,
                notificationsEnabled: notificationsEnabled,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> wakeHour = const Value.absent(),
                Value<int> wakeMinute = const Value.absent(),
                Value<int> sleepHour = const Value.absent(),
                Value<int> sleepMinute = const Value.absent(),
                Value<int> reminderBeforeMinutes = const Value.absent(),
                Value<int> snoozeMinutes = const Value.absent(),
                Value<bool> notificationsEnabled = const Value.absent(),
              }) => UserSettingsTableCompanion.insert(
                id: id,
                wakeHour: wakeHour,
                wakeMinute: wakeMinute,
                sleepHour: sleepHour,
                sleepMinute: sleepMinute,
                reminderBeforeMinutes: reminderBeforeMinutes,
                snoozeMinutes: snoozeMinutes,
                notificationsEnabled: notificationsEnabled,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UserSettingsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserSettingsTableTable,
      UserSettingsTableData,
      $$UserSettingsTableTableFilterComposer,
      $$UserSettingsTableTableOrderingComposer,
      $$UserSettingsTableTableAnnotationComposer,
      $$UserSettingsTableTableCreateCompanionBuilder,
      $$UserSettingsTableTableUpdateCompanionBuilder,
      (
        UserSettingsTableData,
        BaseReferences<
          _$AppDatabase,
          $UserSettingsTableTable,
          UserSettingsTableData
        >,
      ),
      UserSettingsTableData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TasksTableTableManager get tasks =>
      $$TasksTableTableManager(_db, _db.tasks);
  $$UserSettingsTableTableTableManager get userSettingsTable =>
      $$UserSettingsTableTableTableManager(_db, _db.userSettingsTable);
}
