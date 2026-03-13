// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$Task {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  TaskType get type => throw _privateConstructorUsedError;
  TaskStatus get status => throw _privateConstructorUsedError;
  DateTime get targetDate => throw _privateConstructorUsedError;
  DateTime? get scheduledStart => throw _privateConstructorUsedError;
  int? get durationMinutes => throw _privateConstructorUsedError;
  String? get memo => throw _privateConstructorUsedError;
  String? get iconName => throw _privateConstructorUsedError;
  int? get colorValue => throw _privateConstructorUsedError;
  bool get isPinned => throw _privateConstructorUsedError;
  String? get routineId => throw _privateConstructorUsedError;
  int get snoozeCount => throw _privateConstructorUsedError;
  DateTime? get snoozedUntil => throw _privateConstructorUsedError;
  int get sortOrder => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskCopyWith<Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res, Task>;
  @useResult
  $Res call({
    String id,
    String title,
    TaskType type,
    TaskStatus status,
    DateTime targetDate,
    DateTime? scheduledStart,
    int? durationMinutes,
    String? memo,
    String? iconName,
    int? colorValue,
    bool isPinned,
    String? routineId,
    int snoozeCount,
    DateTime? snoozedUntil,
    int sortOrder,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class _$TaskCopyWithImpl<$Res, $Val extends Task>
    implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? type = null,
    Object? status = null,
    Object? targetDate = null,
    Object? scheduledStart = freezed,
    Object? durationMinutes = freezed,
    Object? memo = freezed,
    Object? iconName = freezed,
    Object? colorValue = freezed,
    Object? isPinned = null,
    Object? routineId = freezed,
    Object? snoozeCount = null,
    Object? snoozedUntil = freezed,
    Object? sortOrder = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as TaskType,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as TaskStatus,
            targetDate: null == targetDate
                ? _value.targetDate
                : targetDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            scheduledStart: freezed == scheduledStart
                ? _value.scheduledStart
                : scheduledStart // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            durationMinutes: freezed == durationMinutes
                ? _value.durationMinutes
                : durationMinutes // ignore: cast_nullable_to_non_nullable
                      as int?,
            memo: freezed == memo
                ? _value.memo
                : memo // ignore: cast_nullable_to_non_nullable
                      as String?,
            iconName: freezed == iconName
                ? _value.iconName
                : iconName // ignore: cast_nullable_to_non_nullable
                      as String?,
            colorValue: freezed == colorValue
                ? _value.colorValue
                : colorValue // ignore: cast_nullable_to_non_nullable
                      as int?,
            isPinned: null == isPinned
                ? _value.isPinned
                : isPinned // ignore: cast_nullable_to_non_nullable
                      as bool,
            routineId: freezed == routineId
                ? _value.routineId
                : routineId // ignore: cast_nullable_to_non_nullable
                      as String?,
            snoozeCount: null == snoozeCount
                ? _value.snoozeCount
                : snoozeCount // ignore: cast_nullable_to_non_nullable
                      as int,
            snoozedUntil: freezed == snoozedUntil
                ? _value.snoozedUntil
                : snoozedUntil // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            sortOrder: null == sortOrder
                ? _value.sortOrder
                : sortOrder // ignore: cast_nullable_to_non_nullable
                      as int,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TaskImplCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$$TaskImplCopyWith(
    _$TaskImpl value,
    $Res Function(_$TaskImpl) then,
  ) = __$$TaskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    TaskType type,
    TaskStatus status,
    DateTime targetDate,
    DateTime? scheduledStart,
    int? durationMinutes,
    String? memo,
    String? iconName,
    int? colorValue,
    bool isPinned,
    String? routineId,
    int snoozeCount,
    DateTime? snoozedUntil,
    int sortOrder,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class __$$TaskImplCopyWithImpl<$Res>
    extends _$TaskCopyWithImpl<$Res, _$TaskImpl>
    implements _$$TaskImplCopyWith<$Res> {
  __$$TaskImplCopyWithImpl(_$TaskImpl _value, $Res Function(_$TaskImpl) _then)
    : super(_value, _then);

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? type = null,
    Object? status = null,
    Object? targetDate = null,
    Object? scheduledStart = freezed,
    Object? durationMinutes = freezed,
    Object? memo = freezed,
    Object? iconName = freezed,
    Object? colorValue = freezed,
    Object? isPinned = null,
    Object? routineId = freezed,
    Object? snoozeCount = null,
    Object? snoozedUntil = freezed,
    Object? sortOrder = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$TaskImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as TaskType,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as TaskStatus,
        targetDate: null == targetDate
            ? _value.targetDate
            : targetDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        scheduledStart: freezed == scheduledStart
            ? _value.scheduledStart
            : scheduledStart // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        durationMinutes: freezed == durationMinutes
            ? _value.durationMinutes
            : durationMinutes // ignore: cast_nullable_to_non_nullable
                  as int?,
        memo: freezed == memo
            ? _value.memo
            : memo // ignore: cast_nullable_to_non_nullable
                  as String?,
        iconName: freezed == iconName
            ? _value.iconName
            : iconName // ignore: cast_nullable_to_non_nullable
                  as String?,
        colorValue: freezed == colorValue
            ? _value.colorValue
            : colorValue // ignore: cast_nullable_to_non_nullable
                  as int?,
        isPinned: null == isPinned
            ? _value.isPinned
            : isPinned // ignore: cast_nullable_to_non_nullable
                  as bool,
        routineId: freezed == routineId
            ? _value.routineId
            : routineId // ignore: cast_nullable_to_non_nullable
                  as String?,
        snoozeCount: null == snoozeCount
            ? _value.snoozeCount
            : snoozeCount // ignore: cast_nullable_to_non_nullable
                  as int,
        snoozedUntil: freezed == snoozedUntil
            ? _value.snoozedUntil
            : snoozedUntil // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        sortOrder: null == sortOrder
            ? _value.sortOrder
            : sortOrder // ignore: cast_nullable_to_non_nullable
                  as int,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc

class _$TaskImpl implements _Task {
  const _$TaskImpl({
    required this.id,
    required this.title,
    required this.type,
    this.status = TaskStatus.pending,
    required this.targetDate,
    this.scheduledStart,
    this.durationMinutes,
    this.memo,
    this.iconName,
    this.colorValue,
    this.isPinned = false,
    this.routineId,
    this.snoozeCount = 0,
    this.snoozedUntil,
    this.sortOrder = 0,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  final String id;
  @override
  final String title;
  @override
  final TaskType type;
  @override
  @JsonKey()
  final TaskStatus status;
  @override
  final DateTime targetDate;
  @override
  final DateTime? scheduledStart;
  @override
  final int? durationMinutes;
  @override
  final String? memo;
  @override
  final String? iconName;
  @override
  final int? colorValue;
  @override
  @JsonKey()
  final bool isPinned;
  @override
  final String? routineId;
  @override
  @JsonKey()
  final int snoozeCount;
  @override
  final DateTime? snoozedUntil;
  @override
  @JsonKey()
  final int sortOrder;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Task(id: $id, title: $title, type: $type, status: $status, targetDate: $targetDate, scheduledStart: $scheduledStart, durationMinutes: $durationMinutes, memo: $memo, iconName: $iconName, colorValue: $colorValue, isPinned: $isPinned, routineId: $routineId, snoozeCount: $snoozeCount, snoozedUntil: $snoozedUntil, sortOrder: $sortOrder, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.targetDate, targetDate) ||
                other.targetDate == targetDate) &&
            (identical(other.scheduledStart, scheduledStart) ||
                other.scheduledStart == scheduledStart) &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes) &&
            (identical(other.memo, memo) || other.memo == memo) &&
            (identical(other.iconName, iconName) ||
                other.iconName == iconName) &&
            (identical(other.colorValue, colorValue) ||
                other.colorValue == colorValue) &&
            (identical(other.isPinned, isPinned) ||
                other.isPinned == isPinned) &&
            (identical(other.routineId, routineId) ||
                other.routineId == routineId) &&
            (identical(other.snoozeCount, snoozeCount) ||
                other.snoozeCount == snoozeCount) &&
            (identical(other.snoozedUntil, snoozedUntil) ||
                other.snoozedUntil == snoozedUntil) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
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

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      __$$TaskImplCopyWithImpl<_$TaskImpl>(this, _$identity);
}

abstract class _Task implements Task {
  const factory _Task({
    required final String id,
    required final String title,
    required final TaskType type,
    final TaskStatus status,
    required final DateTime targetDate,
    final DateTime? scheduledStart,
    final int? durationMinutes,
    final String? memo,
    final String? iconName,
    final int? colorValue,
    final bool isPinned,
    final String? routineId,
    final int snoozeCount,
    final DateTime? snoozedUntil,
    final int sortOrder,
    required final DateTime createdAt,
    required final DateTime updatedAt,
  }) = _$TaskImpl;

  @override
  String get id;
  @override
  String get title;
  @override
  TaskType get type;
  @override
  TaskStatus get status;
  @override
  DateTime get targetDate;
  @override
  DateTime? get scheduledStart;
  @override
  int? get durationMinutes;
  @override
  String? get memo;
  @override
  String? get iconName;
  @override
  int? get colorValue;
  @override
  bool get isPinned;
  @override
  String? get routineId;
  @override
  int get snoozeCount;
  @override
  DateTime? get snoozedUntil;
  @override
  int get sortOrder;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
