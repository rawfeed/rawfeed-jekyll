FROM ruby:3.4-slim

LABEL description="rawfeed-jekyll - A batteries-included Jekyll framework and CLI"
LABEL maintainer="William C. Canin <hello.williamcanin@gmail.com>"

RUN apt-get update -qq && \
  apt-get install -y --no-install-recommends \
  build-essential \
  git \
  imagemagick \
  libffi-dev \
  webp \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV RAWFEED_DEV_PATH=/srv/jekyll \
  BUNDLE_PATH=/usr/local/bundle \
  JEKYLL_ENV=development

WORKDIR /srv/jekyll

COPY Gemfile Gemfile.lock rawfeed.gemspec ./
COPY lib/ lib/
COPY exe/ exe/

RUN bundle install --jobs "$(nproc)" --retry 3

COPY . .

EXPOSE 4000 35729

CMD ["bundle", "exec", "rawfeed", "serve", "--host", "0.0.0.0", "--livereload"]
