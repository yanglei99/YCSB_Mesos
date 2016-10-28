# reference https://github.com/brianfrankcooper/YCSB/tree/master/jdbc

FROM ubuntu:14.04

MAINTAINER Yang Lei <yanglei@us.ibm.com>

# Folder structure: 
#        Dockerfile
#        run.sh 
#
# To build image once:
#
#        docker build -t ycsb .
#
#
# To run container:
#
#		check ENV for other possible changes

WORKDIR /ycsb

# Prep Installation

RUN apt-get update && apt-get install -y git curl

# Install JDK

RUN apt-get install -y openjdk-7-jdk 

# Install Maven

RUN apt-get install -y wget && wget http://mirror.cogentco.com/pub/apache/maven/maven-3/3.1.1/binaries/apache-maven-3.1.1-bin.tar.gz
RUN mkdir -p /usr/local/apache-maven && mv apache-maven-3.1.1-bin.tar.gz /usr/local/apache-maven && cd /usr/local/apache-maven && tar -xzvf apache-maven-3.1.1-bin.tar.gz

RUN ln -s /usr/local/apache-maven/apache-maven-3.1.1/bin/mvn /usr/bin/mvn && mvn --version

# Build YCSB

RUN \
	git clone https://github.com/brianfrankcooper/YCSB.git ;\
	cd YCSB ;\
	mvn clean package -DskipTests

WORKDIR /ycsb/YCSB

# Install JQ for processing JSON

RUN wget http://stedolan.github.io/jq/download/linux64/jq 
RUN chmod +x jq && cp jq /usr/bin

# COPY run.sh

ADD *.sh /ycsb/YCSB/
RUN chmod +x *.sh

ENV YCSB_OP load
ENV YCSB_DB jdbc
ENV YCSB_WORKLOAD workloada
ENV YCSB_PROPERTIES db.properties
ENV YCSB_CP mysql-connector-java.jar

VOLUME /ycsb/YCSB

CMD ["./run.sh"]
