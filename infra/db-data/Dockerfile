FROM debian:jessie

RUN apt-get update --yes && apt-get upgrade --yes
RUN apt-get install postgresql-client --yes

COPY volume/root/db-data.sh /root/data.sh
COPY volume/root/db-data.sql /root/data.sql

WORKDIR /root/
CMD ["bash", "data.sh"]
