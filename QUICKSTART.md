# Spring Boot DevContainer - クイックスタートガイド

## 📋 前提条件

以下がインストールされていることを確認してください：

1. **Docker Desktop**
   - Windows/Mac: https://www.docker.com/products/docker-desktop
   - Linux: Docker Engine

2. **Visual Studio Code**
   - https://code.visualstudio.com/

3. **VS Code 拡張機能**
   - Dev Containers (ms-vscode-remote.remote-containers)

## 🚀 開発環境の起動手順

### ステップ 1: プロジェクトを開く

```bash
cd /path/to/springboot-devcontainer
code .
```

### ステップ 2: DevContainerで開く

1. VS Codeが開いたら、右下に通知が表示される場合は「Reopen in Container」をクリック
2. または、コマンドパレット（`Ctrl+Shift+P` / `Cmd+Shift+P`）を開いて：
   - 「Dev Containers: Reopen in Container」を選択

### ステップ 3: コンテナのビルドを待つ

初回は数分かかります。進行状況は画面右下で確認できます。

### ステップ 4: アプリケーションを実行

ターミナルで以下を実行：

```bash
# 依存関係のインストールとビルド
mvn clean install

# アプリケーションの起動
mvn spring-boot:run
```

または、VS Codeのデバッグパネル（F5キー）から「Spring Boot-DemoApplication」を選択して実行。

### ステップ 5: 動作確認

ブラウザで以下のURLにアクセス：

- http://localhost:8080/ → "Hello, Spring Boot!"
- http://localhost:8080/api/hello → JSON レスポンス

## 🔧 開発のヒント

### ホットリロード

Spring DevToolsが有効なので、Javaファイルを編集して保存すると自動的に再起動します。

### デバッグ

1. ブレークポイントを設定（行番号の左をクリック）
2. F5キーでデバッグモードで起動
3. ステップ実行や変数の確認が可能

### Mavenコマンド

```bash
# テストの実行
mvn test

# パッケージング
mvn package

# クリーンビルド
mvn clean install
```

## 📝 コードの編集

### 新しいコントローラーを追加

`src/main/java/com/example/demo/` に新しいファイルを作成：

```java
package com.example.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class MyController {

    @GetMapping("/test")
    public String test() {
        return "{ \"status\": \"OK\" }";
    }
}
```

保存すると自動的にリロードされ、`http://localhost:8080/api/test` でアクセス可能になります。

## 🛠️ トラブルシューティング

### ポートが既に使用されている

`application.properties` を編集：

```properties
server.port=8081
```

### コンテナが起動しない

```bash
# Dockerのログを確認
docker logs <container-id>

# コンテナを再ビルド
# コマンドパレット → "Dev Containers: Rebuild Container"
```

### Javaの補完が効かない

1. コマンドパレット → "Java: Clean Java Language Server Workspace"
2. VS Codeを再起動

## 📚 次のステップ

- データベース連携（JPA, H2, PostgreSQLなど）
- RESTful API の実装
- セキュリティの追加（Spring Security）
- テストの充実（JUnit, MockMVC）

詳しくは [Spring Boot 公式ドキュメント](https://spring.io/projects/spring-boot) を参照してください。
