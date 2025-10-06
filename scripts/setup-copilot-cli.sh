#!/usr/bin/env bash
set -euo pipefail

# Friendly colored banners
GREEN="\e[32m"
YELLOW="\e[33m"
RED="\e[31m"
BLUE="\e[34m"
RESET="\e[0m"

echo -e "${BLUE}postCreate: Copilot CLI のセットアップを開始します...${RESET}"

# PATH に copilot があるか確認。あれば何もしない。
if command -v copilot >/dev/null 2>&1; then
  echo -e "${GREEN}copilot は既にインストールされています: $(copilot --version 2>/dev/null || echo 'version unknown')${RESET}"
  exit 0
fi

# なければ npm でインストール（devcontainer では npm が存在する前提）
if command -v npm >/dev/null 2>&1; then
  echo -e "${YELLOW}copilot が見つからないため、npm でインストールを試みます...${RESET}"
  if npm install -g @github/copilot; then
    echo -e "${GREEN}インストール完了。新しいシェルを開いて copilot を使用してください。${RESET}"
    exit 0
  else
    echo -e "${RED}npm によるインストールに失敗しました。手動で 'npm install -g @github/copilot' を試してください。${RESET}" >&2
    exit 2
  fi
else
  echo -e "${RED}npm が見つかりません。devcontainer の node 機能が有効か確認してください。${RESET}" >&2
  exit 2
fi
