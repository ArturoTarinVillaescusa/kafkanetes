FROM centos
RUN yum update -y \
  && mkdir -p /opt/kafka \
  && cd /opt/kafka \
  && ln -s /var/run/secrets/rhel7.repo /etc/yum.repos.d/rhel7.repo \
  && yum -y install java-1.8.0-openjdk-headless tar \
  && curl -s http://apache.rediris.es/kafka/1.1.0/kafka_2.12-1.1.0.tgz | tar -xz --strip-components=1
# RUN yum -y remove tar
# RUN yum clean all
# RUN rm /etc/yum.repos.d/rhel7.repo
COPY zookeeper-server-start-multiple.sh /opt/kafka/bin/
# RUN chmod -R a=u /opt/kafka
WORKDIR /opt/kafka
VOLUME /tmp/kafka-logs /tmp/zookeeper
EXPOSE 2181 2888 3888 9092
