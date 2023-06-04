FROM eclipse-temurin:17-jre

ARG _ram=6G
ENV env_ram=6G
ENV env_online=true

RUN mkdir /server
RUN mkdir /entrypoint
COPY ./entrypoint.sh /entrypoint/
RUN chmod +x /entrypoint/entrypoint.sh
WORKDIR /tempserver
RUN apt update
RUN apt install -y wget
RUN wget -O ./paper.jar "https://api.papermc.io/v2/projects/paper/versions/1.19.4/builds/545/downloads/paper-1.19.4-545.jar"
RUN java -Xmx${_ram} -jar paper.jar
RUN sed -i -e 's/false/true/g' eula.txt

WORKDIR /server
ENTRYPOINT ["/entrypoint/entrypoint.sh"]
