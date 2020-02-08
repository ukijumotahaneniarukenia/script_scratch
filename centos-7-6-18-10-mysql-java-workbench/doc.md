# dockerイメージ作成
```
time docker build -t centos-7-6-18-10-mysql-java-workbench --build-arg PYTHON_VERSION=3-7-4 --build-arg GIT_VERSION=2-24-1 --build-arg JAVA_VERSION=11 --build-arg MYSQL_VERSION=8-X-X --build-arg MYSQL_WORKBENCH_VERSION=8-0-19 --build-arg CONTAINER_NAME=centos-7-6-18-10-mysql-java-workbench --build-arg OS_VERSION=$(echo centos-7-6-18-10-mysql-java-workbench | grep -Po '[a-z]{1,}(?:-[0-9]{1,}){1,}') . | tee log
```

# dockerコンテナ起動
```
docker run --privileged --shm-size=4gb -v /sys/fs/cgroup:/sys/fs/cgroup:ro -v /etc/localtime:/etc/localtime -v /run/udev:/run/udev -v /run/systemd:/run/systemd -v /tmp/.X11-unix:/tmp/.X11-unix -v /var/lib/dbus:/var/lib/dbus -v /var/run/dbus:/var/run/dbus -v /etc/machine-id:/etc/machine-id -p 3306:3306 --name centos-7-6-18-10-mysql-java-workbench -itd centos-7-6-18-10-mysql-java-workbench
```

# dockerコンテナ潜入
```
docker exec -it centos-7-6-18-10-mysql-java-workbench /bin/bash
```

# dockerコンテナ削除

- ALL削除

```
docker ps -qa | xargs -I@ bash -c 'docker stop @ && docker rm @'
```

- Exit削除

```
docker ps -a | grep Exit | awk '{print $1}' | xargs -I@ bash -c 'docker stop @ && docker rm @'
```

- 単一削除

```
docker ps -a | grep -P $(pwd | sed 's;.*/;;') | awk '{print $1}' | xargs -I@ bash -c 'docker stop @ && docker rm @'
```

# dockerイメージ削除

- none削除

```
docker images | awk '$1=="<none>"{print $3}' | xargs -I@ docker rmi @
```

- 単一削除

```
docker ps -a | grep -P $(pwd | sed 's;.*/;;') | awk '{print $1}' | xargs -I@ docker rmi @
```