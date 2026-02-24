#!/usr/bin/env -S deno run --allow-read --allow-write --allow-env=HOME,TMPDIR,TMUX_PANE,TMUX --allow-run

// PermissionRequest hook for Bash: auto-approve compound commands
// where all individual commands are in the allowed set.
// Also handles notification when approval is not granted.

import { sendPermissionNotification } from "./claude-notify.ts";

export const ALLOWED_COMMANDS = new Set([
  "7z", "ag", "awk", "bat", "cargo", "cat", "cd", "chmod", "claude",
  "cp", "curl", "date", "deno", "dig", "docker", "docker-compose", "du",
  "echo", "env", "esbuild", "eslint", "eza", "fd", "ffmpeg", "ffprobe",
  "find", "fold", "fzf", "gemini", "gh", "git", "go", "golangci-lint", "grep", "gunzip",
  "gzip", "head", "http", "jq", "kill", "killall", "kubectl", "ln", "ls",
  "lsof", "make", "mkdir", "mv", "node", "npm",
  "oxlint", "pgrep", "pkill", "plutil", "pnpm",
  "prettier", "ps", "pwd", "python", "python3", "readlink", "rg", "rsync",
  "sed", "sleep", "sort", "starship", "tail", "tar", "task", "tee",
  "terminal-notifier", "test", "time", "timeout", "tmux", "tokei", "touch",
  "tr", "tree", "tsx", "wc", "wget", "which", "whoami", "xargs", "yq",
]);

/** Compound operator (|, &&, ||, ;) またはリダイレクト (2>&1, >/dev/null 等) を含むかチェック */
export function hasShellSyntax(command: string): boolean {
  return /[|;]|&&|\d*>&\d+|\d*>[^ ]*|\d*<[^ ]*/.test(command);
}

/** コマンド文字列から各セグメントの先頭コマンド名を抽出 */
export function extractCommands(command: string): string[] {
  const normalized = command
    .replace(/\d*>&\d+/g, "") // 2>&1 等
    .replace(/\d*>[^ ]*/g, "") // >/dev/null, 2>/dev/null 等
    .replace(/\d*<[^ ]*/g, ""); // <input 等

  // ) を除去し ( でサブシェルを分割してから演算子で分割する
  const parts = normalized.replace(/\)/g, "").split("(");

  const result: string[] = [];
  for (const part of parts) {
    const segments = part.split(/\s*(?:\|{1,2}|&&|;)\s*/);
    for (const segment of segments) {
      const cmd = segment.trim().split(/\s+/)[0];
      if (cmd) result.push(cmd);
    }
  }
  return result;
}

/** すべてのコマンドが許可リストに含まれるか判定 */
export function shouldApprove(
  command: string,
  allowed: Set<string> = ALLOWED_COMMANDS,
): boolean {
  if (!hasShellSyntax(command)) return false;
  const cmds = extractCommands(command);
  if (cmds.length === 0) return false;
  return cmds.every((cmd) => allowed.has(cmd));
}

// --- Logging ---

const LOG_FILE = `${Deno.env.get("TMPDIR") ?? "/tmp"}/approve-piped-commands.log`;

async function log(msg: string): Promise<void> {
  const ts = new Date().toISOString().replace("T", " ").slice(0, 19);
  await Deno.writeTextFile(LOG_FILE, `[${ts}] ${msg}\n`, { append: true });
}

// --- Entry point ---

if (import.meta.main) {
  interface HookInput {
    tool_name: string;
    tool_input: { command?: string; file_path?: string; url?: string };
  }

  const input: HookInput = JSON.parse(
    await new Response(Deno.stdin.readable).text(),
  );

  const command = input.tool_input.command ?? "";

  await log(`command: ${command}`);
  await log(`hasShellSyntax: ${hasShellSyntax(command)}`);
  await log(`shouldApprove: ${shouldApprove(command)}`);

  if (shouldApprove(command)) {
    // 承認 → 通知なし
    await log("decision: allow");
    console.log(JSON.stringify({
      hookSpecificOutput: {
        hookEventName: "PermissionRequest",
        decision: { behavior: "allow" },
      },
    }));
  } else {
    // 承認されない → 通知を送る
    await log("decision: notify");
    await sendPermissionNotification("Glass", input.tool_name, input.tool_input);
  }
}
