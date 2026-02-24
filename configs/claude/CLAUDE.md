# Claude Code Guidelines

## Bash Commands

コマンドは可能な限り `&&` で連結せず、個別に実行すること。

理由: allow list による自動承認を有効活用するため。単独コマンドは allow list にあれば承認不要で実行できるが、`&&` で連結すると承認が必要になる場合がある。
