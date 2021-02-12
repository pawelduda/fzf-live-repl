#!/usr/bin/env bash

jq_color_opt=""

while getopts c-: opt; do
  case $opt in
    c )
      jq_color_opt=-C
      ;;
    - )
      long_opt=$OPTARG
      case $long_opt in
        c | color | colour )
          jq_color_opt=-C
          ;;
        * )
          ;;
      esac
      ;;
    * )
      ;;
  esac
done

echo '' | fzf --print-query --preview "echo -e '{\n  \x22hello\x22: \x22world\x22\n}' | jq ${jq_color_opt} {q}"
