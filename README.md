# Any Planner

**Jot it down. Sort it later. See your day, clearly.**

ADHD向けタイムライン型1日タスク管理アプリ。タスクを「あとでやる」に放り込んで、気が向いたらタイムラインにドラッグ&ドロップ。1日の流れが一目でわかる。

## スクリーンショット

*（準備中）*

## 特徴

- **タイムライン表示** — 起床〜就寝を30分刻みで可視化
- **あとでやるリスト** — 時間未定のタスクを気軽にメモ
- **ドラッグ&ドロップ** — リストからタイムラインへ直感配置
- **パステルカラー** — タスクごとに色分け、視覚的にわかりやすい
- **繰り返しタスク** — 日課を自動展開（Phase 2）
- **ローカルファースト** — データは端末内SQLiteに保存、プライバシー安心

## セットアップ

### 前提
- Flutter 3.41+
- Android SDK 36+（APKビルド時）
- Visual Studio Build Tools 2022（Windowsビルド時）

### 手順

```bash
git clone https://github.com/nakai0063/any_planner.git
cd any_planner
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run
```

## ビルド

```bash
# Windows
flutter build windows

# Android APK
flutter build apk --release

# 出力先
# Windows: build/windows/x64/runner/Release/any_planner.exe
# Android: build/app/outputs/flutter-apk/app-release.apk
```

## アーキテクチャ

```
UI (Widget) → Controller (Riverpod Notifier) → Repository → DataSource (Drift/SQLite)
```

| レイヤー | 技術 |
|---------|------|
| 状態管理 | Riverpod 2.x |
| ローカルDB | Drift (SQLite) |
| 不変モデル | freezed |
| ルーティング | go_router |

詳細は [ARCHITECTURE.md](ARCHITECTURE.md) を参照。

## ロードマップ

[ROADMAP.md](ROADMAP.md) を参照。

## ライセンス

Private（個人プロジェクト）
