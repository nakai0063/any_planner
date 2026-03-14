// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$UserSettings {
  TimeOfDay get wakeTime => throw _privateConstructorUsedError;
  TimeOfDay get sleepTime => throw _privateConstructorUsedError;
  int get reminderBeforeMinutes => throw _privateConstructorUsedError;
  int get snoozeMinutes => throw _privateConstructorUsedError;
  bool get notificationsEnabled => throw _privateConstructorUsedError;
  String get themeId => throw _privateConstructorUsedError;
  String get darkMode => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;
  int get firstDayOfWeek => throw _privateConstructorUsedError;
  int get incompleteReminderDelay => throw _privateConstructorUsedError;
  bool get calendarSyncEnabled => throw _privateConstructorUsedError;
  int get allDayNotificationHour => throw _privateConstructorUsedError;
  int get allDayNotificationMinute => throw _privateConstructorUsedError;

  /// Create a copy of UserSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserSettingsCopyWith<UserSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSettingsCopyWith<$Res> {
  factory $UserSettingsCopyWith(
    UserSettings value,
    $Res Function(UserSettings) then,
  ) = _$UserSettingsCopyWithImpl<$Res, UserSettings>;
  @useResult
  $Res call({
    TimeOfDay wakeTime,
    TimeOfDay sleepTime,
    int reminderBeforeMinutes,
    int snoozeMinutes,
    bool notificationsEnabled,
    String themeId,
    String darkMode,
    String language,
    int firstDayOfWeek,
    int incompleteReminderDelay,
    bool calendarSyncEnabled,
    int allDayNotificationHour,
    int allDayNotificationMinute,
  });
}

/// @nodoc
class _$UserSettingsCopyWithImpl<$Res, $Val extends UserSettings>
    implements $UserSettingsCopyWith<$Res> {
  _$UserSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wakeTime = null,
    Object? sleepTime = null,
    Object? reminderBeforeMinutes = null,
    Object? snoozeMinutes = null,
    Object? notificationsEnabled = null,
    Object? themeId = null,
    Object? darkMode = null,
    Object? language = null,
    Object? firstDayOfWeek = null,
    Object? incompleteReminderDelay = null,
    Object? calendarSyncEnabled = null,
    Object? allDayNotificationHour = null,
    Object? allDayNotificationMinute = null,
  }) {
    return _then(
      _value.copyWith(
            wakeTime: null == wakeTime
                ? _value.wakeTime
                : wakeTime // ignore: cast_nullable_to_non_nullable
                      as TimeOfDay,
            sleepTime: null == sleepTime
                ? _value.sleepTime
                : sleepTime // ignore: cast_nullable_to_non_nullable
                      as TimeOfDay,
            reminderBeforeMinutes: null == reminderBeforeMinutes
                ? _value.reminderBeforeMinutes
                : reminderBeforeMinutes // ignore: cast_nullable_to_non_nullable
                      as int,
            snoozeMinutes: null == snoozeMinutes
                ? _value.snoozeMinutes
                : snoozeMinutes // ignore: cast_nullable_to_non_nullable
                      as int,
            notificationsEnabled: null == notificationsEnabled
                ? _value.notificationsEnabled
                : notificationsEnabled // ignore: cast_nullable_to_non_nullable
                      as bool,
            themeId: null == themeId
                ? _value.themeId
                : themeId // ignore: cast_nullable_to_non_nullable
                      as String,
            darkMode: null == darkMode
                ? _value.darkMode
                : darkMode // ignore: cast_nullable_to_non_nullable
                      as String,
            language: null == language
                ? _value.language
                : language // ignore: cast_nullable_to_non_nullable
                      as String,
            firstDayOfWeek: null == firstDayOfWeek
                ? _value.firstDayOfWeek
                : firstDayOfWeek // ignore: cast_nullable_to_non_nullable
                      as int,
            incompleteReminderDelay: null == incompleteReminderDelay
                ? _value.incompleteReminderDelay
                : incompleteReminderDelay // ignore: cast_nullable_to_non_nullable
                      as int,
            calendarSyncEnabled: null == calendarSyncEnabled
                ? _value.calendarSyncEnabled
                : calendarSyncEnabled // ignore: cast_nullable_to_non_nullable
                      as bool,
            allDayNotificationHour: null == allDayNotificationHour
                ? _value.allDayNotificationHour
                : allDayNotificationHour // ignore: cast_nullable_to_non_nullable
                      as int,
            allDayNotificationMinute: null == allDayNotificationMinute
                ? _value.allDayNotificationMinute
                : allDayNotificationMinute // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserSettingsImplCopyWith<$Res>
    implements $UserSettingsCopyWith<$Res> {
  factory _$$UserSettingsImplCopyWith(
    _$UserSettingsImpl value,
    $Res Function(_$UserSettingsImpl) then,
  ) = __$$UserSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    TimeOfDay wakeTime,
    TimeOfDay sleepTime,
    int reminderBeforeMinutes,
    int snoozeMinutes,
    bool notificationsEnabled,
    String themeId,
    String darkMode,
    String language,
    int firstDayOfWeek,
    int incompleteReminderDelay,
    bool calendarSyncEnabled,
    int allDayNotificationHour,
    int allDayNotificationMinute,
  });
}

/// @nodoc
class __$$UserSettingsImplCopyWithImpl<$Res>
    extends _$UserSettingsCopyWithImpl<$Res, _$UserSettingsImpl>
    implements _$$UserSettingsImplCopyWith<$Res> {
  __$$UserSettingsImplCopyWithImpl(
    _$UserSettingsImpl _value,
    $Res Function(_$UserSettingsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wakeTime = null,
    Object? sleepTime = null,
    Object? reminderBeforeMinutes = null,
    Object? snoozeMinutes = null,
    Object? notificationsEnabled = null,
    Object? themeId = null,
    Object? darkMode = null,
    Object? language = null,
    Object? firstDayOfWeek = null,
    Object? incompleteReminderDelay = null,
    Object? calendarSyncEnabled = null,
    Object? allDayNotificationHour = null,
    Object? allDayNotificationMinute = null,
  }) {
    return _then(
      _$UserSettingsImpl(
        wakeTime: null == wakeTime
            ? _value.wakeTime
            : wakeTime // ignore: cast_nullable_to_non_nullable
                  as TimeOfDay,
        sleepTime: null == sleepTime
            ? _value.sleepTime
            : sleepTime // ignore: cast_nullable_to_non_nullable
                  as TimeOfDay,
        reminderBeforeMinutes: null == reminderBeforeMinutes
            ? _value.reminderBeforeMinutes
            : reminderBeforeMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
        snoozeMinutes: null == snoozeMinutes
            ? _value.snoozeMinutes
            : snoozeMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
        notificationsEnabled: null == notificationsEnabled
            ? _value.notificationsEnabled
            : notificationsEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        themeId: null == themeId
            ? _value.themeId
            : themeId // ignore: cast_nullable_to_non_nullable
                  as String,
        darkMode: null == darkMode
            ? _value.darkMode
            : darkMode // ignore: cast_nullable_to_non_nullable
                  as String,
        language: null == language
            ? _value.language
            : language // ignore: cast_nullable_to_non_nullable
                  as String,
        firstDayOfWeek: null == firstDayOfWeek
            ? _value.firstDayOfWeek
            : firstDayOfWeek // ignore: cast_nullable_to_non_nullable
                  as int,
        incompleteReminderDelay: null == incompleteReminderDelay
            ? _value.incompleteReminderDelay
            : incompleteReminderDelay // ignore: cast_nullable_to_non_nullable
                  as int,
        calendarSyncEnabled: null == calendarSyncEnabled
            ? _value.calendarSyncEnabled
            : calendarSyncEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        allDayNotificationHour: null == allDayNotificationHour
            ? _value.allDayNotificationHour
            : allDayNotificationHour // ignore: cast_nullable_to_non_nullable
                  as int,
        allDayNotificationMinute: null == allDayNotificationMinute
            ? _value.allDayNotificationMinute
            : allDayNotificationMinute // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$UserSettingsImpl implements _UserSettings {
  const _$UserSettingsImpl({
    this.wakeTime = const TimeOfDay(hour: 7, minute: 0),
    this.sleepTime = const TimeOfDay(hour: 23, minute: 0),
    this.reminderBeforeMinutes = 5,
    this.snoozeMinutes = 15,
    this.notificationsEnabled = true,
    this.themeId = 'default',
    this.darkMode = 'system',
    this.language = 'ja',
    this.firstDayOfWeek = 1,
    this.incompleteReminderDelay = 30,
    this.calendarSyncEnabled = false,
    this.allDayNotificationHour = 9,
    this.allDayNotificationMinute = 0,
  });

  @override
  @JsonKey()
  final TimeOfDay wakeTime;
  @override
  @JsonKey()
  final TimeOfDay sleepTime;
  @override
  @JsonKey()
  final int reminderBeforeMinutes;
  @override
  @JsonKey()
  final int snoozeMinutes;
  @override
  @JsonKey()
  final bool notificationsEnabled;
  @override
  @JsonKey()
  final String themeId;
  @override
  @JsonKey()
  final String darkMode;
  @override
  @JsonKey()
  final String language;
  @override
  @JsonKey()
  final int firstDayOfWeek;
  @override
  @JsonKey()
  final int incompleteReminderDelay;
  @override
  @JsonKey()
  final bool calendarSyncEnabled;
  @override
  @JsonKey()
  final int allDayNotificationHour;
  @override
  @JsonKey()
  final int allDayNotificationMinute;

  @override
  String toString() {
    return 'UserSettings(wakeTime: $wakeTime, sleepTime: $sleepTime, reminderBeforeMinutes: $reminderBeforeMinutes, snoozeMinutes: $snoozeMinutes, notificationsEnabled: $notificationsEnabled, themeId: $themeId, darkMode: $darkMode, language: $language, firstDayOfWeek: $firstDayOfWeek, incompleteReminderDelay: $incompleteReminderDelay, calendarSyncEnabled: $calendarSyncEnabled, allDayNotificationHour: $allDayNotificationHour, allDayNotificationMinute: $allDayNotificationMinute)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserSettingsImpl &&
            (identical(other.wakeTime, wakeTime) ||
                other.wakeTime == wakeTime) &&
            (identical(other.sleepTime, sleepTime) ||
                other.sleepTime == sleepTime) &&
            (identical(other.reminderBeforeMinutes, reminderBeforeMinutes) ||
                other.reminderBeforeMinutes == reminderBeforeMinutes) &&
            (identical(other.snoozeMinutes, snoozeMinutes) ||
                other.snoozeMinutes == snoozeMinutes) &&
            (identical(other.notificationsEnabled, notificationsEnabled) ||
                other.notificationsEnabled == notificationsEnabled) &&
            (identical(other.themeId, themeId) || other.themeId == themeId) &&
            (identical(other.darkMode, darkMode) ||
                other.darkMode == darkMode) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.firstDayOfWeek, firstDayOfWeek) ||
                other.firstDayOfWeek == firstDayOfWeek) &&
            (identical(
                  other.incompleteReminderDelay,
                  incompleteReminderDelay,
                ) ||
                other.incompleteReminderDelay == incompleteReminderDelay) &&
            (identical(other.calendarSyncEnabled, calendarSyncEnabled) ||
                other.calendarSyncEnabled == calendarSyncEnabled) &&
            (identical(other.allDayNotificationHour, allDayNotificationHour) ||
                other.allDayNotificationHour == allDayNotificationHour) &&
            (identical(
                  other.allDayNotificationMinute,
                  allDayNotificationMinute,
                ) ||
                other.allDayNotificationMinute == allDayNotificationMinute));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    wakeTime,
    sleepTime,
    reminderBeforeMinutes,
    snoozeMinutes,
    notificationsEnabled,
    themeId,
    darkMode,
    language,
    firstDayOfWeek,
    incompleteReminderDelay,
    calendarSyncEnabled,
    allDayNotificationHour,
    allDayNotificationMinute,
  );

  /// Create a copy of UserSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserSettingsImplCopyWith<_$UserSettingsImpl> get copyWith =>
      __$$UserSettingsImplCopyWithImpl<_$UserSettingsImpl>(this, _$identity);
}

abstract class _UserSettings implements UserSettings {
  const factory _UserSettings({
    final TimeOfDay wakeTime,
    final TimeOfDay sleepTime,
    final int reminderBeforeMinutes,
    final int snoozeMinutes,
    final bool notificationsEnabled,
    final String themeId,
    final String darkMode,
    final String language,
    final int firstDayOfWeek,
    final int incompleteReminderDelay,
    final bool calendarSyncEnabled,
    final int allDayNotificationHour,
    final int allDayNotificationMinute,
  }) = _$UserSettingsImpl;

  @override
  TimeOfDay get wakeTime;
  @override
  TimeOfDay get sleepTime;
  @override
  int get reminderBeforeMinutes;
  @override
  int get snoozeMinutes;
  @override
  bool get notificationsEnabled;
  @override
  String get themeId;
  @override
  String get darkMode;
  @override
  String get language;
  @override
  int get firstDayOfWeek;
  @override
  int get incompleteReminderDelay;
  @override
  bool get calendarSyncEnabled;
  @override
  int get allDayNotificationHour;
  @override
  int get allDayNotificationMinute;

  /// Create a copy of UserSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserSettingsImplCopyWith<_$UserSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
