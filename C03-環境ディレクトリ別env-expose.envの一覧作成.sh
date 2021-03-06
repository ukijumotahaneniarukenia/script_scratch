#!/usr/bin/env bash

usage(){
cat <<EOS
Usage:
  $0 script-env
EOS
exit 0
}

BASE_URL="https://github.com/ukijumotahaneniarukenia"

ENV_REPO=$1;shift

[ -z $ENV_REPO ] && usage

INPUT_FILE_NAME=env-expose.env
OUTPUT_FILE_NAME=app-env-expose-list.md

>$HOME/$ENV_REPO/$OUTPUT_FILE_NAME

while read tgt;do
  if [ -s $tgt/$INPUT_FILE_NAME ];then
    {
      echo "[$(echo $tgt | perl -pe 's;.*/;;g')]($BASE_URL/$ENV_REPO/blob/master/$(echo $tgt | perl -pe 's;.*/;;g')/$INPUT_FILE_NAME)"
      grep -c -P  '\-p' $tgt/$INPUT_FILE_NAME
      grep -P  '\-p' $tgt/$INPUT_FILE_NAME | awk -v ORS='' '{print ","$1$2}'
    } | xargs -n3 | \
    while read file cnt item;do
      for (( i=0;i<$cnt;i++));do
        echo $file $(echo $item | cut -d',' -f$(($i+2)) | perl -pe 's/-p//;s/:/ /g')
      done
    done
  else
    echo "[$(echo $tgt | perl -pe 's;.*/;;g')]($BASE_URL/$ENV_REPO/blob/master/$(echo $tgt | perl -pe 's;.*/;;g')/$INPUT_FILE_NAME)" not-found not-found
  fi \
  | sed -r 's/ /|/g;s/^/|/;s/$/|/'
done < <(find $HOME/$ENV_REPO -mindepth 1 -type d | grep -vP '\.git|docker-log|mnt') | sort | sed '1i|環境ディレクトリ名|外部公開ポート番号|内部使用ポート番号|' | sed '2i|:--|:-:|:-:|' >>$HOME/$ENV_REPO/$OUTPUT_FILE_NAME
