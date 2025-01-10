FROM golang:alpine AS build
RUN apk add --no-cache git wget build-base shadow

RUN mkdir /overlay
COPY root/ /overlay/

# From https://github.com/sourcelevel/engine-image-optim/blob/2de5967c666fc3f7f8f24e67c0c445da403a67ef/Dockerfile#L61-L64
ENV JHEAD_VERSION=3.04
RUN wget http://www.sentex.net/~mwandel/jhead/jhead-$JHEAD_VERSION.tar.gz \
    && tar zxf jhead-$JHEAD_VERSION.tar.gz \
    && cd jhead-$JHEAD_VERSION \
    && make \
    && make install

ENV GO111MODULE=on
RUN go install github.com/spraot/gphotos-cdp@7a3ce73d


FROM crazymax/alpine-s6:3.17-edge
LABEL maintainer="Jake Wharton <docker@jakewharton.com>"

ENV \
    # Fail if cont-init scripts exit with non-zero code.
    S6_BEHAVIOUR_IF_STAGE2_FAILS=2 \
    CRON="" \
    HEALTHCHECK_ID="" \
    HEALTHCHECK_HOST="https://hc-ping.com" \
    PUID="" \
    PGID="" \
    TZ="" \
    CHROMIUM_USER_FLAGS="--no-sandbox"

# Installs latest Chromium package.
RUN apk add --no-cache \
      libstdc++ \
      chromium \
      harfbuzz \
      nss \
      freetype \
      ttf-freefont \
      tzdata \
      curl \
    && rm -rf /var/cache/* \
    && mkdir /var/cache/apk

COPY --from=build /go/bin/gphotos-cdp /usr/bin/jhead /usr/bin/
COPY root/ /
