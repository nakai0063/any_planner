# Architecture

## レイヤー構成

```
┌─────────────────────────────────────────────┐
│  features/        UI層（画面・Widget）        │
│  ├── timeline/    タイムライン画面            │
│  ├── later_list/  あとでやるリスト            │
│  ├── task_editor/ タスク作成・編集            │
│  ├── stats/       統計画面（Phase 3）         │
│  └── settings/    設定画面（Phase 2）         │
├─────────────────────────────────────────────┤
│  core/            横断関心事                  │
│  ├── providers.dart  Riverpod プロバイダ定義  │
│  ├── theme/       テーマ・カラー・タイポ       │
│  ├── router/      go_router ルーティング      │
│  └── extensions/  DateTime等の拡張メソッド     │
├─────────────────────────────────────────────┤
│  domain/          ドメイン層                  │
│  ├── models/      freezed エンティティ        │
│  └── services/    ビジネスロジック            │
├─────────────────────────────────────────────┤
│  data/            データ層                    │
│  ├── database/    Drift DB定義               │
│  ├── tables/      テーブル定義               │
│  ├── daos/        DAO（Phase 2〜）           │
│  └── repositories/ Repository実装            │
└─────────────────────────────────────────────┘
```

## データフロー

```
User Action
  → Widget (StatefulWidget / ConsumerWidget)
    → Riverpod Provider / StateNotifier
      → Repository
        → Drift Database (SQLite)
          → Stream<List<T>> で UI に自動反映
```

## 主要データモデル

### Task（中心エンティティ）
```
id            : String (UUID)
title         : String
type          : later | scheduled | recurring
status        : pending | done | snoozed | skipped
targetDate    : DateTime（どの日のタスクか）
scheduledStart: DateTime?（タイムライン上の開始時刻）
durationMinutes: int?
memo          : String?
iconName      : String?
colorValue    : int?（パステルカラーのARGB値）
isPinned      : bool
routineId     : String?（繰り返し元のRoutine ID）
snoozeCount   : int
snoozedUntil  : DateTime?
sortOrder     : int
createdAt     : DateTime
updatedAt     : DateTime
```

### Routine（繰り返しルール、Phase 2）
```
id              : String (UUID)
title           : String
rule            : daily | weekly(曜日) | monthly(日)
defaultTime     : TimeOfDay?
durationMinutes : int?
iconName        : String?
colorValue      : int?
isActive        : bool
```

- Routine はルール定義のみ
- 日次で `RoutineGenerator` が Task(type: recurring) に展開
- 展開後は個別の Task として編集・完了できる

### UserSettings
```
wakeTime              : TimeOfDay（タイムライン開始）
sleepTime             : TimeOfDay（タイムライン終了）
reminderBeforeMinutes : int
snoozeMinutes         : int
notificationsEnabled  : bool
```

## ディレクトリ構造

```
lib/
├── main.dart                 # エントリポイント
├── app.dart                  # MaterialApp, テーマ, ルーティング
├── core/
│   ├── providers.dart        # DB, Repository, 選択日のプロバイダ
│   ├── theme/
│   │   ├── app_theme.dart    # Material 3 テーマ定義
│   │   ├── app_colors.dart   # パステルカラーパレット
│   │   └── app_typography.dart
│   ├── router/
│   │   └── app_router.dart   # go_router 定義
│   └── extensions/
│       └── datetime_ext.dart # DateTime/TimeOfDay 拡張
├── data/
│   ├── database/
│   │   ├── app_database.dart # Drift DB + クエリメソッド
│   │   └── connection/       # プラットフォーム別DB接続
│   ├── tables/
│   │   ├── tasks_table.dart
│   │   └── user_settings_table.dart
│   └── repositories/
│       ├── task_repository.dart    # Task CRUD + ドメイン変換
│       └── settings_repository.dart
├── domain/
│   └── models/
│       ├── task.dart          # freezed Task モデル
│       ├── task_status.dart   # pending | done | snoozed | skipped
│       ├── task_type.dart     # later | scheduled | recurring
│       └── user_settings.dart # freezed Settings モデル
├── features/
│   ├── timeline/
│   │   ├── timeline_screen.dart    # メイン画面
│   │   ├── providers.dart          # 画面固有プロバイダ
│   │   └── widgets/
│   │       ├── time_axis.dart      # 時間軸 + ドロップターゲット
│   │       ├── task_card.dart      # ドラッグ対応タスクカード
│   │       └── current_time_indicator.dart
│   ├── later_list/
│   │   └── later_list_sheet.dart   # ボトムシート
│   └── task_editor/
│       └── task_editor_screen.dart # 作成・編集モーダル
└── shared/widgets/                 # 共通Widget（Phase 2〜）
```

## 設計上の注意点

1. **Repository抽象化**: 将来のクラウド同期に備え、Repository経由でのみDBアクセス
2. **繰り返し展開**: Routineはルール定義のみ。日次でTaskに展開して個別管理
3. **通知許可**: 初回起動時でなく「最初のリマインダー設定時」に遅延リクエスト
4. **プラットフォーム分岐**: DB接続を `connection/` に分離（Native / Web）
5. **スクロール性能**: 48スロット程度なので ListView で十分。TaskCard に RepaintBoundary（必要時）
