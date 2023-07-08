FROM ruby:3.1.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs postgresql-client
RUN mkdir /todo-app
WORKDIR /todo-app
ADD Gemfile /todo-app/Gemfile
ADD Gemfile.lock /todo-app/Gemfile.lock
RUN bundle install
ADD . /todo-app
