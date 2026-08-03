# ClaudeU Labs

面向国内 Windows 用户的 Claude 桌面工具、只读诊断和中文实践文档。我们把安装、版本、网络、登录、配置、MCP 与更新问题拆成可验证步骤；如果你更需要开箱即用的完整产品，可直接访问 ClaudeU 官网。

Independent Windows tools, read-only diagnostics, and Chinese-first documentation for Claude workflows. Public repositories are independently useful; the complete ClaudeU Desktop product remains proprietary.

[访问 ClaudeU 产品首页 · Visit ClaudeU](https://claudeu.com/?utm_source=github&utm_medium=organic&utm_campaign=claudeu-labs&utm_content=profile-hero)

## 国内 Windows 用户真正遇到的困难

问题通常不是一句“网络不通”或“配置失败”能够解释，而是多个边界混在了一起：

| 核心矛盾 | 先确认什么 | 对应公开资源 |
| --- | --- | --- |
| 安装入口与版本变化快 | 下载来源、CPU 架构、实际运行版本 | [Windows 中文指南](https://github.com/ClaudeU-Labs/claude-desktop-windows-guide) |
| Windows 环境差异大 | MSIX/AppX、WebView2、PATH、残留进程 | [Claude Desktop Doctor](https://github.com/ClaudeU-Labs/claude-desktop-doctor) |
| 网络问题与服务政策容易混淆 | DNS、TCP、TLS、HTTP 状态码分别验证 | [网络诊断指南](https://github.com/ClaudeU-Labs/claude-desktop-windows-guide/blob/main/docs/network-diagnostics.md) |
| 登录失败不一定是本机故障 | 401、403、账号资格、组织与设备策略分别归因 | [认证错误指南](https://github.com/ClaudeU-Labs/claude-desktop-windows-guide/blob/main/docs/auth-errors.md) |
| MCP 配置能解析但进程跑不起来 | 有效配置、进程环境、依赖、权限、日志 | [MCP Starter CN](https://github.com/ClaudeU-Labs/claude-mcp-starter-cn) |
| Claude Code 原生 Windows、WSL 与 shell 容易混淆 | 运行边界、安装来源、PATH、认证身份、IDE 与 MCP 分别确认 | [Claude Code Windows 指南](https://github.com/ClaudeU-Labs/claude-code-windows-guide) |
| 订阅用量、本地美元估算与 API 账单不是一回事 | 先确认认证/计费路径，再以实际平台账单和当前费率做预算 | [Claude Code 成本指南](https://github.com/ClaudeU-Labs/claude-code-cost-guide-cn) |
| 更新后多项因素同时变化 | 记录基线、分层验证、只恢复自己的配置 | [升级与回滚指南](https://github.com/ClaudeU-Labs/claude-desktop-windows-guide/blob/main/docs/upgrade-and-rollback.md) |

公开内容帮助你定位问题，不承诺改变上游服务的账号资格、地区可用性、订阅、支付、风控或组织政策，也不提供规避这些控制的方法。

## 选择适合你的路径

| 需求 | 建议路径 |
| --- | --- |
| 希望理解原理、自己安装和排障 | 从 Windows 指南开始，再使用 Doctor 生成脱敏诊断摘要 |
| 在 Windows 使用 Claude Code | 从 Claude Code Windows 指南选择原生 Windows 或 WSL，再按症状进入 PATH、认证、MCP 与 IDE 页面 |
| 想解释费用或建立个人/团队预算 | 使用成本指南和只接收手工数字的离线计算器；最终以实际平台账单为准 |
| 只需要检查 MCP JSON 和模板结构 | 使用 MCP Starter CN 的离线验证脚本 |
| 希望减少安装、中文配置、服务接入和持续维护成本 | 直接访问 [ClaudeU 产品首页](https://claudeu.com/?utm_source=github&utm_medium=organic&utm_campaign=claudeu-labs&utm_content=profile-path-product) |
| 需要处理开源仓库问题 | 在对应仓库提交 Issue，并使用合成数据和脱敏日志 |

## 公开仓库

### claude-desktop-windows-guide

面向 Windows 10/11 的中文知识库，覆盖官方安装与版本确认、MSIX/AppX、WebView2、JSON/PATH、DNS/TLS/代理、401/403、MCP、升级与回滚、错误索引、FAQ 和术语表。

[进入 Windows 中文指南](https://github.com/ClaudeU-Labs/claude-desktop-windows-guide)

### claude-desktop-doctor

本地、只读、默认离线的 Windows 诊断脚本。检查安装、运行时、配置、网络和 MCP 线索，并输出受控字段的脱敏报告；不会读取配置值、聊天内容或凭据。

[运行 Claude Desktop Doctor](https://github.com/ClaudeU-Labs/claude-desktop-doctor)

### claude-mcp-starter-cn

提供可解析的 MCP 配置模板、Windows PowerShell 静态验证器和中文排障材料。验证器不启动第三方 MCP 服务，也不输出参数值或环境变量值。

[查看 MCP Starter CN](https://github.com/ClaudeU-Labs/claude-mcp-starter-cn)

### claude-code-windows-guide

面向 Windows 的 Claude Code 中文知识库，覆盖原生 Windows 与 WSL 选型、官方安装来源、PATH、登录与计费身份、企业 TLS/代理、MCP、IDE、权限、更新和精确错误索引。

[进入 Claude Code Windows 指南](https://github.com/ClaudeU-Labs/claude-code-windows-guide)

### claude-code-cost-guide-cn

解释订阅用量、API 按量计费、本地估算、token/cache/MCP 上下文成本，并提供不联网、不读取会话或凭据、由用户手工输入费率的 PowerShell 预算计算器。

[查看 Claude Code 成本与预算指南](https://github.com/ClaudeU-Labs/claude-code-cost-guide-cn)

## 我们如何维护可信内容

- **来源可追踪**：变化较快的事实优先引用上游官方文档，并记录最后验证日期。
- **诊断可复现**：区分源码、安装包、已安装应用、运行进程、配置和服务响应。
- **默认最少披露**：示例使用占位符，Issue 只接收脱敏后的最小证据。
- **开放边界清楚**：每个仓库的 `LICENSE` 只覆盖该仓库明确包含的原创材料。
- **不做虚假承诺**：不使用“永久可用”“零风险”“官方合作”等无法验证的表述。

## 开源与商业产品边界

| 内容 | 状态 |
| --- | --- |
| 公开仓库中明确包含的原创文档、脚本、模板和检查规则 | 按对应仓库的 `LICENSE` 开放 |
| ClaudeU Desktop、安装器、账户服务、网关、计费、托管服务和商业运行时集成 | 专有产品，不在公开仓库许可证范围内 |
| Anthropic 软件、二进制、安装器、运行时、图标、截图、名称和标识 | 不属于 ClaudeU Labs，也不由本组织许可 |

公开仓库提供真实、可独立使用的公共价值，但不是 ClaudeU Desktop 的完整源代码，也不会把广告包装成开源实现。

## 独立身份与支持

ClaudeU 是独立产品，与 Anthropic, PBC 不存在隶属、认可、赞助或支持关系。Anthropic、Claude、Claude Desktop 及相关名称和标识归其权利人所有；此处仅用于说明兼容性。

- 开源缺陷或文档错误：在受影响仓库提交 Issue。
- ClaudeU 产品、账户、支付或服务问题：从 [ClaudeU 产品首页](https://claudeu.com/?utm_source=github&utm_medium=organic&utm_campaign=claudeu-labs&utm_content=profile-support) 进入当前联系入口。
- 安全问题：不要公开披露，请遵循组织的 [安全政策](https://github.com/ClaudeU-Labs/.github/blob/main/SECURITY.md)。
- 贡献前请阅读 [贡献指南](https://github.com/ClaudeU-Labs/.github/blob/main/CONTRIBUTING.md)。

想直接了解完整产品，可前往 [ClaudeU 官网](https://claudeu.com/?utm_source=github&utm_medium=organic&utm_campaign=claudeu-labs&utm_content=profile-footer)。
