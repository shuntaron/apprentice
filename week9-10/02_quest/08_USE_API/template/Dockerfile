FROM ruby:3.1.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs postgresql-client
RUN mkdir /use-api
WORKDIR /use-api
ADD Gemfile /use-api/Gemfile
ADD Gemfile.lock /use-api/Gemfile.lock
RUN bundle install
ADD . /use-api
