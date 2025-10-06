#!/usr/bin/env bash
# Git の commit-msg フック: コミットメッセージ規約を検証します。
# - feat:, fix:, chore: などのプレフィックスを許可
# - プレフィックス後に日本語を含めることを要求（簡易チェック）

set -euo pipefail

MSG_FILE="${1:-}"
if [ -z "$MSG_FILE" ]; then
  echo "commit-msg フック: メッセージファイルが指定されていません。" >&2
  exit 1
fi

# 先頭と末尾の空白を取り除き、CRLF を除去
MSG=$(sed -e 's/^\s*//;s/\s*$//' -e 's/\r$//' "$MSG_FILE")
if [ -z "${MSG//[[:space:]]/}" ]; then
  echo "コミットメッセージが空です。日本語の説明を含めてください。" >&2
  exit 1
fi

# 許可される接頭辞の一覧（ユーザー指定）
TYPES="fix|hotfix|add|feat|update|change|clean|refactor|improve|disable|remove|rename|move|upgrade|revert|docs|style|perf|test|chore"

# プレフィックスのチェック
RE_HEADER="^(${TYPES})(\(.+\))?:\s+"
if ! echo "$MSG" | grep -Eq "$RE_HEADER"; then
  echo "コミットメッセージは以下のいずれかの接頭辞で始めてください: ${TYPES//|/, } 。例: 'feat(画面): 日本語での説明'" >&2
  exit 1
fi

# プレフィックスの後に日本語が含まれているか簡易チェック
BODY=$(echo "$MSG" | sed -E "s/^(${TYPES})(\(.+\))?:\s+//")
if ! echo "$BODY" | grep -P "[\x{3040}-\x{30FF}\x{4E00}-\x{9FFF}]" >/dev/null 2>&1; then
  echo "プレフィックスの後に日本語の説明を含めてください。例: 'chore: ドキュメントを移動'" >&2
  exit 1
fi

exit 0
