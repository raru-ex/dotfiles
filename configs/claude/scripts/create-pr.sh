#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

# Usage:
#   create-pr.sh create --title "TITLE" --body "BODY"
#   create-pr.sh create --title "TITLE" --body-file /path/to/body.md
#   create-pr.sh edit --title "TITLE" --body "BODY"
#   create-pr.sh edit --title "TITLE" --body-file /path/to/body.md
#
# PRの作成・更新を行うラッパースクリプト
# --body-file: ファイルからbodyを読み込む（改行を含むbodyに推奨）

ACTION="${1:-}"

if [[ -z "$ACTION" ]]; then
	echo "Usage: create-pr.sh <create|edit> [options]" >&2
	exit 1
fi

shift

case "$ACTION" in
create)
	TITLE=""
	BODY=""

	while [[ $# -gt 0 ]]; do
		case $1 in
		--title)
			TITLE="$2"
			shift 2
			;;
		--body)
			BODY="$2"
			shift 2
			;;
		--body-file)
			BODY="$(cat "$2")"
			shift 2
			;;
		*)
			echo "Unknown option: $1" >&2
			exit 1
			;;
		esac
	done

	if [[ -z "$TITLE" ]]; then
		echo "Error: --title is required" >&2
		exit 1
	fi

	if [[ -z "$BODY" ]]; then
		echo "Error: --body is required" >&2
		exit 1
	fi

	gh pr create --title "$TITLE" --body "$BODY" --draft
	;;

edit)
	TITLE=""
	BODY=""

	while [[ $# -gt 0 ]]; do
		case $1 in
		--title)
			TITLE="$2"
			shift 2
			;;
		--body)
			BODY="$2"
			shift 2
			;;
		--body-file)
			BODY="$(cat "$2")"
			shift 2
			;;
		*)
			echo "Unknown option: $1" >&2
			exit 1
			;;
		esac
	done

	ARGS=()
	if [[ -n "$TITLE" ]]; then
		ARGS+=(--title "$TITLE")
	fi
	if [[ -n "$BODY" ]]; then
		ARGS+=(--body "$BODY")
	fi

	if [[ ${#ARGS[@]} -eq 0 ]]; then
		echo "Error: at least --title or --body is required for edit" >&2
		exit 1
	fi

	gh pr edit "${ARGS[@]}"
	;;

*)
	echo "Unknown action: $ACTION" >&2
	echo "Usage: create-pr.sh <create|edit> [options]" >&2
	exit 1
	;;
esac
