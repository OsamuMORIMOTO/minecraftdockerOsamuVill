FROM centos:7

RUN \
exec >& /var/log/build.log && \
set -x && \
yum -y install java wget git maven && \
mkdir /opt/docker && \
cd /opt/docker && \
wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar && \
java -jar BuildTools.jar && \
java -jar craftbukkit-1.10.2.jar && \
sed -i 's/false/true/' eula.txt && \
mkdir /opt/docker/plugins && \
mkdir /opt/docker/git && \
cd /opt/docker/git && \
git clone git://github.com/webbukkit/dynmap.git && \
cd ./dynmap && \
git checkout refs/tags/2.3 && \
mvn install && \
cp ./target/dynmap-2.3.jar /opt/docker/plugins

WORKDIR /opt/docker
CMD ["java","-jar","craftbukkit-1.10.2.jar"]
