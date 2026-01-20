# Colima セットアップ

Colimaは、macOS上でDocker Desktopを使わずにDocker環境を構築する軽量なツールです。

## インストール

### Homebrewでインストール

```bash
brew install colima docker docker-compose
```

## 初期セットアップ

### 1. Colimaを起動

```bash
colima start
```

デフォルトでは、2CPU、2GBメモリで起動します。

### 2. リソースを指定して起動（推奨）

```bash
colima start --cpu 4 --memory 8
```

### 3. 動作確認

```bash
docker ps
docker-compose --version
```

## 設定ファイルを使った起動

`colima.yaml` を使用して設定を管理できます：

```bash
colima start --config docker/colima/colima.yaml
```

## よく使うコマンド

```bash
# Colimaを起動
colima start

# Colimaを停止
colima stop

# Colimaを再起動
colima restart

# Colimaの状態を確認
colima status

# Colimaを削除（データも削除）
colima delete
```

## トラブルシューティング

### Dockerコマンドが認識されない場合

```bash
# Dockerのパスを確認
which docker

# Colimaが起動しているか確認
colima status
```

### リソース不足の場合

```bash
# Colimaを停止
colima stop

# より多くのリソースで再起動
colima start --cpu 4 --memory 8
```

## 参考リンク

- [Colima公式ドキュメント](https://github.com/abiosoft/colima)
- [Docker公式ドキュメント](https://docs.docker.com/)
