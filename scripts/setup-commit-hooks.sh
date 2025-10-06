#!/usr/bin/env bash
set -euo pipefail

# リポジトリルートとフックディレクトリを決定
REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
HOOKS_DIR="$REPO_ROOT/.git/hooks"

if [ ! -d "$HOOKS_DIR" ]; then
  echo ".git/hooks が見つかりません。Git リポジトリのルートで実行していますか？" >&2
  exit 1
fi

echo "commit-msg フックをインストールします..."
cp "$REPO_ROOT/scripts/commit-msg-hook.sh" "$HOOKS_DIR/commit-msg"
chmod +x "$HOOKS_DIR/commit-msg"
echo "commit-msg フックを $HOOKS_DIR/commit-msg にインストールしました。"
echo "必要に応じて .git/hooks 内のフックを変更または削除することで無効化できます。"
