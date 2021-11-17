# docker-hadoop-druid-metabase

This repo is for constructing an infrastructure environment using docker-compose, include Hadoop(Pseudo-Distributed Mode), Druid(Single-Server), Metabase.

### PORT
|Server|Port|
|------|---|
|HDFS Web|50070|
|Yarn ResourceManager Web|8088|
|MapReduce HistoryServer|19888|
|Druid QueryServer|8888|
|Metabase|3000|

### set up
```shell
mkdir -p /tmp/shared
````
Create a folder to share volumes between docker containers. And if you have given data, copy to that folder.


### start

```shell
docker-compose up --build &
```

The minimum specifications are 4 vCPU cores and 16GiB RAMs.

If you want to execute at a lower specification, modify the micro-quickstart to nano-quickstart in Druid Dockerile and bootstrap.sh. However, nano-quickstart has very little Heap space and cannot index large file.


### clean up

```shell
docker-compose down
```
