FROM ubuntu:trusty
MAINTAINER Dave Disser <disser@gmail.com>
RUN apt-get update
RUN apt-get install -y make gcc wget openjdk-7-jre
RUN wget http://apache.cs.utah.edu/lucene/solr/4.9.0/solr-4.9.0.tgz -O /tmp/pkg.tar.gz
RUN (cd /tmp && tar zxf pkg.tar.gz && mv solr-* /opt/solr)
RUN rm -rf /tmp/*
ADD run.sh /usr/local/bin/run
RUN chmod +x /usr/local/bin/run

EXPOSE 8983
CMD ["/usr/local/bin/run"]
