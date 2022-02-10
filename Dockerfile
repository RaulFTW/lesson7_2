FROM ubuntu:20.04

ENV TZ=Asia/Tashkent
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install -y tzdata git curl default-jdk maven

RUN mkdir -p /root/.ssh
ADD ../id_rsa /root/.ssh/id_rsa
RUN chmod 700 /root/.ssh/id_rsa
RUN echo "Host github.com\n\tStrictHostKeyChecking no\n" >> /root/.ssh/config

RUN git clone git@github.com:boxfuse/boxfuse-sample-java-war-hello.git /usr/local/boxfuse-sample-java-war-hello
RUN cd /usr/local/boxfuse-sample-java-war-hello && mvn package

