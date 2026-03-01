---
description: "git commit を行うスラッシュコマンド。コミットメッセージをファイルに書き出してから commit する。"
---

# git commit タスク

git commit を実行するために以下の手順を実行してください：

## タスク

1. **ステージ状態の確認**

```bash
git status
git diff --cached --stat
```

コミット対象のファイルを確認してください。ステージされていないファイルがあれば適宜追加してください。

2. **コミットメッセージの作成・提示**

変更内容をもとに以下のフォーマットでコミットメッセージを作成してください：

- **フォーマット**: `{type}: {summary}`
  - `type` は以下から選択:
    - `feat` - 新機能
    - `fix` - バグ修正
    - `refactor` - リファクタリング
    - `docs` - ドキュメント変更
    - `style` - コードスタイル/フォーマット
    - `test` - テスト追加・修正
    - `chore` - ビルド/ツール変更
    - `perf` - パフォーマンス改善
  - body には変更の背景・詳細を記述（任意）
  - 末尾に `Co-Authored-By: Claude Sonnet 4.6 <noreply@anthropic.com>` を追加

ユーザーにメッセージを提示して確認を取ってください。

3. **ユーザー確認後のコミット実行**

コミットメッセージ（body）は必ず一時ファイルに書き出してから `--message-file` で渡してください。`git commit -m` で直接渡すと改行を含む場合に permission request が発生します。

手順:
1. Writeツールで `~/.claude/tmp/commit-message.md` にメッセージを書き出す
2. `commit.sh` に `--message-file ~/.claude/tmp/commit-message.md` で渡す

```bash
~/.claude/scripts/commit.sh --message-file ~/.claude/tmp/commit-message.md
```

## 重要な注意事項

- **`git commit -m` を直接使用しないでください。** 必ず `commit.sh` 経由でファイルから渡してください。
- **`--message` の値に `$()` によるコマンド置換を埋め込むことは禁止です。** 必ずプレーンな文字列リテラルをファイルに書き込んでください。
