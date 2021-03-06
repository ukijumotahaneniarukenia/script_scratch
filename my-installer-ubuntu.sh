#デスクトップの日本語化

#対話入力

LANG=C xdg-user-dirs-gtk-update

#rootユーザーのパスワード設定

#対話入力

sudo passwd root

su root

id
#uid=0(root) gid=0(root) groups=0(root)


#chromeのインストール

#rootユーザーで実行

#https://qiita.com/spiderx_jp/items/e6189a736ddec14ffa23

rm -rf $HOME/.config/google-chrome
sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
apt update
apt install -y google-chrome-stable

#dokcerのインストール

#rootユーザーで実行

- https://qiita.com/tkyonezu/items/0f6da57eb2d823d2611d

#古いバージョンの削除
apt remove docker docker-engine docker.io containerd runc

#必要なパッケージのインストール
apt -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

#GPG 公開鍵のインストール

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

#公開鍵のフィンガープリントの確認

apt-key fingerprint 0EBFCD88

#pub   rsa4096 2017-02-22 [SCEA]
#      9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88
#uid           [  不明  ] Docker Release (CE deb) <docker@docker.com>
#sub   rsa4096 2017-02-22 [S]


#リポジトリの設定
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"


#docker-ceのインストール
apt update


apt install -y docker-ce


#一般ユーザーをdockerグループに割り付ける

gpasswd -d aine docker
gpasswd -a aine docker


id aine
#uid=1000(aine) gid=1000(aine) groups=1000(aine),4(adm),24(cdrom),27(sudo),30(dip),46(plugdev),120(lpadmin),131(lxd),132(sambashare),998(docker)


#サービス起動確認
systemctl | grep docker
#  sys-devices-virtual-net-docker0.device                                               loaded active     plugged   /sys/devices/virtual/net/docker0
#  sys-subsystem-net-devices-docker0.device                                             loaded active     plugged   /sys/subsystem/net/devices/docker0
#  docker.service                                                                       loaded active     running   Docker Application Container Engine
#  docker.socket                                                                        loaded active     running   Docker Socket for the API


#マシン再起動（一般ユーザでも実行できるか確認）

#動作確認

docker run hello-world


#vim本体のインストール

#rootユーザーで実行

cd /usr/local/src

git clone https://github.com/ukijumotahaneniarukenia/script-repo.git


cd /usr/local/src/script-repo

bash ubuntu-00-00-install-vim-system.sh

#ユーザー環境のインストール

#rootユーザー,一般ユーザー用
bash ubuntu-00-00-install-vim-user.sh
bash ubuntu-00-00-install-vim_plug.sh
bash ubuntu-00-00-config-dotfile-system.sh
bash ubuntu-00-00-config-env-system.sh

#自作コマンドの登録など
find $HOME/script-cmd -type f -name "mycmd-install-bash" | bash
