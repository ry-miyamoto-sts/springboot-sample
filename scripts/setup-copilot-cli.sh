#!/usr/bin/env bash
set -euo pipefail

echo "npm で Copilot CLI をグローバルインストールします..."
if command -v npm >/dev/null 2>&1; then
  if npm install -g @github/copilot; then
    echo "インストール成功: npm による @github/copilot"
    echo "'copilot --help' を実行して確認してください。"
    exit 0
  else
    echo "npm によるインストールに失敗しました。手動で 'npm install -g @github/copilot' を実行してください。" >&2
    exit 2
  fi
else
  echo "npm が見つかりません。devcontainer の node 機能が有効か確認してください。" >&2
  exit 2
fi
