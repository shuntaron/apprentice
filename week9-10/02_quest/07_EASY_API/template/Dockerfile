FROM ruby:3.1.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /easy-api
WORKDIR /easy-api
ADD Gemfile /easy-api/Gemfile
ADD Gemfile.lock /easy-api/Gemfile.lock
RUN bundle install
ADD . /easy-api
