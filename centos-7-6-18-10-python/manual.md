# 機械学習はこのサイト導入に良さげ

https://www.kkaneko.jp/dblab/index.html

# 参考文献
https://www.jetbrains.com/pycharm/download/#section=linux
この記事おもろい
https://sdsawtelle.github.io/blog/output/large-data-files-pandas-sqlite.html

# dockerコンテナ削除
```
docker ps -qa | xargs -I@ bash -c 'docker stop @ && docker rm @'
```

# dockerイメージ作成
```
time docker build -t centos-7-6-18-10-python . | tee log
```

# dockerイメージ削除
```
docker images | awk '$1=="<none>"{print $3}' | xargs -I@ docker rmi @
```

# dockerコンテナ作成
```
docker run --privileged --shm-size=8gb --name centos-7-6-18-10-python -itd -v /run/udev:/run/udev -v /run/systemd:/run/systemd -v /tmp/.X11-unix:/tmp/.X11-unix -v /var/lib/dbus:/var/lib/dbus -v /var/run/dbus:/var/run/dbus -v /etc/machine-id:/etc/machine-id centos-7-6-18-10-python /sbin/init
```

# dockerコンテナ潜入
```
docker exec -it centos-7-6-18-10-python /bin/bash
```

# pycharm起動
![](./1.png)
![](./2.png)
![](./3.png)
![](./4.png)
![](./5.png)
![](./6.png)
![](./7.png)
![](./8.png)
![](./9.png)
![](./10.png)
![](./11.png)
![](./12.png)
![](./13.png)