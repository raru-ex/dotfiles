#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

# Usage:
#   commit.sh --message-file /path/to/message.md
#
# git commit のラッパースクリプト
# --message-file: ファイルからコミットメッセージを読み込む（改行を含むメッセージに推奨）

MESSAGE_FILE=""

while [[ $# -gt 0 ]]; do
	case $1 in
	--message-file)
		MESSAGE_FILE="$2"
		shift 2
		;;
	*)
		echo "Unknown option: $1" >&2
		exit 1
		;;
	esac
done

if [[ -z "$MESSAGE_FILE" ]]; then
	echo "Error: --message-file is required" >&2
	echo "Usage: commit.sh --message-file /path/to/message.md" >&2
	exit 1
fi

if [[ ! -f "$MESSAGE_FILE" ]]; then
	echo "Error: message file not found: $MESSAGE_FILE" >&2
	exit 1
fi

git commit -F "$MESSAGE_FILE"
