# Spring Boot DevContainer プロジェクト

このプロジェクトは、VS Code DevContainer を使用した Spring Boot 開発環境です。

## 必要な環境

- Docker Desktop
- Visual Studio Code
- VS Code 拡張機能: Dev Containers

## 開発環境の起動方法

1. VS Code でこのフォルダを開く
2. コマンドパレット（Ctrl+Shift+P または Cmd+Shift+P）を開く
3. "Dev Containers: Reopen in Container" を選択
4. コンテナのビルドと起動を待つ

## プロジェクト構成

```
springboot-devcontainer/
├── .devcontainer/
│   └── devcontainer.json   # DevContainer設定
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/example/demo/
│   │   │       ├── DemoApplication.java      # メインアプリケーション
│   │   │       └── HelloController.java      # サンプルコントローラー
│   │   └── resources/
│   │       └── application.properties        # アプリケーション設定
│   └── test/
│       └── java/
│           └── com/example/demo/
│               └── DemoApplicationTests.java # テストクラス
├── pom.xml                  # Maven設定
└── README.md
```

## アプリケーションの実行

DevContainer内で以下のコマンドを実行:

```bash
# Maven でビルド
mvn clean install

# アプリケーションの起動
mvn spring-boot:run
```

または、VS Code のデバッグ機能を使用して起動できます。

## エンドポイント

- `http://localhost:8080/` - Hello, Spring Boot!
- `http://localhost:8080/api/hello` - JSON レスポンス

## 含まれる機能

- Java 21
- Spring Boot 3.2.0
- Spring Web
- Spring DevTools（ホットリロード）
- Maven

## VS Code 拡張機能

DevContainer には以下の拡張機能がプリインストールされます:

- Java Extension Pack
- Spring Boot Extension Pack
- Spring Initializr
- Spring Boot Dashboard

## トラブルシューティング

### ポート 8080 が使用中の場合

`application.properties` で以下を変更:
```properties
server.port=8081
```

### ホットリロードが動作しない場合

DevTools が有効になっていることを確認し、ファイルを保存後にブラウザをリフレッシュしてください。
