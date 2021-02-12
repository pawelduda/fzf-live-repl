#!/usr/bin/env bash

echo '' | fzf --print-query --preview 'echo -e "{\n  \x22hello\x22: \x22world\x22\n}" | jq {q}'
