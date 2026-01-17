
# README.md 更新用スクリプト（日本語）

以下のスクリプトは、`mac-env-config` リポジトリの `README.md` を  
**日本語内容で一括更新**します。

## ファイル名
`update-readme.sh`

---

## スクリプト本体

```bash
#!/usr/bin/env bash
set -e

REPO_DIR="$HOME/Development/mac-env-config"
README="$REPO_DIR/README.md"

echo "📄 Updating README.md in $REPO_DIR"

cat << 'EOF' > "$README"
# mac-env-config

このリポジトリは、**macOS（Apple Silicon）における開発環境を再現可能・安全に構築するための環境定義リポジトリ**です。

以下の方針で設計されています。

- 言語ランタイムは **asdf** で一元管理する
- バージョン定義は **`.tool-versions` をGitHubで管理**する
- ローカル環境は汚さず、Mac買い替え時も短時間で復旧できる
- Docker Desktop は使わず、Colima を利用する
- 必要に応じて QEMU を併用する

---

## ディレクトリ構成

mac-env-config/
├── README.md
└── tool-versions/
├── base.tool-versions # 最小構成（共通）
├── llm.tool-versions # LLM / AI 開発向け
└── web.tool-versions # Web / Frontend 向け


---

## 基本方針（重要）

- Homebrew で **python / node / rust 等はインストールしない**
- 言語バージョンは **必ず `.tool-versions` で固定**
- `asdf global` は原則使用しない
- プロジェクト単位で `.tool-versions` を配置する

---

## 使い方（プロジェクト側）

### 1. テンプレートをコピー
```bash
cp ~/Development/mac-env-config/tool-versions/llm.tool-versions .tool-versions


