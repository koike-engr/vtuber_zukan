FROM ruby:2.7.2
RUN apt-get update -qq && apt-get install -y nodejs default-mysql-client iputils-ping vim

# perf: build高速化: gemが同じなら、bundle installをcache使って早く済ませる
COPY ./app/Gemfile* /app_container/tmp/cache/
WORKDIR /app_container/tmp/cache/
RUN bundle install

WORKDIR /app_container
# COPY ./app/Gemfile /app_container/Gemfile
# COPY ./app/Gemfile.lock /app_container/Gemfile.lock
# RUN bundle install
COPY ./app /app_container