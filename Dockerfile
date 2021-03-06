FROM ruby:2.6

LABEL maintainer="gabriel.oliveira@axented.com"

RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends \
    nodejs
COPY Gemfile* /usr/src/app/
WORKDIR /usr/src/app
RUN bundle lock --add-platform arm-linux-eabihf && bundle add nokogiri
RUN bundle install

COPY . /usr/src/app/

CMD [ "bin/rails" , "s" , "-b" , "0.0.0.0" ]