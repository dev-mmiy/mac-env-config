<<<<<<< HEAD
=======
#README.md

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
>>>>>>> d2252b58b319a2bf2bf62fab2d7d1a967c8c11d5
# mac-env-config

macOS（Apple Silicon）上で、**開発・LLM・将来のQEMU利用を見据えた、壊れにくく再現可能な開発環境**を構築するための環境定義リポジトリです。

## 目的

このリポジトリは、以下の目的で設計されています：

- **再現性の確保**: Mac買い替えや初期化時でも、短時間で環境を復旧できる
- **拡張性**: アプリ開発・LLM・仮想化など、様々な用途に対応できる基盤を提供
- **保守性**: 環境定義をコードで管理し、Single Source of TruthとしてGitHubで管理
- **安全性**: Mac本体を薄く保ち、OS直インストールを最小化

### 設計の基本方針

- **Mac は薄く保つ**: OS直インストールを最小化
- **環境はコードで管理**: すべての環境定義をGitHubで管理
- **再現性を最優先**: Mac買い替えや初期化に強い構成
- **将来の拡張を見据える**: アプリ開発・LLM・QEMUまで対応可能な土台を構築


### 設計の基本方針

- **Mac は薄く保つ**: OS直インストールを最小化
- **環境はコードで管理**: すべての環境定義をGitHubで管理
- **再現性を最優先**: Mac買い替えや初期化に強い構成
- **将来の拡張を見据える**: アプリ開発・LLM・QEMUまで対応可能な土台を構築


### 設計の基本方針

- **Mac は薄く保つ**: OS直インストールを最小化
- **環境はコードで管理**: すべての環境定義をGitHubで管理
- **再現性を最優先**: Mac買い替えや初期化に強い構成
- **将来の拡張を見据える**: アプリ開発・LLM・QEMUまで対応可能な土台を構築


### 設計の基本方針

- **Mac は薄く保つ**: OS直インストールを最小化
- **環境はコードで管理**: すべての環境定義をGitHubで管理
- **再現性を最優先**: Mac買い替えや初期化に強い構成
- **将来の拡張を見据える**: アプリ開発・LLM・QEMUまで対応可能な土台を構築


### 設計の基本方針

- **Mac は薄く保つ**: OS直インストールを最小化
- **環境はコードで管理**: すべての環境定義をGitHubで管理
- **再現性を最優先**: Mac買い替えや初期化に強い構成
- **将来の拡張を見据える**: アプリ開発・LLM・QEMUまで対応可能な土台を構築

## 設計思想

### 設計の基本方針

- **Mac は薄く保つ**: OS直インストールを最小化
- **環境はコードで管理**: すべての環境定義をGitHubで管理
- **再現性を最優先**: Mac買い替えや初期化に強い構成
- **将来の拡張を見据える**: アプリ開発・LLM・QEMUまで対応可能な土台を構築


### 採用した技術スタック（役割分担）

| レイヤ | 採用技術 | 役割 |
|--------|---------|------|
| パッケージ管理 | Homebrew | OSレベルのツール管理 |
| 言語ランタイム | asdf | Python / Node / Rust / direnv の統一管理 |
| 環境自動化 | direnv | ディレクトリ単位の自動環境切替 |
| バージョン定義 | `.tool-versions` | 言語・ツールのバージョン固定 |
| 構成管理 | GitHub | 環境定義の Single Source of Truth |
| 仮想化（準備） | Colima / QEMU | Docker / CPU・OS検証（今後） |

### 基本方針

- **Homebrew で python / node / rust 等はインストールしない**
- 言語バージョンは **必ず `.tool-versions` で固定**
- `asdf global` は原則使用しない
- プロジェクト単位で `.tool-versions` を配置する
- 新しいMacでも `Homebrew → mac-env-config clone → asdf install` だけで環境が復旧可能

## ディレクトリ構成

```
mac-env-config/
├── README.md
└── tool-versions/
    ├── base.tool-versions    # 最小構成（共通）
    ├── llm.tool-versions     # LLM / AI 開発向け
    └── web.tool-versions     # Web / Frontend 向け
```

## 使い方

### 初回セットアップ（新しいMacでの環境構築）

1. **Homebrew をインストール**
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

2. **asdf をインストール・有効化**
   ```bash
   brew install asdf
   echo -e "\n. $(brew --prefix asdf)/libexec/asdf.sh" >> ~/.zshrc
   source ~/.zshrc
   ```

3. **direnv をインストール・有効化**
   ```bash
   brew install direnv
   echo 'eval "$(direnv hook zsh)"' >> ~/.zshrc
   source ~/.zshrc
   ```

4. **このリポジトリをクローン**
   ```bash
   git clone https://github.com/your-username/mac-env-config.git ~/Development/mac-env-config
   ```

### 新しい開発プロジェクトでの利用方法

新しい開発プロジェクトを始める際は、以下の手順で環境を設定します：

#### ステップ1: プロジェクトディレクトリを作成
```bash
mkdir my-project
cd my-project
```

#### ステップ2: 適切なテンプレートをコピー
プロジェクトの種類に応じて、適切な `.tool-versions` テンプレートをコピーします：

```bash
# LLM開発の場合（Python + Node + Rust + direnv）
cp ~/Development/mac-env-config/tool-versions/llm.tool-versions .tool-versions

# Web開発の場合（Node + direnv）
cp ~/Development/mac-env-config/tool-versions/web.tool-versions .tool-versions

# 最小構成の場合（Python + Node + direnv）
cp ~/Development/mac-env-config/tool-versions/base.tool-versions .tool-versions
```

#### ステップ3: 必要なバージョンをインストール
```bash
asdf install
```

このコマンドで、`.tool-versions` に記載されているすべての言語・ツールのバージョンがインストールされます。

#### ステップ4: direnv を設定（自動環境切替を有効化）
```bash
echo "use asdf" > .envrc
direnv allow
```

これにより、プロジェクトディレクトリに `cd` するだけで、自動的に正しいバージョンの環境が有効化されます。

**一言で言うと**: 「macOS 上に、再現性と拡張性を最優先した"環境基盤"が完成した状態」です。アプリ開発・LLM・仮想化はすべてこの上に積むだけです。


#### ステップ5: 動作確認
```bash
# 一度ディレクトリを出て、再度入る
cd ..
cd my-project

# 正しいバージョンが自動有効化されているか確認
python --version  # .tool-versions で指定したバージョンが表示される
node --version    # .tool-versions で指定したバージョンが表示される
rustc --version   # LLM環境の場合、Rustのバージョンも表示される
```

#### 補足: テンプレートの選択ガイド

| プロジェクトタイプ | 推奨テンプレート | 含まれるツール |
|-------------------|----------------|---------------|
| LLM / AI開発 | `llm.tool-versions` | Python, Node, Rust, direnv |
| Web / Frontend開発 | `web.tool-versions` | Node, direnv |
| 汎用開発（最小構成） | `base.tool-versions` | Python, Node, direnv |

```bash
asdf install
```

このコマンドで、`.tool-versions` に記載されているすべての言語・ツールのバージョンがインストールされます。

#### ステップ4: direnv を設定（自動環境切替を有効化）
```bash
echo "use asdf" > .envrc
 direnv allow
```

これにより、プロジェクトディレクトリに `cd` するだけで、自動的に正しいバージョンの環境が有効化されます。

#### ステップ5: 動作確認
```bash
# 一度ディレクトリを出て、再度入る
cd ..
cd my-project

# 正しいバージョンが自動有効化されているか確認
python --version  # .tool-versions で指定したバージョンが表示される
node --version    # .tool-versions で指定したバージョンが表示される
rustc --version   # LLM環境の場合、Rustのバージョンも表示される
```

#### 補足: テンプレートの選択ガイド

| プロジェクトタイプ | 推奨テンプレート | 含まれるツール |
|-------------------|----------------|---------------|
| LLM / AI開発 | `llm.tool-versions` | Python, Node, Rust, direnv |
| Web / Frontend開発 | `web.tool-versions` | Node, direnv |
| 汎用開発（最小構成） | `base.tool-versions` | Python, Node, direnv |

### 現在できること（現在地）

**一言で言うと**: 「macOS 上に、再現性と拡張性を最優先した"環境基盤"が完成した状態」です。アプリ開発・LLM・仮想化はすべてこの上に積むだけです。


現在の環境では、以下のことが実現できています：

- ✅ **新しいMacでも環境復旧が簡単**: `Homebrew → mac-env-config clone → asdf install` だけで環境が復旧可能
- ✅ **自動環境切替**: プロジェクトディレクトリに `cd` するだけで、正しい Python / Node / Rust が有効化
- ✅ **ミス防止**: 手動切替・ミスが発生しない（direnv × asdf の自動連携）
- ✅ **拡張可能な基盤**: LLM / Web / CLI / 将来のQEMUまで拡張可能な土台が完成

**一言で言うと**: 「macOS 上に、再現性と拡張性を最優先した"環境基盤"が完成した状態」です。アプリ開発・LLM・仮想化はすべてこの上に積むだけです。

## この後の作業（次のフェーズ）

現在の環境基盤の上に、以下の機能を追加していく予定です：

### 1. Colima + Docker Compose の実戦構成
- Docker Desktop を使わない、軽量なDocker環境の構築
- Docker Compose を使った開発環境の定義
- 実戦的な構成の整備

### 2. QEMU 用ディレクトリ・起動スクリプト
- CPU・OS検証のためのQEMU環境構築
- 起動スクリプトの整備
- 仮想化環境の標準化

### 3. bootstrap.sh による完全自動初期化
- 初回セットアップを完全自動化するスクリプト
- 新しいMacでの環境構築をワンコマンドで実行可能に
- セットアップ手順の完全自動化

### 4. LLM（MLX / Ollama）実行環境構築
- Apple Silicon向けのLLM実行環境
- MLX / Ollama のセットアップと設定
- LLM開発に特化した環境の整備

## 運用ルール

### `.tool-versions` の管理

- **原則**: 各プロジェクトで `.tool-versions` を配置する
- **テンプレート**: `mac-env-config/tool-versions/` から適切なものをコピー
- **更新**: バージョンアップが必要な場合は、テンプレートを更新し、各プロジェクトに反映

### バージョン固定の重要性

- チーム開発では、全員が同じバージョンを使用することで問題を回避
- 再現性を確保するため、`.tool-versions` でのバージョン固定は必須

### 環境の拡張

- 新しい言語やツールが必要になった場合：
  1. `mac-env-config/tool-versions/` に新しいテンプレートを追加
  2. 必要に応じて `asdf plugin add <plugin-name>` でプラグインを追加
  3. README.md に使用方法を追記

## トラブルシューティング

### direnv が動作しない場合

```bash
# direnv が有効化されているか確認
direnv version

# .envrc が許可されているか確認
direnv allow

# zsh の設定を確認
cat ~/.zshrc | grep direnv
```

### asdf でバージョンが見つからない場合

```bash
# プラグインが正しくインストールされているか確認
asdf plugin list

# 利用可能なバージョンを確認
asdf list all <plugin-name>

# バージョンをインストール
asdf install <plugin-name> <version>
```

## ライセンス

このリポジトリは個人の開発環境管理用です。自由にフォーク・改変してご利用ください。

## 参考リンク

- [asdf](https://asdf-vm.com/)
- [direnv](https://direnv.net/)
- [Homebrew](https://brew.sh/)
- [Colima](https://github.com/abiosoft/colima)
