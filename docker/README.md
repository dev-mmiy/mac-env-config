# Docker環境構築ガイド

このディレクトリには、Colima + Docker Composeを使った実戦的なDocker環境構築のためのファイルが含まれています。

## ディレクトリ構成

```
docker/
├── README.md                    # このファイル
├── colima/                      # Colima設定
│   ├── README.md
│   ├── colima.yaml              # Colima設定ファイル
│   └── start.sh                 # Colima起動スクリプト
├── compose/                     # Docker Composeテンプレート
│   ├── README.md
│   ├── docker-compose.yml.template
│   └── docker-compose.dev.yml
└── examples/                    # 実戦的な構成例
    └── web-app/                 # Webアプリケーション例
        ├── README.md
        └── docker-compose.yml
```

## クイックスタート

### 1. Colimaのインストールと起動

```bash
# Homebrewでインストール
brew install colima docker docker-compose

# Colimaを起動（設定ファイルを使用）
cd ~/Development/mac-env-config
./docker/colima/start.sh

# または直接起動
colima start --cpu 4 --memory 8
```

### 2. 動作確認

```bash
# Dockerが動作しているか確認
docker ps

# Docker Composeが動作しているか確認
docker-compose --version
```

### 3. プロジェクトでDocker Composeを使用

```bash
# プロジェクトディレクトリに移動
cd ~/Development/my-project

# テンプレートをコピー
cp ~/Development/mac-env-config/docker/compose/docker-compose.dev.yml docker-compose.yml

# サービスを起動
docker-compose up -d
```

## 詳細ドキュメント

- [Colimaセットアップ](./colima/README.md)
- [Docker Composeテンプレート](./compose/README.md)
- [実戦的な構成例](./examples/web-app/README.md)

## よくある質問

### Q: Docker Desktopとの違いは？

A: Colimaは軽量で、Docker Desktopよりもリソース消費が少なく、コマンドライン中心のワークフローに適しています。

### Q: 既存のDocker Desktop環境から移行できますか？

A: はい、Colimaを起動すれば、既存のDockerコマンドやDocker Composeファイルはそのまま使用できます。

### Q: パフォーマンスはどうですか？

A: Apple Silicon Macでは、Colimaはネイティブに近いパフォーマンスを提供します。

## トラブルシューティング

### Colimaが起動しない

```bash
# Colimaの状態を確認
colima status

# ログを確認
colima logs

# 再起動
colima restart
```

### ポートが使用中

`.env`ファイルや`docker-compose.yml`でポート番号を変更してください。

### ボリュームのマウントエラー

Colimaの設定ファイル（`colima.yaml`）でマウント設定を確認してください。

## 参考リンク

- [Colima公式ドキュメント](https://github.com/abiosoft/colima)
- [Docker公式ドキュメント](https://docs.docker.com/)
- [Docker Compose公式ドキュメント](https://docs.docker.com/compose/)
