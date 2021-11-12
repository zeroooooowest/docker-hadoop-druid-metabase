FROM ubuntu:18.04

USER root

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Seoul

# install dev tools
RUN apt update && apt dist-upgrade -y && apt install -y tzdata
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt install -y apt-utils tar net-tools netcat openssh-client openssh-server telnet vim curl perl sudo openjdk-8-jdk rsync

RUN echo export JAVA_HOME=`readlink -f /usr/bin/java | sed "s:bin/java::"` >> /root/.bash_profile
RUN echo export PATH=\$PATH:\$JAVA_HOME\/bin >> /root/.bash_profile
RUN . /root/.bash_profile
RUN mkdir -p /usr/java/default/bin/; ln -sf /usr/bin/java /usr/java/default/bin/java

RUN curl -s https://archive.apache.org/dist/druid/0.20.2/apache-druid-0.20.2-bin.tar.gz | tar -xz -C /usr/local/
RUN cd /usr/local && ln -s ./apache-druid-0.20.2 druid

ENV DRUID_PREFIX /usr/local/druid

COPY common.runtime.properties $DRUID_PREFIX/conf/druid/single-server/micro-quickstart/_common/


ADD bootstrap.sh /etc/bootstrap.sh
RUN chown root:root /etc/bootstrap.sh
RUN chmod 700 /etc/bootstrap.sh
ENV BOOTSTRAP /etc/bootstrap.sh

CMD ["/etc/bootstrap.sh"]

# router
EXPOSE 8888 
# coordinator
EXPOSE 8081
# broker
EXPOSE 8082
# historical
EXPOSE 8083
# overlord
EXPOSE 8090
# derby
EXPOSE 1527
