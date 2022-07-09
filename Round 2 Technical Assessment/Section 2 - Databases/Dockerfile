FROM postgres
RUN apt-get update && apt-get install -y iputils-ping
COPY init.sql /docker-entrypoint-initdb.d/