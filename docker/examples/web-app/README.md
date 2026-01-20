# Webアプリケーション開発環境の例

Next.js + PostgreSQL + Redis の開発環境セットアップ例です。

## セットアップ

### 1. プロジェクトにコピー

```bash
cd ~/Development/my-web-app
cp ~/Development/mac-env-config/docker/examples/web-app/docker-compose.yml .
```

### 2. Dockerfileを作成

```dockerfile
FROM node:20-alpine

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

EXPOSE 3000

CMD ["npm", "run", "dev"]
```

### 3. 起動

```bash
docker-compose up -d
```

### 4. アクセス

- アプリケーション: http://localhost:3000
- PostgreSQL: localhost:5432
- Redis: localhost:6379

## 使用方法

```bash
# ログを確認
docker-compose logs -f app

# データベースに接続
docker-compose exec db psql -U postgres -d mydb

# Redisに接続
docker-compose exec redis redis-cli

# 停止
docker-compose down
```
