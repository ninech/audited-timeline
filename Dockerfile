FROM ruby:3.2-alpine

WORKDIR /app

RUN apk add -U  \
    bash less tzdata shared-mime-info build-base libc6-compat git && \
    gem install bundler bundler-audit

COPY *.gemspec Gemfile Gemfile.lock VERSION ./
RUN BUNDLER_VERSION=$(grep -A 1 "BUNDLED WITH" Gemfile.lock | grep -v "BUNDLED WITH" | tr -d '[:space:]') && \
    gem install "bundler:$BUNDLER_VERSION" && \
    bundle install --jobs $(nproc)

COPY . ./
