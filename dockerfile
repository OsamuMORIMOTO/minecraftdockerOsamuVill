FROM centos:7

RUN set -x && \
yum -y install java wget git && \
mkdir /opt/docker && \
cd /opt/docker && \
wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar && \
java -jar BuildTools.jar && \
java -jar craftbukkit-1.10.2.jar && \
sed -i 's/false/true/' eula.txt

WORKDIR /opt/docker
CMD ["java","-jar","craftbukkit-1.10.2.jar"]
