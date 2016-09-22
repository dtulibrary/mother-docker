# Dockerfile based on https://raw.githubusercontent.com/vpetersson/redmine/master/Dockerfile-2.5

# Dockerized Redmine

FROM ubuntu:14.04

# Install required packages
RUN apt-get -qq update && \
    apt-get -qq install -y wget ruby ruby-dev build-essential imagemagick libmagickwand-dev libmysqlclient-dev apache2 apt-transport-https ca-certificates git-core sqlite3 libsqlite3-0 libsqlite3-dev && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 561F9B9CAC40B2F7 && \
    echo "deb https://oss-binaries.phusionpassenger.com/apt/passenger trusty main" > /etc/apt/sources.list.d/passenger.list && \
    apt-get -qq update && \
    apt-get -qq install -y libapache2-mod-passenger && \
    apt-get clean

# Fetch the latest redmine repo (and delete `.git`) to save space)
ENV BRANCH 2.5-stable
RUN cd /usr/local && \
    git clone https://github.com/redmine/redmine.git && \
    cd redmine && \
    git checkout $BRANCH && \
    rm -rf .git

WORKDIR /usr/local/redmine
ADD include_files/database.yml config/database.yml
RUN touch log/production.log

# Install dependencies
RUN gem install -q bundler mysql2 && \
    bundle install --without development test

ADD include_files/empty_db.sqlite sqlite/redmine.db
#RUN rake db:migrate RAILS_ENV=production
ADD include_files/dump.sql sqlite/dump.sql
RUN sqlite3 sqlite/redmine.db '.read sqlite/dump.sql'

# Add files and clean up unnecessary files
ADD include_files/redmine_apache.conf /etc/apache2/redmine_apache.conf
ADD include_files/start.sh /start.sh

EXPOSE 3000

CMD /start.sh
