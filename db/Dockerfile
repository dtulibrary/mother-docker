FROM debian:jessie
MAINTAINER docker@dtic.dk

RUN apt-get -q update && \
    apt-get -yq install postgresql-9.4

USER postgres

RUN pg_ctlcluster 9.4 main start && \
    createuser --createdb db && \
    echo "alter role db with password 'db'" | psql && \
    export PGHOST=localhost PGUSER=db PGPASSWORD=db && \
    createdb alerting && \
    createdb auth && \
    createdb docdel && \
    createdb docstore && \
    createdb findit && \
    createdb sendit && \
    createdb covers && \
    unset PGHOST PGUSER PGPASSWORD && \
    pg_ctlcluster 9.4 main stop && \
    echo "host all db 172.22.0.1/0 md5" >> /etc/postgresql/9.4/main/pg_hba.conf && \
    echo "hostssl all db 172.22.0.1/0 md5" >> /etc/postgresql/9.4/main/pg_hba.conf && \
    echo "listen_addresses = '*'" >> /etc/postgresql/9.4/main/postgresql.conf

VOLUME /var/lib/postgresql

EXPOSE 5432

CMD exec pg_ctlcluster --foreground 9.4 main start
