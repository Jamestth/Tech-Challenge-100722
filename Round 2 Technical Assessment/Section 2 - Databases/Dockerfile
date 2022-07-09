FROM postgres
 ENV POSTGRES_USER postgres
 ENV POSTGRES_PASSWORD PASSWORD
 ENV POSTGRES_DB mydatabase

RUN apt-get update && apt-get install -y iputils-ping
COPY init.sql /docker-entrypoint-initdb.d/