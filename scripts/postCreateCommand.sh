#!/usr/bin/env bash
set -euo pipefail

# Colors
GREEN="\e[32m"
YELLOW="\e[33m"
RED="\e[31m"
BLUE="\e[34m"
RESET="\e[0m"

echo -e "${BLUE}postCreate: Copilot スクリプトの実行を確認します...${RESET}"

if [ -f ./scripts/setup-copilot-cli.sh ]; then
  chmod +x ./scripts/setup-copilot-cli.sh
  echo -e "${YELLOW}setup-copilot-cli.sh を呼び出します（スクリプト側で冪等性を判断します）...${RESET}"
  if bash ./scripts/setup-copilot-cli.sh; then
    echo -e "${GREEN}setup-copilot-cli.sh の実行が完了しました。${RESET}"
  else
    echo -e "${RED}setup-copilot-cli.sh 実行中にエラーが発生しました（続行）。ログを確認してください。${RESET}" >&2
  fi
else
  echo -e "${YELLOW}scripts/setup-copilot-cli.sh が見つかりません。スキップします。${RESET}"
fi

if command -v java >/dev/null 2>&1; then
  echo -e "${BLUE}java -version を表示します:${RESET}"
  java -version || true
else
  echo -e "${YELLOW}java が見つかりません。Java がインストールされているか devcontainer 設定を確認してください。${RESET}"
fi

if command -v mvn >/dev/null 2>&1; then
  echo -e "${BLUE}mvn -version を表示します:${RESET}"
  mvn -version || true
else
  echo -e "${YELLOW}mvn が見つかりません。Maven がインストールされているか devcontainer 設定を確認してください。${RESET}"
fi
