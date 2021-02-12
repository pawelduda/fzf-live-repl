#!/usr/bin/env bash

jq_color_opt=""
json_document=

function usage() {
  local exit_val=${1:-0}
cat <<'.'
NAME
  fzf_jq.sh - a toy REPL for `jq` built on `fzf`

SYNOPSIS

  fzf_jq.sh [-c | --color | --colour ] [ <FILE> ]

DESCRIPTION

  This is a toy REPL for `jq`. When run without any arguments, you will begin exploring the JSON document:

    ```js
    {
        "hello": "world"
    }
    ```


  You may specify your own file to explore by providing its path on the command line.

  By default, `jq` disables colorized output when run non-interactively. You may force it on by providing any of the colorization options.

OPTIONS

    -c            --   Force `jq`'s output to be colorized.
    --color
    --colour

EXAMPLES

    $ fzf_jq.sh --color /tmp/some-big-file.json
.
  exit $exit_val
}

while getopts ch-: opt; do
  case $opt in
    c )
      jq_color_opt=-C
      shift
      ;;
    h )
      usage
      ;;
    - )
      long_opt=$OPTARG
      case $long_opt in
        c | color | colour )
          jq_color_opt=-C
          shift
          ;;
        h | help )
          usage
          ;;
        * )
          usage 1
          ;;
      esac
      ;;
    * )
      usage 1
      ;;
  esac
done

if [[ ${#*} -ge 1 ]]; then
  json_document="$1"
  shift
fi

if [[ -z "$json_document" ]]; then
  echo '' | fzf --print-query --preview "echo -e '{\n  \x22hello\x22: \x22world\x22\n}' | jq ${jq_color_opt} {q}"
else
  echo '' | fzf --print-query --preview "jq ${jq_color_opt} {q} ${json_document}"
fi

