#!/bin/bash

: ${DRUID_PREFIX:=/usr/local/druid}

while ! nc -z druid-hadoop-demo 19888; do  
  >&2 echo "hadoop is unavailable - sleeping"
  sleep 3
done

mkdir -p $DRUID_PREFIX/conf/druid/single-server/micro-quickstart/_common/hadoop-xml
cp /shared/hadoop_xml/*.xml $DRUID_PREFIX/conf/druid/single-server/micro-quickstart/_common/hadoop-xml/

# start
./$DRUID_PREFIX/bin/start-micro-quickstart &

# Wait for any process to exit
wait -n
  
# Exit with status of process that exited first
exit $?
