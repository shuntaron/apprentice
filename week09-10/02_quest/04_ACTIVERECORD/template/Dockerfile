FROM ruby:3.1.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs postgresql-client
RUN mkdir /todo-app2
WORKDIR /todo-app2
ADD Gemfile /todo-app2/Gemfile
ADD Gemfile.lock /todo-app2/Gemfile.lock
RUN bundle install
ADD . /todo-app2
