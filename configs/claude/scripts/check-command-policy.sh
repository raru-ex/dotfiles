#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

LOG_FILE="${TMPDIR:-/tmp}/check-command-policy.log"

function log() {
	echo "[$(date +'%Y-%m-%d %H:%M:%S')] $*" >>"$LOG_FILE"
}

# JSON 入力を読み取り、コマンドとツール名を抽出
input=$(cat)
log "input: $input"
command=$(echo "$input" | jq -r '.tool_input.command' 2>/dev/null || echo "")
tool_name=$(echo "$input" | jq -r '.tool_name' 2>/dev/null || echo "")

# Bash コマンドのみをチェック
if [ "$tool_name" != "Bash" ]; then
	exit 0
fi

function matches_deny_pattern() {
	local cmd="$1"
	local pattern="$2"

	# 先頭・末尾の空白を削除
	cmd="${cmd#"${cmd%%[![:space:]]*}"}"
	cmd="${cmd%"${cmd##*[![:space:]]}"}"

	# glob パターンマッチング
	# shellcheck disable=SC2053
	[[ "$cmd" == $pattern ]]
}

function match() {
	local command="$1"
	local pattern="$2"
	local error_message="$3"

	# コマンド全体がパターンにマッチするかチェック
	if matches_deny_pattern "$command" "$pattern"; then
		log "DENIED: $command (pattern: $pattern)"
		echo "$error_message" >&2
		exit 2
	fi

	# コマンドを論理演算子で分割し、各部分もチェック
	temp_command="${command//;/$'\n'}"
	temp_command="${temp_command//&&/$'\n'}"
	temp_command="${temp_command//||/$'\n'}"

	IFS=$'\n'
	for cmd_part in $temp_command; do
		[ -z "$(echo "$cmd_part" | tr -d '[:space:]')" ] && continue

		if matches_deny_pattern "$cmd_part" "$pattern"; then
			echo "$error_message" >&2
			exit 2
		fi
	done
}

# git
match "$command" "git -C*" "Do not use 'git -C' option. Use git commands in the repository directory."
match "$command" "git pull --rebase" "Do not use 'git pull --rebase'. Use 'git fetch && git rebase origin/main' instead."

# コマンドを許可
log "ALLOWED: $command"
exit 0
