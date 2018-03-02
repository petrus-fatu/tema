FROM centos:latest

EXPOSE 50001
ENV JAVA_HOME="/etc/alternatives/java_sdk_1.8.0_openjdk"
RUN yum -y install java-1.8.0-openjdk java-1.8.0-openjdk-devel
COPY source/ /var/app/source/
WORKDIR /var/app/source/
RUN ./gradlew build
CMD java -jar build/libs/gs-spring-boot-0.1.0.jar --server.address=0.0.0.0 --server.port=50001
