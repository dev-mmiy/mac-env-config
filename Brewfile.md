# Brewfile について

このファイルは、mac-env-configで管理するHomebrewパッケージのリストです。

## 使用方法

### すべてのパッケージをインストール

```bash
brew bundle install
```

### パッケージの更新

```bash
brew bundle
```

### パッケージの削除（Brewfileに記載されていないもの）

```bash
brew bundle cleanup
```

## 含まれるパッケージ

- **asdf**: 言語ランタイム管理
- **direnv**: 環境自動化
- **llvm**: 開発ツール（Rust開発、C/C++開発、LLM開発などで必要）
- **colima**: Docker環境（Docker Desktopの代替）
- **docker**: Docker CLI
- **docker-compose**: Docker Compose

## 注意事項

- 言語ランタイム（Python、Node、Rust等）は **asdf で管理**します
- Homebrewで直接インストールしないでください
- 詳細は [README.md](../README.md) を参照してください
