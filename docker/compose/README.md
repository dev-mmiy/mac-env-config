# Docker Compose テンプレート

このディレクトリには、実戦的なDocker Compose設定のテンプレートが含まれています。

## ファイル構成

- `docker-compose.yml.template`: 本番環境向けのテンプレート
- `docker-compose.dev.yml`: 開発環境向けの設定
- `.env.example`: 環境変数の設定例

## 使用方法

### 1. プロジェクトにコピー

```bash
# プロジェクトディレクトリに移動
cd ~/Development/my-project

# Docker Composeファイルをコピー
cp ~/Development/mac-env-config/docker/compose/docker-compose.dev.yml docker-compose.yml

# 環境変数ファイルをコピー
cp ~/Development/mac-env-config/docker/compose/.env.example .env

# .envファイルを編集（必要に応じて）
vim .env
```

### 2. サービスを起動

```bash
# バックグラウンドで起動
docker-compose up -d

# ログを確認
docker-compose logs -f

# 特定のサービスのログを確認
docker-compose logs -f app
```

### 3. よく使うコマンド

```bash
# サービスを起動
docker-compose up -d

# サービスを停止
docker-compose stop

# サービスを停止してコンテナを削除
docker-compose down

# ボリュームも含めて完全に削除
docker-compose down -v

# サービスを再起動
docker-compose restart

# サービスの状態を確認
docker-compose ps

# コンテナ内でコマンドを実行
docker-compose exec app bash
docker-compose exec db psql -U postgres -d mydb
```

## 含まれるサービス

### 開発環境（docker-compose.dev.yml）

- **app**: アプリケーションサービス（Node.js/Python等）
- **db**: PostgreSQLデータベース
- **redis**: Redisキャッシュ
- **pgadmin**: PostgreSQL管理ツール（オプション）

## カスタマイズ

### アプリケーションの種類に応じた設定

#### Node.js/Next.jsアプリケーション

```yaml
app:
  build:
    context: .
    dockerfile: Dockerfile.dev
  volumes:
    - .:/app
    - /app/node_modules
    - /app/.next
  command: npm run dev
```

#### Python/Djangoアプリケーション

```yaml
app:
  build:
    context: .
    dockerfile: Dockerfile.dev
  volumes:
    - .:/app
  command: python manage.py runserver 0.0.0.0:8000
  ports:
    - "8000:8000"
```

#### Rustアプリケーション

```yaml
app:
  build:
    context: .
    dockerfile: Dockerfile.dev
  volumes:
    - .:/app
    - cargo_cache:/usr/local/cargo/registry
  command: cargo run
```

## トラブルシューティング

### ポートが既に使用されている場合

`.env`ファイルでポート番号を変更してください：

```bash
APP_PORT=3001
DB_PORT=5433
REDIS_PORT=6380
```

### ボリュームの権限エラー

```bash
# ボリュームを削除して再作成
docker-compose down -v
docker-compose up -d
```

### データベースの初期化

`docker/db/init.sql`を作成して、初期データを投入できます。

## 参考リンク

- [Docker Compose公式ドキュメント](https://docs.docker.com/compose/)
- [PostgreSQL公式イメージ](https://hub.docker.com/_/postgres)
- [Redis公式イメージ](https://hub.docker.com/_/redis)
