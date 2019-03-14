FROM jlivermont/docker-base:11

ARG VCS_REF

LABEL org.label-schema.vcs-ref=$VCS_REF
LABEL org.label-schema.vcs-url="https://github.com/jlivermont/docker-base-sinatra"

RUN apk add --no-cache ruby ruby-bundler

COPY Gemfile Gemfile.lock /app/
RUN bundle install
RUN rm -f /app/Gemfile*

CMD ["irb"]
