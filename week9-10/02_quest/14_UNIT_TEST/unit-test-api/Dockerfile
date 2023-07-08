FROM ruby:3.1.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs postgresql-client
RUN mkdir /unit-test-api
WORKDIR /unit-test-api
ADD Gemfile /unit-test-api/Gemfile
ADD Gemfile.lock /unit-test-api/Gemfile.lock
RUN bundle install
ADD . /unit-test-api
