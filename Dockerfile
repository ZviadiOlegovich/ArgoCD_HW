FROM alpine:3.18.2

RUN apk add libc6-compat

ADD build/app /usr/src/app/app

RUN ln -s /usr/src/app/app /usr/bin/app

WORKDIR /usr/src/app

ENTRYPOINT ["app"]