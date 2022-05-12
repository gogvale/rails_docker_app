FROM ruby:2.6

LABEL maintainer="gabriel.oliveira@axented.com"

RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends \
    nodejs
COPY Gemfile* /usr/src/app/
WORKDIR /usr/src/app
RUN bundle lock --add-platform x86-mingw32 x86-mswin32 x64-mingw32 java
RUN bundle install

COPY . /usr/src/app/

CMD [ "bin/rails" , "s" , "-b" , "0.0.0.0" ]