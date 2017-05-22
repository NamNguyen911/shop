FROM ruby:2.4.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /yougotme
WORKDIR /yougotme
ADD Gemfile /yougotme/Gemfile
ADD Gemfile.lock /yougotme/Gemfile.lock
RUN bundle install
ADD . /yougotme