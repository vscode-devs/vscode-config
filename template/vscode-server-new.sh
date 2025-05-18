#!/bin/sh

COMMIT_ID=${commit_id}
mkdir -p ~/.vscode-server/cli/servers/Stable-${COMMIT_ID}
tar -zxf vscode-server-linux-x64-${COMMIT_ID}.tar.gz
mv vscode-server-linux-x64  ~/.vscode-server/cli/servers/Stable-${COMMIT_ID}/server
tar -zxf vscode-cli-alpine-x64-${COMMIT_ID}.tar.gz
mv code  ~/.vscode-server/code-${COMMIT_ID}
