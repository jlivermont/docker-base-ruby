FROM jlivermont/docker-base:11

ARG VCS_REF

LABEL org.label-schema.vcs-ref=$VCS_REF
LABEL org.label-schema.vcs-url="https://github.com/jlivermont/docker-base-sinatra"

RUN apk add --no-cache --virtual .build-deps \
    ruby \
    ruby-bundler \
    && apk del .build-deps

CMD ["irb"]
