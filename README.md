# internship-hadoop-druid-metabase

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
cp -r ~/data/chirashi_user_event /tmp/shared/
````
Create a folder to share volumes between docker containers. And copy the initially given chirashi parquet data to that folder.


### start

```shell
docker-compose up --build &
```

The minimum specifications are 4 vCPU cores and 16GiB RAMs.

If you want to execute at a lower specification, modify the micro-quickstart to nano-quickstart in Druid Dockerile and bootstrap.sh. However, nano-quickstart has very little Heap space and cannot index the provided chirashi-log file.

### put data into hdfs
```shell
docker exec -it druid-hadoop-demo bash
/usr/local/hadoop/bin/hdfs dfs -put /shared/chirashi-user-event /
exit
```
In reality, chirashi logs are accumulating in HDFS in real time(maybe spark-streaming), but now it puts in the given data directly.


### clean up

```shell
docker-compose down
```
