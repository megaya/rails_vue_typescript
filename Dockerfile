FROM ruby:2.6.2-alpine

ENV APP_ROOT /app
RUN mkdir $APP_ROOT
WORKDIR $APP_ROOT

RUN apk add --no-cache alpine-sdk \
    nodejs-current \
    nodejs-npm \
    yarn \
    mysql-client \
    mysql-dev \
    python2 \
    tzdata

COPY Gemfile $APP_ROOT
COPY Gemfile.lock $APP_ROOT

RUN bundle install

COPY . $APP_ROOT

RUN bin/yarn install
RUN bin/rails webpacker:compile

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
