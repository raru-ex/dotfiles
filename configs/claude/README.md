# Claude Code 設定

Claude Codeの設定ファイルと通知スクリプト。

## セットアップ

```sh
./bin/install_claude.sh
```

deno・terminal-notifierのインストールと設定ファイルの配置を行う。

## 機能

### 処理完了通知

Claude Codeの処理が完了したときにmacOSの通知を送る。通知をクリックするとiTerm2のhotkey windowがアクティブになる。

## 手動設定が必要な項目

### 1. iTerm2のアクセシビリティ権限

通知クリック時にhotkey windowを開くためにSystem Eventsのキーストローク送信が必要。

**System Settings → Privacy & Security → Accessibility** に以下を追加：
- `Terminal.app` (`/Applications/Utilities/Terminal.app`)

### 2. iTerm2のhotkey windowショートカット

`~/.claude/scripts/claude-notify.ts` の `activate` 関数内のキーコードがAlt+Tになっている。

```typescript
tell application "System Events" to keystroke "t" using {option down}
```

iTerm2のhotkey windowのショートカットが異なる場合は上記を変更する。

**iTerm2 → Settings → Keys → Hotkey** で確認できる。

### 3. スクリプトエディタの通知設定

terminal-notifierの既知のバグにより、スクリプトエディタ名義の通知が残留することがある。
その場合は **System Settings → Notifications → スクリプトエディタ** をオフにする。
