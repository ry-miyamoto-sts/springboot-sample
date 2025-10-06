# GitHub Copilot カスタムインストラクション

## コミュニケーションと言語
- 応答・コメント・ドキュメントはすべて日本語で記述すること。
- コードコメントやログ出力も日本語で統一する。

## リポジトリの概要
- Spring Boot 3.2 / Java 21 のサンプル API。パッケージは `com.example.demo` に集約される。
- `DemoApplication` がエントリーポイント、`HelloController` が `/` と `/api/hello` を返却する最小構成。
- `src/test/java/com/example/demo/DemoApplicationTests` は `@SpringBootTest` でコンテキスト起動のみを検証する。

## コーディングルールとスタイル
- `.devcontainer/devcontainer.json` で Java 21 と Maven が事前インストール済み。VS Code では Google Java Style のフォーマッタが適用される。
- クラスやコントローラは `com.example.demo` 配下に追加し、REST エンドポイントは `@RestController` + `@GetMapping` などの Spring MVC アノテーションで実装する。
- JSON レスポンスを返す際は DTO や `ResponseEntity` の利用を検討する。既存の `/api/hello` はシリアライズ不要な文字列レスポンスである点に注意。
- `target/` 以下は Maven の生成物であり、コミット対象から常に除外する。

## ビルド・検証フロー
- フルビルドは `mvn clean install`、テストのみは `mvn test` を DevContainer 内で実行する。
- アプリ起動は `mvn spring-boot:run`、または `.vscode/launch.json` の `Spring Boot-DemoApplication` 構成を利用する。
- Spring DevTools が有効なため、保存後にホットリロードが働く。再起動が必要な場合は `Ctrl+C` で停止して再実行する。

## ツールとスクリプト
- コンテナ初回起動時に `scripts/postCreateCommand.sh` が Copilot CLI セットアップと `java -version` / `mvn -version` の確認を行う。
- Copilot CLI が存在しない場合は `npm install -g @github/copilot` を自動で試行する。手動再実行も同スクリプトで可能。

## Git 運用とコミット規約
- リモートへの push は明示的な指示があるまで禁止。ローカルコミットのみ実施する。
- コミットメッセージは `/docs/COMMIT_CONVENTION.md` に記載のプレフィックス（例: `docs:`, `feat:`）を先頭に付け、要点を一行でまとめる。
- 不要ファイルがステージされていないか確認し、生成物は `git restore --staged` などで除外する。

## Pull Request のガイド
- タイトルは 1 行で要点をまとめ、本文に変更概要・理由・確認手順・関連 Issue を記載する。
- 互換性影響や追加設定がある場合は本文で明確に説明し、レビュアーが再現しやすい情報を提供する。
