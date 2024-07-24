##
# builder image
##
FROM golang:1.20 as builder

ARG REPO_DIR

COPY "$REPO_DIR" /pyrin

WORKDIR /pyrin

RUN go install -ldflags="-s -w -extldflags=-static" -tags netgo,osusergo . ./cmd/...

##
# pyrind image
##
FROM alpine:latest

ARG REPO_URL
ARG PYRIN_VERSION

ENV REPO_URL="$REPO_URL" \
  PYRIN_VERSION="$PYRIN_VERSION" \
  PYRIN_USER=PYRIN \
  PYRIN_HOME=/app/data \
  PYRIN_UID=51591 \
  PATH=/app:$PATH

RUN apk --no-cache add \
  libgcc \
  libstdc++ \
  bind-tools \
  su-exec \
  grep

WORKDIR /app

RUN mkdir $PYRIN_HOME && \
  addgroup -S -g $PYRIN_UID $PYRIN_USER && \
  adduser -h $PYRIN_HOME -S -D -g '' -G $PYRIN_USER -u $PYRIN_UID $PYRIN_USER

COPY --from=builder /go/bin/pyrinwallet /app/

EXPOSE 8082 8082

USER $PYRIN_USER

CMD /app/pyrinwallet start-daemon --listen=0.0.0.0:8082 --rpcserver=$KASPAD
