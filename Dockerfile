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
RUN wget -O ./paper.jar "https://paper.c0v.in"
RUN java -Xmx${_ram} -jar paper.jar
RUN sed -i -e 's/false/true/g' eula.txt

WORKDIR /server
ENTRYPOINT ["/entrypoint/entrypoint.sh"]
