FROM ruby:3.1.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /test-api
WORKDIR /test-api
ADD Gemfile /test-api/Gemfile
ADD Gemfile.lock /test-api/Gemfile.lock
RUN bundle install
ADD . /test-api
