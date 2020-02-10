#!/bin/bash

#環境ディレクトリに移動して
cd ~/script-env/ubuntu-16-04-postgres-python-vim

#OSバージョン別にファイル作成（ことなる可能性があるので。デフぉはほぼおなじなはずとしんじている）
grep -Po '(?<=OS_VERSION-)(.*)(?=\.sh)' Dockerfile | xargs -I@ echo "cp ~/script-repo/ubuntu-19-10-@.sh ~/script-repo/ubuntu-16-04-@.sh"
