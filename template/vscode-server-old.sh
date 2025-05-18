#!/bin/sh

COMMIT_ID=${commit_id}
mkdir -p ~/.vscode-server/bin/${COMMIT_ID}
tar -zxf vscode-server-linux-x64-${COMMIT_ID}.tar.gz --strip-components=1 -C ~/.vscode-server/bin/${COMMIT_ID}
