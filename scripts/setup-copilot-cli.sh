#!/usr/bin/env bash
set -euo pipefail

# Friendly colored banners
GREEN="\e[32m"
YELLOW="\e[33m"
RED="\e[31m"
BLUE="\e[34m"
RESET="\e[0m"

echo -e "${BLUE}postCreate: Copilot CLI のセットアップを開始します...（バイナリ確認）${RESET}"

# 1) PATH に copilot があるかをまず確認
if command -v copilot >/dev/null 2>&1; then
  if copilot --version >/dev/null 2>&1; then
    echo -e "${GREEN}copilot バイナリが PATH に存在します: $(copilot --version 2>/dev/null || echo 'version unknown')${RESET}"
    exit 0
  fi
fi

# 2) npm の global bin を確認（補助）
if command -v npm >/dev/null 2>&1; then
  NPM_BIN=$(npm bin -g 2>/dev/null || true)
  if [ -n "${NPM_BIN}" ] && [ -x "${NPM_BIN}/copilot" ]; then
    echo -e "${GREEN}copilot が npm global bin にあります: ${NPM_BIN}/copilot${RESET}"
    exit 0
  fi
fi

# 3) 見つからなければ npm でインストールを試みる
if command -v npm >/dev/null 2>&1; then
  echo -e "${YELLOW}copilot が見つからないため、npm でインストールを試みます...${RESET}"
  if npm install -g --no-audit --no-fund --silent @github/copilot; then
    echo -e "\n${GREEN}█████ インストール成功: @github/copilot がインストールされました █████${RESET}\n"
    echo "'copilot --help' を実行して確認してください。"
    # 検証
    if command -v copilot >/dev/null 2>&1; then
      echo -e "${GREEN}インストール後に copilot が PATH に見つかりました。${RESET}"
      exit 0
    else
      echo -e "${YELLOW}インストールは成功しましたが、現在のシェルの PATH に copilot が見つかりません。シェルを再起動するか、npm の global bin を PATH に追加してください。${RESET}"
      exit 0
    fi
  else
    echo -e "\n${RED}!!! npm による Copilot CLI のインストールに失敗しました !!!${RESET}\n" >&2
    echo "手動で 'npm install -g @github/copilot' を実行してください。" >&2
    exit 2
  fi
else
  echo -e "${RED}npm が見つかりません。devcontainer の node 機能が有効か確認してください。${RESET}" >&2
  exit 2
fi
