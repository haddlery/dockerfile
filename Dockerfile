# Pull base image.
FROM ubuntu:14.04
 
# Install dev tools: jdk, git etc...
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
RUN add-apt-repository -y ppa:webupd8team/java

RUN apt-get update

RUN apt-get install -y oracle-java8-installer

RUN rm -rf /var/lib/apt/lists/*
RUN rm -rf /var/cache/oracle-jdk8-installer

RUN apt-get install -y git wget
 
# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

# Define working directory.
RUN mkdir -p /usr/local
WORKDIR /usr/local

# Define default command.
CMD ["bash"]