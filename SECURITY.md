# Security Policy · 安全政策

## Reporting a vulnerability

请勿在公开 Issue、Discussion、Pull Request、日志或截图中披露漏洞、凭据或用户数据。

Do not disclose vulnerabilities, credentials, or user data in public issues, discussions, pull requests, logs, or screenshots.

For a vulnerability in a ClaudeU Labs public repository:

1. Open the affected repository's **Security** tab.
2. Use **Report a vulnerability** if private vulnerability reporting is enabled.
3. If private reporting is unavailable, contact the maintainers through [ClaudeU Security](https://claudeu.com/zh-CN/security) and identify the affected public repository. Do not include secrets in the first message.

For ClaudeU Desktop, account, gateway, billing, hosted-service, or customer-data concerns, use [ClaudeU Security](https://claudeu.com/zh-CN/security). Those systems are outside the public repositories' issue trackers.

## What to include

- affected repository, release, commit, or documentation revision;
- impact and realistic attack conditions;
- minimal reproduction steps using synthetic data;
- whether credentials, customer data, or production systems may be affected;
- suggested mitigation, if known;
- a safe way for maintainers to request additional evidence.

Never send real tokens, cookies, certificates, private keys, full user profiles, or unredacted customer data. Redact local usernames, paths, IP addresses, machine identifiers, request identifiers, and account identifiers.

## Supported scope

For released tools, security fixes target the latest release and the default branch. Documentation and compatibility data are maintained on the default branch. Older releases may be evaluated case by case; this policy does not promise a support lifetime or response SLA.

This policy covers original material in ClaudeU Labs public repositories. It does not authorize testing Anthropic systems, ClaudeU production services, third-party providers, other users' accounts, or infrastructure you do not own or have explicit permission to test.

## Disclosure

Please allow maintainers to reproduce, assess, and coordinate a fix before public disclosure. We will credit reporters when requested and legally permitted. Submitting a report does not create a bounty or payment obligation unless a separate written program explicitly states one.
