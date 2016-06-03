FROM ruby:2.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

#nokogiri speedup 
RUN apt-get install -y libxml2 libxml2-dev libxslt1-dev
ENV NOKOGIRI_USE_SYSTEM_LIBRARIES 1

RUN git clone https://github.com/dtulibrary/rubycas-server /myapp
WORKDIR /myapp
#COPY Gemfile* *.gemspec /myapp/
RUN bundle install
ADD config.yml /myapp
