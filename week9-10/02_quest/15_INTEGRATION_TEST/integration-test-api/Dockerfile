FROM ruby:3.1.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs postgresql-client
RUN mkdir /integration-test-api
WORKDIR /integration-test-api
ADD Gemfile /integration-test-api/Gemfile
ADD Gemfile.lock /integration-test-api/Gemfile.lock
RUN bundle install
ADD . /integration-test-api
