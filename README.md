# Chius Homebrew Tap

[![brew test-bot](https://github.com/chius-me/homebrew-tap/actions/workflows/tests.yml/badge.svg)](https://github.com/chius-me/homebrew-tap/actions/workflows/tests.yml)

个人 [Homebrew](https://brew.sh) Tap，用于发布和维护命令行工具（Formula）及 macOS 应用（Cask）。

## 已收录软件

| 名称 | 类型 | 说明 |
| --- | --- | --- |
| [Favicon Fisher](https://github.com/chius-me/favicon-fisher) | Cask | 原生 macOS 菜单栏工具，发现、预览、复制和保存网站图标 |

Favicon Fisher 需要 macOS 14+，同一个安装包支持 Apple Silicon 和 Intel。当前免费版本使用 ad-hoc 签名，未经过 Apple 公证；首次打开如被拦截，请在确认来源后到「系统设置 → 隐私与安全 → 仍要打开」允许此应用。

```sh
brew install --cask chius-me/tap/favicon-fisher
brew upgrade --cask chius-me/tap/favicon-fisher
```

[下载与发布说明](https://github.com/chius-me/favicon-fisher/releases/latest) · [使用说明](https://github.com/chius-me/favicon-fisher/blob/main/docs/macos.md)

## 使用

添加 Tap：

```sh
brew tap chius-me/tap
```

其他软件也可直接用完整名称安装（将 `<formula>` 或 `<cask>` 替换为实际名称）：

```sh
brew install chius-me/tap/<formula>
brew install --cask chius-me/tap/<cask>
```

更新：

```sh
brew update
brew upgrade
```

移除 Tap：

```sh
brew untap chius-me/tap
```

## 添加第一个软件

- `Formula/`：命令行工具的 `.rb` 配方。
- `Casks/`：macOS 应用的 `.rb` 定义。
- `.github/workflows/tests.yml`：在 macOS 和 Linux 上运行 Homebrew 检查；在 PR 中构建并上传 bottle。
- `.github/workflows/publish.yml`：手动发布通过检查的 PR 中的 bottle。

先运行 `brew tap chius-me/tap`，再从软件的正式发行包生成配方：

```sh
brew create --tap chius-me/tap https://example.com/my-tool-1.0.0.tar.gz
```

上面的地址是占位示例，需替换为实际发行包地址。按照 [Adding Software to Homebrew](https://docs.brew.sh/Adding-Software-to-Homebrew) 完善生成的配方，填写真实的下载地址、SHA256、许可证、依赖、安装步骤和 `test do`。

`brew tap` 默认会将仓库克隆到 Homebrew 的 Taps 目录。生成配方后，在 `brew --repository chius-me/tap` 输出的目录中提交更改并发起 PR；如果维护其他本地克隆，请先同步更改。

本地检查示例：

```sh
brew style chius-me/tap/my-tool
brew audit --strict --online chius-me/tap/my-tool
brew install --build-from-source chius-me/tap/my-tool
brew test chius-me/tap/my-tool
```

PR 检查通过并完成审阅后，在 Actions 中手动运行 **brew pr-pull**，填写 PR 编号及审阅过的完整 head SHA；也可在本地运行：

```sh
brew pr-pull --tap=chius-me/tap --head-sha=<reviewed-commit-sha> <pr-number>
```

测试和发布工作流基于 Homebrew 的 `brew tap-new` 官方模板，使用仓库自动提供的 `GITHUB_TOKEN`。Dependabot 每周检查 GitHub Actions 依赖更新。

## 文档

- [创建和维护 Tap](https://docs.brew.sh/How-to-Create-and-Maintain-a-Tap)
- [Formula Cookbook](https://docs.brew.sh/Formula-Cookbook)
- [Cask Cookbook](https://docs.brew.sh/Cask-Cookbook)
- [Homebrew 文档](https://docs.brew.sh)

## 许可证

本仓库中的配方和维护文件采用 [MIT License](LICENSE)。各软件本身遵循其各自的许可证。
