#!/usr/bin/env bash

#Q="$@"
Q=Dockerfile
#
#curl -s "https://github.com/search?p=1&q=$Q" | grep -oPi 'https?://github\.com(/[0-9a-z\-]{1,}){1,}' | \
#grep -vP '(about|contact|events|fluidicon|pricing|search|search/count|security|site/privacy|site/terms)$'

RT=$(curl -s "https://github.com/search?p=2&q=Dockerfile" | grep -Po '(?<=data-search-type="Repositories">)[0-9]+[KMG]' | head -n1)
MX_CNT=0
[ -z $(echo $RT | grep -P 'G$') ] && MX_CNT=$(bc<<<"$(echo $RT | grep -Po '[0-9]+')*1000000000")
[ -z $(echo $RT | grep -P 'M$') ] && MX_CNT=$(bc<<<"$(echo $RT | grep -Po '[0-9]+')*1000000")
[ -z $(echo $RT | grep -P 'K$') ] && MX_CNT=$(bc<<<"$(echo $RT | grep -Po '[0-9]+')*1000")

for (( CNT=1;$CNT<=$MX_CNT;CNT++ ));do
  curl -s "https://github.com/search?p=$CNT&q=$Q" | grep -oPi 'https?://github\.com(/[0-9a-z\-]{1,}){1,}' | \
  grep -vP '(about|contact|events|fluidicon|pricing|search|search/count|security|site/privacy|site/terms)$'
  sleep 2
done
