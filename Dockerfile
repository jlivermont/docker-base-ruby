FROM jlivermont/docker-base:21

ARG VCS_REF

LABEL org.label-schema.vcs-ref=$VCS_REF
LABEL org.label-schema.vcs-url="https://github.com/jlivermont/docker-base-sinatra"

RUN apk add --no-cache ruby ruby-bundler ruby-rake ruby-rdoc ruby-bigdecimal \
    && gem install bundler
WORKDIR /app

COPY Gemfile Gemfile.lock /app/

# Temporarily install a build environment for building native gems
RUN apk add --no-cache --virtual .build-deps shadow build-base ruby-dev sqlite-dev \
    && bundle install \
    && apk del .build-deps

USER service
CMD ["irb"]
