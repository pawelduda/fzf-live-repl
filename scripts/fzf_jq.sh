#!/usr/bin/env bash

jq_color_opt=""
json_document=

while getopts c-: opt; do
  case $opt in
    c )
      jq_color_opt=-C
      shift
      ;;
    - )
      long_opt=$OPTARG
      case $long_opt in
        c | color | colour )
          jq_color_opt=-C
          shift
          ;;
        * )
          ;;
      esac
      ;;
    * )
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

